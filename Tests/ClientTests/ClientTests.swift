
import XCTest
@testable import Client


final class ClientTests: XCTestCase {
  static var allTests = [
    ("testClientConstruct", testClientConstruct),
    //("testMenuInvalidApiKey", testMenuInvalidApiKey),
    //("testMenuInvalidPartner", testMenuInvalidPartner),
    //("testMenuInvalidLocation", testMenuInvalidLocation),
    //("testMenuDownload", testMenuDownload),
    //("testShopInfo", testShopInfo),
    //("testMemberVerify", testMemberVerify)
  ]

  private func client(apiKey: APIKey? = "AIzaSyBpeziyO5YE-EIyt8ervAX8eSM0qFHd4T4",
              partner: PartnerCode? = "mm",
              location: LocationCode? = "sacramento") -> Bloombox {
    return Bloombox(settings: Bloombox.Settings(
      apiKey: apiKey,
      partner: partner,
      location: location))
  }

  private func emptyClient() -> Bloombox {
    return client(apiKey: nil, partner: nil, location: nil)
  }

  // MARK: - Basic Tests
  func testClientConstruct() {
    let _ = client()
  }

  // MARK: - Menu Tests
//  func testMenuDownload() throws {
//    let client: Bloombox = Bloombox(settings: Bloombox.Settings(apiKey: "AIzaSyBpeziyO5YE-EIyt8ervAX8eSM0qFHd4T4", partner: "mm", location: "sacramento"))
//    do {
//      let _ = try client.menu.retrieve()
//    } catch (MenuClientError.invalidApiKey) {
//      print("error: invalid API key")
//      throw MenuClientError.invalidApiKey
//    } catch (MenuClientError.invalidPartnerCode) {
//      print("error: invalid partner")
//      throw MenuClientError.invalidPartnerCode
//    } catch (MenuClientError.invalidLocationCode) {
//      print("error: invalid location")
//      throw MenuClientError.invalidLocationCode
//    } catch (MenuRPCError.invalidMessageReceived) {
//      print("error: invalid message")
//      throw MenuRPCError.invalidMessageReceived
//    } catch (MenuRPCError.endOfStream) {
//      print("error: unexpected end of stream")
//      throw MenuRPCError.endOfStream
//    } catch (MenuRPCError.error(let result)) {
//      print("error: got result \(result)")
//      throw MenuRPCError.error(c: result)
//    }
//  }

//  func testMenuInvalidApiKey() throws {
//    var caught = false
//    do {
//      let _ = try emptyClient().menu.retrieve(partner: "mm", location: "sacramento", apiKey: nil)
//    } catch (MenuClientError.invalidApiKey) {
//      // it worked
//      caught = true
//    }
//    assert(caught, "didn't error with 'invalid API key'")
//  }

//  func testMenuInvalidPartner() throws {
//    var caught = false
//    do {
//      let _ = try emptyClient().menu.retrieve(partner: nil, location: "sacramento", apiKey: "abc123")
//    } catch (MenuClientError.invalidPartnerCode) {
//      // it worked
//      caught = true
//    }
//    assert(caught, "didn't error with 'invalid partner'")
//  }

//  func testMenuInvalidLocation() throws {
//    var caught = false
//    do {
//      let _ = try emptyClient().menu.retrieve(partner: "abc123", location: nil, apiKey: "abc123")
//    } catch (MenuClientError.invalidLocationCode) {
//      // it worked
//      caught = true
//    }
//    assert(caught, "didn't error with 'invalid location'")
//  }

  // MARK: - Shop Tests
//  func testShopInfo() throws {
//    let client: Bloombox = Bloombox(settings: Bloombox.Settings(apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM", partner: "caliva", location: "sjc"))
//    do {
//      let status: ShopInfo.Response = try client.shop.info()
//      assert(status.isInitialized, "we should get a shop info response")
//    } catch (ShopClientError.invalidApiKey) {
//      print("error: invalid API key")
//      throw ShopClientError.invalidApiKey
//    } catch (ShopClientError.invalidPartnerCode) {
//      print("error: invalid partner")
//      throw ShopClientError.invalidPartnerCode
//    } catch (ShopClientError.invalidLocationCode) {
//      print("error: invalid location")
//      throw ShopClientError.invalidLocationCode
//    } catch (ShopRPCError.invalidMessageReceived) {
//      print("error: invalid message")
//      throw ShopRPCError.invalidMessageReceived
//    } catch (ShopRPCError.endOfStream) {
//      print("error: unexpected end of stream")
//      throw ShopRPCError.endOfStream
//    } catch (ShopRPCError.error(let result)) {
//      print("error: got result \(result)")
//      throw ShopRPCError.error(c: result)
//    }
//  }

//  func testMemberVerify() throws {
//    let client: Bloombox = Bloombox(settings: Bloombox.Settings(apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM", partner: "caliva", location: "sjc"))
//    do {
//      let _ = try client.shop.verifyMember(email: "sam@bloombox.io")
//    } catch (ShopClientError.invalidApiKey) {
//      print("error: invalid API key")
//      throw ShopClientError.invalidApiKey
//    } catch (ShopClientError.invalidPartnerCode) {
//      print("error: invalid partner")
//      throw ShopClientError.invalidPartnerCode
//    } catch (ShopClientError.invalidLocationCode) {
//      print("error: invalid location")
//      throw ShopClientError.invalidLocationCode
//    } catch (ShopRPCError.invalidMessageReceived) {
//      print("error: invalid message")
//      throw ShopRPCError.invalidMessageReceived
//    } catch (ShopRPCError.endOfStream) {
//      print("error: unexpected end of stream")
//      throw ShopRPCError.endOfStream
//    } catch (ShopRPCError.error(let result)) {
//      print("error: got result \(result)")
//      throw ShopRPCError.error(c: result)
//    }
//  }

  // MARK: - Telemetry Tests
//  func testSendEvent() throws {
//    let client: Bloombox = Bloombox(settings:
//      Bloombox.Settings(
//        apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM",
//        partner: "mm",
//        location: "sacramento"))
//    do {
//      let _ = try client.telemetry.event(
//        collection: "swift_sdk_tests",
//        payload: [
//          "sample": "hello",
//          "hi": 5
//        ])
//    } catch (ShopClientError.invalidApiKey) {
//      print("error: invalid API key")
//      throw ShopClientError.invalidApiKey
//    } catch (ShopClientError.invalidPartnerCode) {
//      print("error: invalid partner")
//      throw ShopClientError.invalidPartnerCode
//    } catch (ShopClientError.invalidLocationCode) {
//      print("error: invalid location")
//      throw ShopClientError.invalidLocationCode
//    } catch (ShopRPCError.invalidMessageReceived) {
//      print("error: invalid message")
//      throw ShopRPCError.invalidMessageReceived
//    } catch (ShopRPCError.endOfStream) {
//      print("error: unexpected end of stream")
//      throw ShopRPCError.endOfStream
//    } catch (ShopRPCError.error(let result)) {
//      print("error: got result \(result)")
//      throw ShopRPCError.error(c: result)
//    }
//  }
}
