//
//  ClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/16/18.
//

import XCTest
@testable import Bloombox

let testPartner = "caliva"
let testLocation = "sjc"
let testAccount = "sam@bloombox.io"
let testApiKey = "AIzaSyBC4ZQVM3JnnS4P-wu6MHKi5oc0NcEuWxE"
let testOrigin = "abatin.menu:443"
let testIdentity = "P0gUgHMPs6MmvvW0Wk8SQote2IN2"
let testUID: UserID = "-L1UXri_ZI9QKAHpeqpa"
let testUser = UserKey.with { $0.uid = testUID; $0.identity = testIdentity; }


internal struct ClientTools {
  static let client: Bloombox = Bloombox(settings:
    Bloombox.Settings(
      apiKey: testApiKey,
      partner: testPartner,
      location: testLocation))

  static func client(apiKey: APIKey? = "AIzaSyBpeziyO5YE-EIyt8ervAX8eSM0qFHd4T4",
                     partner: PartnerCode? = "mm",
                     location: LocationCode? = "sacramento") -> Bloombox {
    return Bloombox(settings: Bloombox.Settings(
      apiKey: apiKey,
      partner: partner,
      location: location))
  }

  static func emptyClient() -> Bloombox {
    return client(apiKey: nil, partner: nil, location: nil)
  }
}


class ClientTests: XCTestCase {
  static var allTests = [
    ("testClientConstruct", testClientConstruct),
    ("testClientDefaults", testClientDefaults)
  ]

  // MARK: - Basic Tests
  func testClientConstruct() {
    let _ = ClientTools.client()
  }

  func testClientDefaults() {
    let simple = Bloombox()
    XCTAssertNil(simple.settings.apiKey, "default settings should not include an API key")
    XCTAssertNil(simple.settings.partner, "default settings should not include a partner code")
    XCTAssertNil(simple.settings.location, "default settings should not include a device code")
    XCTAssertNil(simple.settings.deviceUUID, "default settings should not include a device UUID")

    let defaults = Bloombox(settings: Bloombox.Settings.defaultSettings())
    XCTAssertNil(defaults.settings.apiKey, "default settings should not include an API key")
    XCTAssertNil(defaults.settings.partner, "default settings should not include a partner code")
    XCTAssertNil(defaults.settings.location, "default settings should not include a device code")
    XCTAssertNil(defaults.settings.deviceUUID, "default settings should not include a device UUID")
  }

  func testClientExplicitSettings() {
    let settings = Bloombox.Settings.defaultSettings()
    settings.bundleId = "sample.bundle.Id"
    let client = Bloombox(settings: settings)
    XCTAssertEqual("sample.bundle.Id", client.settings.bundleId, "explicit settings should work")
  }

  func testUpdateClientSettings() {
    let settings = Bloombox.Settings.defaultSettings()
    settings.bundleId = "sample.bundle.Id"
    let client = Bloombox(settings: settings)
    XCTAssertEqual("sample.bundle.Id", client.settings.bundleId, "explicit settings should work")

    settings.bundleId = "blab.Test"
    XCTAssertEqual("blab.Test", client.settings.bundleId, "settings should be passed by reference")

    let newSettings = Bloombox.Settings.defaultSettings()
    newSettings.apiKey = "sample"
    client.updateSettings(newSettings)

    XCTAssertNil(client.settings.bundleId, "settings should not merge on update")
    XCTAssertEqual("sample", client.settings.apiKey!, "new settings should take effect")
  }

  func testServiceAccessors() {
    let empty = ClientTools.emptyClient()
    XCTAssertNotNil(empty.settings, "settings on empty client should not be nil")
    XCTAssertNotNil(empty.services, "services on empty client should not be nil")
    XCTAssertNotNil(empty.devices, "devices service on empty client should not be nil")
    XCTAssertNotNil(empty.menu, "menu service on empty client should not be nil")
    XCTAssertNotNil(empty.platform, "platform service on empty client should not be nil")
    XCTAssertNotNil(empty.pos, "POS service on empty client should not be nil")
    XCTAssertNotNil(empty.shop, "shop service on empty client should not be nil")
    XCTAssertNotNil(empty.telemetry, "telemetry service on empty client should not be nil")
  }
}

