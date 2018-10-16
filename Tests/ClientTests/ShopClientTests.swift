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

  func testZipcheckKnownMinimum() throws {
    let result = try ClientTools.client.shop.checkZipcode(zipcode: testZipcode)
    XCTAssertTrue(result.supported, "known-eligible zipcode should report 'supported' as true")
    XCTAssertEqual(result.deliveryMinimum, 50.0, "known-delivery-minimum should match")
  }

  func testZipcheckKnownIneligible() throws {
    let result = try ClientTools.client.shop.checkZipcode(zipcode: "12345")
    XCTAssertFalse(result.supported, "should indicate unsupported zipcode is unsupported")
  }
}

