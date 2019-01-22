//
//  ShopClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import Foundation
import XCTest
@testable import Bloombox


let testZipcode = "95125"


internal final class ShopClientTests: XCTestCase {
  static var allTests = [
    // Shop Info
    ("testShopInfoInvalidApiKey", testShopInfoInvalidApiKey),
    ("testShopInfoInvalidPartner", testShopInfoInvalidPartner),
    ("testShopInfoInvalidLocation", testShopInfoInvalidLocation),
    ("testShopInfo", testShopInfo),
    ("testShopInfoAsync", testShopInfoAsync),

    // Member Verify
    ("testMemberVerifyInvalidApiKey", testMemberVerifyInvalidApiKey),
    ("testMemberVerifyInvalidPartner", testMemberVerifyInvalidPartner),
    ("testMemberVerifyInvalidLocation", testMemberVerifyInvalidLocation),
    ("testMemberVerifyKnownGood", testMemberVerifyKnownGood),
    ("testMemberVerifyKnownGoodAsync", testMemberVerifyKnownGoodAsync),
    ("testMemberVerifyKnownBad", testMemberVerifyKnownBad),

    // Zip Check
    ("testZipcheckInvalidAPIKey", testZipcheckInvalidAPIKey),
    ("testZipcheckInvalidPartner", testZipcheckInvalidPartner),
    ("testZipcheckInvalidLocation", testZipcheckInvalidLocation),
    ("testZipcheckKnownEligible", testZipcheckKnownEligible),
    ("testZipcheckKnownEligibleAsync", testZipcheckKnownEligibleAsync),
    ("testZipcheckKnownMinimum", testZipcheckKnownMinimum),
    ("testZipcheckKnownMinimum", testZipcheckKnownMinimum),
    ("testZipcheckKnownIneligible", testZipcheckKnownIneligible),

    // Get Order
    ("testGetOrder", testGetOrder),
    ("testGetOrderAsync", testGetOrderAsync)
  ]

  // MARK: - Shop Info
  func testShopInfoInvalidApiKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.info(partner: testPartner, location: testLocation, apiKey: nil)
    } catch ShopClientError.invalidApiKey {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid API key'")
  }

  func testShopInfoInvalidPartner() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.info(partner: nil, location: testLocation, apiKey: testApiKey)
    } catch ShopClientError.invalidPartnerCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid partner'")
  }

  func testShopInfoInvalidLocation() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.info(partner: "abc123", location: nil, apiKey: testApiKey)
    } catch ShopClientError.invalidLocationCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid location'")
  }

  func testShopInfo() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    let status: ShopInfo.Response = try client.shop.info()
    assert(status.isInitialized, "we should get a shop info response")
  }

  func testShopInfoAsync() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    let expectation = XCTestExpectation(description: "Fetch shop info")

    try client.shop.info() { result, response in
      assert(response?.isInitialized ?? false, "we should get a shop info response")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
  }

  // MARK: - Member Verify

  func testMemberVerifyInvalidApiKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.verifyMember(email: testAccount,
                                                              partner: testPartner,
                                                              location: testLocation,
                                                              apiKey: nil)
    } catch ShopClientError.invalidApiKey {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid API key'")
  }

  func testMemberVerifyInvalidPartner() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.verifyMember(email: testAccount,
                                                              partner: nil,
                                                              location: testPartner,
                                                              apiKey: testApiKey)
    } catch ShopClientError.invalidPartnerCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid partner'")
  }

  func testMemberVerifyInvalidLocation() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.verifyMember(email: testAccount,
                                                              partner: testPartner,
                                                              location: nil,
                                                              apiKey: testApiKey)
    } catch ShopClientError.invalidLocationCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid location'")
  }

  func testMemberVerifyKnownGood() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    let result = try client.shop.verifyMember(email: "sam@bloombox.io")
    assert(result.verified, "valid customer should verify")
  }

  func testMemberVerifyKnownGoodAsync() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    let expectation = XCTestExpectation(description: "Fetch member verification")

    try client.shop.verifyMember(email: "sam@bloombox.io") { result, resp in
      assert(resp!.verified, "valid customer should verify")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
  }

  func testMemberVerifyKnownBad() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    let result = try client.shop.verifyMember(email: "does-not-exist@nosuchdomain.com")
    assert(!result.verified, "invalid customer should not verify")
  }

  func testMemberVerifyKnownBadAsync() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    let expectation = XCTestExpectation(description: "Fetch member verification: known bad")

    try client.shop.verifyMember(email: "does-not-exist@nosuchdomain.com") { result, resp in
      assert(resp != nil, "should get a response no matter what")
      if resp != nil {
        assert(!resp!.verified, "invalid customer should not verify")
      }
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
  }

  // MARK: - Zipcode Check
  func testZipcheckInvalidAPIKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.checkZipcode(zipcode: testZipcode,
                                                              partner: testPartner,
                                                              location: testLocation,
                                                              apiKey: nil)
    } catch ShopClientError.invalidApiKey {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid API key'")
  }

  func testZipcheckInvalidPartner() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.checkZipcode(zipcode: testZipcode,
                                                              partner: nil,
                                                              location: testPartner,
                                                              apiKey: testApiKey)
    } catch ShopClientError.invalidPartnerCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid partner'")
  }

  func testZipcheckInvalidLocation() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().shop.checkZipcode(zipcode: testZipcode,
                                                              partner: testPartner,
                                                              location: nil,
                                                              apiKey: testApiKey)
    } catch ShopClientError.invalidLocationCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid location'")
  }

  func testZipcheckKnownEligible() throws {
    let result = try ClientTools.client.shop.checkZipcode(zipcode: testZipcode)
    XCTAssertTrue(result.supported, "known-eligible zipcode should report 'supported' as true")
  }

  func testZipcheckKnownEligibleAsync() throws {
    let expectation = XCTestExpectation(description: "Check known-eligible zipcode")

    try ClientTools.client.shop.checkZipcode(zipcode: testZipcode) { result, response in
      XCTAssertNotNil(response, "response should not be nil for supported zipcode")
      XCTAssertTrue(response?.supported ?? false, "known-eligible zipcode should report 'supported' as true")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 15.0)
  }

  func testZipcheckKnownMinimum() throws {
    let result = try ClientTools.client.shop.checkZipcode(zipcode: testZipcode)
    XCTAssertTrue(result.supported, "known-eligible zipcode should report 'supported' as true")
    XCTAssertEqual(result.deliveryMinimum, 50.0, "known-delivery-minimum should match")
  }

  func testZipcheckKnownIneligible() throws {
    let result = try ClientTools.client.shop.checkZipcode(zipcode: "12345")
    XCTAssertFalse(result.supported, "should indicate unsupported zipcode is unsupported")
  }

  // MARK: - Get Order
  func testGetOrder() throws {
    let order = try ClientTools.client.shop.getOrder(id: "abc123")
    XCTAssertTrue(order.success, "get-order for known order should be successful")
    XCTAssertTrue(order.hasOrder, "get-order should contain order data")
  }

  func testGetOrderAsync() throws {
    let expectation = XCTestExpectation(description: "Fetch order async")

    try ClientTools.client.shop.getOrder(id: "abc123") { result, response in
      XCTAssertNotNil(response, "should get a response when fetching an order")
      XCTAssertTrue(response?.success ?? false, "get-order for known order should be successful")
      XCTAssertTrue(response?.hasOrder ?? false, "get-order should contain order data")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
  }
}

