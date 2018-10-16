//
//  ShopClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import Foundation
import XCTest
@testable import Bloombox


let testPartner = "abatin"
let testLocation = "sacramento"
let testAccount = "sam@bloombox.io"
let testApiKey = "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM"


internal final class ShopClientTests: BaseClientTests {
  static var allTests = [
    // Shop Tests
    ("testShopInfoInvalidApiKey", testShopInfoInvalidApiKey),
    ("testShopInfoInvalidPartner", testShopInfoInvalidPartner),
    ("testShopInfoInvalidLocation", testShopInfoInvalidLocation),
    ("testShopInfo", testShopInfo),
    ("testShopInfoPerformance", testShopInfoPerformance),
    ("testMemberVerifyInvalidApiKey", testMemberVerifyInvalidApiKey),
    ("testMemberVerifyInvalidPartner", testMemberVerifyInvalidPartner),
    ("testMemberVerifyInvalidLocation", testMemberVerifyInvalidLocation),
    ("testMemberVerifyKnownGood", testMemberVerifyKnownGood),
    ("testMemberVerifyKnownBad", testMemberVerifyKnownBad),
    ("testMemberVerifyPerformance", testMemberVerifyPerformance)
  ]

  // MARK: - Shop Info
  func testShopInfoInvalidApiKey() throws {
    var caught = false
    do {
      let _ = try emptyClient().shop.info(partner: testPartner, location: testLocation, apiKey: nil)
    } catch ShopClientError.invalidApiKey {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid API key'")
  }

  func testShopInfoInvalidPartner() throws {
    var caught = false
    do {
      let _ = try emptyClient().shop.info(partner: nil, location: testLocation, apiKey: testApiKey)
    } catch ShopClientError.invalidPartnerCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid partner'")
  }

  func testShopInfoInvalidLocation() throws {
    var caught = false
    do {
      let _ = try emptyClient().shop.info(partner: "abc123", location: nil, apiKey: testApiKey)
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

  func testShopInfoPerformance() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    self.measure {
      if let _ = try? client.shop.info() {
        // we're good
      } else {
        XCTFail("failed to retrieve shop info: cannot measure performance")
      }
    }
  }

  // MARK: - Member Verify

  func testMemberVerifyInvalidApiKey() throws {
    var caught = false
    do {
      let _ = try emptyClient().shop.verifyMember(email: testAccount,
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
      let _ = try emptyClient().shop.verifyMember(email: testAccount,
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
      let _ = try emptyClient().shop.verifyMember(email: testAccount,
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

  func testMemberVerifyKnownBad() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    let result = try client.shop.verifyMember(email: "does-not-exist@nosuchdomain.com")
    assert(!result.verified, "valid customer should verify")
  }

  func testMemberVerifyPerformance() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

    self.measure {
      if let _ = try? client.shop.verifyMember(email: "sam@bloombox.io") {
        // we're good
      } else {
        XCTFail("failed to retrieve shop info: cannot measure performance")
      }
    }
  }
}

