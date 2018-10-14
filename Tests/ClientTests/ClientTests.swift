
import XCTest
@testable import Bloombox


class ClientTests: XCTestCase {
  static var allTests = [
    ("testClientConstruct", testClientConstruct),

    // Shop Tests
    ("testShopInfo", testShopInfo),
    ("testMemberVerify", testMemberVerify),

    // Telemetry Tests
    ("testSendEvent", testSendEvent),

    // Menu Tests
    ("testMenuDownload", testMenuDownload),
    ("testMenuInvalidApiKey", testMenuInvalidApiKey),
    ("testMenuInvalidPartner", testMenuInvalidPartner),
    ("testMenuInvalidLocation", testMenuInvalidLocation)
  ]

  let client: Bloombox = Bloombox(settings:
    Bloombox.Settings(
      apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM",
      partner: "caliva",
      location: "sjc"))

  func client(apiKey: APIKey? = "AIzaSyBpeziyO5YE-EIyt8ervAX8eSM0qFHd4T4",
              partner: PartnerCode? = "mm",
              location: LocationCode? = "sacramento") -> Bloombox {
    return Bloombox(settings: Bloombox.Settings(
      apiKey: apiKey,
      partner: partner,
      location: location))
  }

  func emptyClient() -> Bloombox {
    return client(apiKey: nil, partner: nil, location: nil)
  }

  // MARK: - Basic Tests
  func testClientConstruct() {
    let _ = client()
  }

  func testClientDefaults() {
    let defaults = Bloombox(settings: Bloombox.Settings.defaultSettings())
    XCTAssertNil(defaults.settings.apiKey, "default settings should not include an API key")
    XCTAssertNil(defaults.settings.partner, "default settings should not include a partner code")
    XCTAssertNil(defaults.settings.location, "default settings should not include a device code")
    XCTAssertNil(defaults.settings.deviceUUID, "default settings should not include a device UUID")
  }
}

