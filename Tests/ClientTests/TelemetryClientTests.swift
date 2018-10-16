//
//  TelemetryClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import Foundation
import XCTest
@testable import Bloombox


internal final class TelemetryClientTests: XCTestCase {
  static var allTests = [
    ("testSendEvent", testSendEvent),
    ("testSendEventNoPayload", testSendEventNoPayload)
  ]

  // MARK: - Telemetry Tests
  internal struct Unserializable {}

  func testEventInvalidPayload() throws {
    var caught = false
    do {
      let _ = try ClientTools.client.telemetry.event(
        collection: .named("swift_sdk_tests"),
        payload: [
          "hi": 5,
          "some_key": Unserializable()
        ])
    } catch GenericEventError.serializationError {
      caught = true
    }
    XCTAssertTrue(caught, "should throw `GenericEventError.serializationError` for serialization errors")
  }

  func testSendEvent() throws {
    let _ = try ClientTools.client.telemetry.event(
      collection: .named("swift_sdk_tests"),
      payload: [
        "sample": "hello",
        "hi": 5,
        "yo": 6 as UInt,
        "someBool": true,
        "somePrecise": 3.4564,
        "anArray": [
          "hello",
          "blah"
        ],
        "anotherArrayThisTimeWithInts": [
          1, 2, 3, 4
        ],
        "hey": [
          "subhey": "hi",
          "double": 1.2
        ]
      ])
  }

  func testSendEventNoPayload() throws {
    let _ = try ClientTools.client.telemetry.event(
      collection: .named("swift_sdk_tests"),
      payload: nil)
  }
}
