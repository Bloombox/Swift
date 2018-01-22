
import XCTest
@testable import Schema
@testable import Client


class ClientTests: XCTestCase {
  func testMenuDownload() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(apiKey: "AIzaSyBpeziyO5YE-EIyt8ervAX8eSM0qFHd4T4", partner: "mm", location: "sacramento"))
    do {
      let menu = try client.menu.retrieve()
      print("menu items: \(menu.count)")
      assert(menu.count > 0, "menu should have items")
    } catch (MenuClientError.invalidApiKey) {
      print("error: invalid API key")
      throw MenuClientError.invalidApiKey
    } catch (MenuClientError.invalidPartnerCode) {
      print("error: invalid partner")
      throw MenuClientError.invalidPartnerCode
    } catch (MenuClientError.invalidLocationCode) {
      print("error: invalid location")
      throw MenuClientError.invalidLocationCode
    } catch (Services_Menu_V1Beta1_MenuClientError.invalidMessageReceived) {
      print("error: invalid message")
      throw Services_Menu_V1Beta1_MenuClientError.invalidMessageReceived
    } catch (Services_Menu_V1Beta1_MenuClientError.endOfStream) {
      print("error: unexpected end of stream")
      throw Services_Menu_V1Beta1_MenuClientError.endOfStream
    } catch (Services_Menu_V1Beta1_MenuClientError.error(let result)) {
      print("error: got result \(result)")
      throw Services_Menu_V1Beta1_MenuClientError.error(c: result)
    }
  }

  func testShopInfo() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM", partner: "caliva", location: "sjc"))
    do {
      let status: ShopInfo.Response = try client.shop.info()
      assert(status.isInitialized, "we should get a shop info response")
    } catch (ShopClientError.invalidApiKey) {
      print("error: invalid API key")
      throw ShopClientError.invalidApiKey
    } catch (ShopClientError.invalidPartnerCode) {
      print("error: invalid partner")
      throw ShopClientError.invalidPartnerCode
    } catch (ShopClientError.invalidLocationCode) {
      print("error: invalid location")
      throw ShopClientError.invalidLocationCode
    } catch (Services_Shop_V1_ShopClientError.invalidMessageReceived) {
      print("error: invalid message")
      throw Services_Shop_V1_ShopClientError.invalidMessageReceived
    } catch (Services_Shop_V1_ShopClientError.endOfStream) {
      print("error: unexpected end of stream")
      throw Services_Shop_V1_ShopClientError.endOfStream
    } catch (Services_Shop_V1_ShopClientError.error(let result)) {
      print("error: got result \(result)")
      throw Services_Shop_V1_ShopClientError.error(c: result)
    }
  }

  func testMemberVerify() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM", partner: "caliva", location: "sjc"))
    do {
      try client.shop.verifyMember(email: "sam@bloombox.io")
    } catch (ShopClientError.invalidApiKey) {
      print("error: invalid API key")
      throw ShopClientError.invalidApiKey
    } catch (ShopClientError.invalidPartnerCode) {
      print("error: invalid partner")
      throw ShopClientError.invalidPartnerCode
    } catch (ShopClientError.invalidLocationCode) {
      print("error: invalid location")
      throw ShopClientError.invalidLocationCode
    } catch (Services_Shop_V1_ShopClientError.invalidMessageReceived) {
      print("error: invalid message")
      throw Services_Shop_V1_ShopClientError.invalidMessageReceived
    } catch (Services_Shop_V1_ShopClientError.endOfStream) {
      print("error: unexpected end of stream")
      throw Services_Shop_V1_ShopClientError.endOfStream
    } catch (Services_Shop_V1_ShopClientError.error(let result)) {
      print("error: got result \(result)")
      throw Services_Shop_V1_ShopClientError.error(c: result)
    }
  }

  static var allTests = [
    ("testMenuDownload", testMenuDownload),
    ("testShopInfo", testShopInfo)
    ("testMemberVerify", testMemberVerify)
  ]
}
