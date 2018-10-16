//
//  DeviceClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/16/18.
//

import XCTest
@testable import Bloombox

let testDevice = "SANDBOX-1234"


internal final class DeviceClientTests: XCTestCase {
  static var allTests = [
    // Device Tests
    ("testActivateInvalidAPIKey", testActivateInvalidAPIKey),
    ("testActivateUnknownDevice", testActivateUnknownDevice),
    ("testActivateDeviceKnownGood", testActivateDeviceKnownGood)
  ]

  // MARK: - Device Tests
  func testActivateInvalidAPIKey() throws {
    var caught = false
    do {
      let _: DeviceActivation.Response = try ClientTools.emptyClient().devices.activate(
        deviceSerial: testDevice,
        authorizedBy: nil)
    } catch DevicesClientError.invalidApiKey {
      caught = true
    }
    XCTAssertTrue(caught, "should throw invalidApiKey if API key is invalid for device activation")
  }

  func testActivateUnknownDevice() throws {
    var caught = false
    do {
      let _: DeviceActivation.Response = try ClientTools.client.devices.activate(deviceSerial: "NO-SUCH-DEVICE-123")
    } catch {
      caught = true
    }
    XCTAssertTrue(caught, "should throw server-side error for unknown device")
  }

  func testActivateDeviceKnownGood() throws {
    let resp: DeviceActivation.Response = try ClientTools.client.devices.activate(deviceSerial: testDevice)
    XCTAssertTrue(resp.active, "should allow activation of known-good device")
  }
}
