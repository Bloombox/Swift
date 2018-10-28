//
//  MenuClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import Foundation
import XCTest
@testable import Bloombox


internal final class MenuClientTests: XCTestCase {
  static var allTests = [
    // Menu Tests
    ("testMenuDownload", testMenuDownload),
    ("testMenuDownloadAsync", testMenuDownloadAsync),
    ("testMenuNotFound", testMenuNotFound),
    ("testMenuNotFoundAsync", testMenuNotFoundAsync),
    ("testMenuInvalidApiKey", testMenuInvalidApiKey),
    ("testMenuInvalidPartner", testMenuInvalidPartner),
    ("testMenuInvalidLocation", testMenuInvalidLocation)
  ]

  // MARK: - Menu Tests
  func testMenuDownload() throws {
    let menu = try ClientTools.client.menu.retrieve()
    assert(menu.hasCatalog, "downloaded menu should have a product catalog")
  }

  func testMenuInvalidApiKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().menu.retrieve(partner: "mm", location: "sacramento", apiKey: nil)
    } catch MenuClientError.invalidApiKey {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid API key'")
  }

  func testMenuInvalidPartner() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().menu.retrieve(partner: nil, location: "sacramento", apiKey: "abc123")
    } catch MenuClientError.invalidPartnerCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid partner'")
  }

  func testMenuInvalidLocation() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().menu.retrieve(partner: "abc123", location: nil, apiKey: "abc123")
    } catch MenuClientError.invalidLocationCode {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid location'")
  }

  func testMenuDownloadAsync() throws {
    let expectation = XCTestExpectation(description: "Fetch menu for test partner")

    do {
      let _: GetMenuCall = try ClientTools.client.menu.retrieve() { (result, response) in
          // handle response
          XCTAssertNotNil(response, "should be able to fetch valid menu in async mode")
          expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 30.0)
  }

  func testMenuNotFound() throws {
    var caught = false
    do {
      let menu = try ClientTools.client.menu.retrieve(location: "abc123")
      assert(menu.hasCatalog, "downloaded menu should have a product catalog")
    } catch {
      caught = true
    }
    XCTAssertTrue(caught, "should throw error when a menu cannot be found")
  }

  func testMenuNotFoundAsync() throws {
    let expectation = XCTestExpectation(description: "Fetch unknown menu")

    do {
      let _: GetMenuCall = try ClientTools.client.menu.retrieve(location: "abc123") { (result, response) in
        // handle response
        XCTAssertNil(response, "should get a nil response when a menu cannot be found")
        expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 30.0)
  }
}
