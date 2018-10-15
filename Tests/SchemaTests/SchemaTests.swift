//
//  SchemaTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import XCTest
@testable import OpenCannabis
import Bloombox


/// Tests basic schema functionality.
class SchemaTests: XCTestCase {
  static let itemPerformanceTestCount = 20  // generate full inventory for this many strains when testing perf

  static var allTests = [
    // Base Tests
    ("testEquatable", testEquatable),
    ("testTextFormat", testTextFormat),
    ("testCopyAndOverride", testCopyAndOverride),

    // Codec Tests
    ("testEncodeDecodeBinary", testEncodeDecodeBinary),
    ("testBinaryPerformance", testBinaryPerformance),
    ("testEncodeDecodeJSON", testEncodeDecodeJSON),
    ("testJSONStringPerformance", testJSONStringPerformance),
    ("testJSONDataPerformance", testJSONDataPerformance),
    ("testEncodeDecodeText", testEncodeDecodeText),
    ("testTextPerformance", testTextPerformance)
  ]

  func testEquatable() throws {
    let userKey = UserKey.with { item in
      item.identity = "abc123"
      item.uid = "abc123"
    }

    let otherUserKey = UserKey.with { item in
      item.identity = "abc123"
      item.uid = "abc123"
    }

    let differentUserKey = UserKey.with { item in
      item.identity = "blabble1"
      item.uid = "blabble2"
    }

    let propDifferenceUserKey = UserKey.with { item in
      item.uid = "abc123"
    }

    XCTAssertEqual(userKey, otherUserKey, "identical models should be equatable")
    XCTAssertEqual(otherUserKey, userKey, "should be able to compare models either way")
    XCTAssertNotEqual(userKey, differentUserKey, "different model should not be equatable")
    XCTAssertNotEqual(userKey, propDifferenceUserKey, "different model should not be equatable")
  }

  func testTextFormat() throws {
    let locationWithoutPartner = LocationKey.with { item in
      item.code = "sample"
    }

    let fullLocationPartner = LocationKey.with { item in
      item.code = "sample"
      item.partner = PartnerKey.with { partner in
        partner.code = "partner"
      }
    }

    let text1 = locationWithoutPartner.textFormatString()
    let text2 = fullLocationPartner.textFormatString()

    XCTAssertGreaterThan(text2.count, text1.count, "text format should print properties")
  }

  func testCopyAndOverride() throws {
    let partnerKey = PartnerKey.with { item in
      item.code = "caliva"
    }

    let override = PartnerKey.with { item in
      item.code = "mm"
    }

    let serialized = try partnerKey.serializedData()
    let overrideSerialized = try override.serializedData()

    var copied = try PartnerKey(serializedData: serialized)
    try copied.merge(serializedData: overrideSerialized)

    XCTAssertEqual("mm", copied.code, "overridden value should be accepted by copied model")
  }
}
