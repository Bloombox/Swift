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
    ("testMenuInvalidApiKey", testMenuInvalidApiKey),
    ("testMenuInvalidPartner", testMenuInvalidPartner),
    ("testMenuInvalidLocation", testMenuInvalidLocation)
  ]

  // MARK: - Menu Tests
  func testMenuDownload() throws {
    let menu = try ClientTools.client.menu.retrieve()
    assert(menu.hasCatalog, "downloaded menu should have a product catalog")
  }

  func testMenuDownloadPerformance() throws {
    self.measure {
      if let _ = try? ClientTools.client.menu.retrieve() {
        // got a menu response
      } else {
        XCTFail("failed to retrieve menu: cannot test performance")
      }
    }
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
}
