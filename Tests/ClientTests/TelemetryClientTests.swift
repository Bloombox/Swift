//
//  TelemetryClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import Foundation
@testable import Bloombox


internal final class TelemetryClientTests: BaseClientTests {
  static var allTests = [
    ("testSendEvent", testSendEvent)
  ]

  // MARK: - Telemetry Tests
  func testSendEvent() throws {
    let _ = try client.telemetry.event(
      collection: .named("swift_sdk_tests"),
      payload: [
        "sample": "hello",
        "hi": 5
      ])
  }
}
