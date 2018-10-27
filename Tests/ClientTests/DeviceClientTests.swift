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
    ("testActivateUnknownDeviceAsync", testActivateUnknownDeviceAsync),
    ("testActivateDeviceKnownGood", testActivateDeviceKnownGood),
    ("testActivateKnownGoodAsync", testActivateKnownGoodAsync)
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
      let _: DeviceActivation.Response = try ClientTools.client.devices.activate(
        deviceSerial: "NO-SUCH-DEVICE-123",
        withFingerprint: "ABC123",
        withPublicKey: "asdlkajsdlaskj")
    } catch {
      caught = true
    }
    XCTAssertTrue(caught, "should throw server-side error for unknown device")
  }

  func testActivateUnknownDeviceAsync() throws {
    let expectation = XCTestExpectation(description: "Activate unknown device")

    do {
      let _: DeviceActivateCall = try ClientTools.client.devices.activate(
        deviceSerial: "NO-SUCH-DEVICE-123",
        withFingerprint: "ABC123",
        withPublicKey: "asldkjasldkjsaldj") { (result, response, err) in
          // handle response
          XCTAssertNil(response, "response should be nil when no device could be found")
          expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 15.0)
  }

  func testActivateDeviceKnownGood() throws {
    let resp: DeviceActivation.Response = try ClientTools.client.devices.activate(deviceSerial: testDevice)
    XCTAssertTrue(resp.active, "should allow activation of known-good device")
  }

  func testActivateKnownGoodAsync() throws {
    let expectation = XCTestExpectation(description: "Activate known-good device")

    do {
      let _: DeviceActivateCall = try ClientTools.client.devices.activate(deviceSerial: testDevice) { (result, response, err) in
          // handle response
          XCTAssertNotNil(response, "response should be available for a valid device")
          expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 15.0)
  }
}
