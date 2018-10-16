//
//  PlatformClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/16/18.
//

import Foundation
import XCTest
@testable import Bloombox


internal final class PlatformClientTests: XCTestCase {
  static var allTests = [
    // Platform Tests

    // `Resolve`
    ("testResolveDomainInvalidAPIKey", testResolveDomainInvalidAPIKey),
    ("testResolveDomainKnownValid", testResolveDomainKnownValid),
    ("testResolveDomainKnownInvalid", testResolveDomainKnownInvalid),

    // `DomainInfo`
    ("testDomainInfoInvalidAPIKey", testDomainInfoInvalidAPIKey),
    ("testDomainInfoInvalidPartner", testDomainInfoInvalidPartner),
    ("testDomainInfoInvalidLocation", testDomainInfoInvalidLocation),
    ("testDomainInfoKnownValid", testDomainInfoKnownValid),

    // `Brand`
    ("testRetrieveBrandingInvalidPartner", testRetrieveBrandingInvalidPartner),
    ("testRetrieveBrandingInvalidLocation", testRetrieveBrandingInvalidLocation),
    ("testRetrieveBrandingInvalidAPIKey", testRetrieveBrandingInvalidAPIKey),
    ("testRetrieveBrandingKnownValid", testRetrieveBrandingKnownValid)
  ]

  // MARK: - Healthcheck
  func testHealthcheck() throws {
    try ClientTools.client.platform.healthcheck()
  }

  // MARK: - Resolve Domain
  func testResolveDomainInvalidAPIKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().platform.resolve(
        encodedDomain: "blab.com:443".data(using: .utf8)!
          .base64EncodedString()
          .replacingOccurrences(of: "=", with: ""),
        forAPIKey: nil)
    } catch PlatformClientError.invalidApiKey {
      caught = true
    }
    XCTAssertTrue(caught, "should throw proper error if missing API key")
  }

  func testResolveDomainKnownValid() throws {
    let manifest = try ClientTools.client.platform.resolve(domain: testOrigin)
    XCTAssertEqual(manifest.partner, testPartner, "should be able to resolve known-good domain partner")
    XCTAssertEqual(manifest.location, testLocation, "should be able to resolve known-good domain location")
  }

  func testResolveDomainKnownInvalid() throws {
    var caught = false
    do {
      let _ = try ClientTools.client.platform.resolve(domain: "sample-does-not-exist.com:443")
    } catch {
      caught = true
    }
    XCTAssertTrue(caught, "should throw error if a domain cannot be resolved in sync mode")
  }

  // MARK: - Domain Info
  func testDomainInfoInvalidAPIKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().platform.domains(
        forPartner: testPartner,
        withLocation: testLocation,
        andAPIKey: nil)
    } catch PlatformClientError.invalidApiKey {
      caught = true
    }
    XCTAssertTrue(caught, "should throw proper error if missing API key")
  }

  func testDomainInfoInvalidPartner() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().platform.domains(
        forPartner: nil,
        withLocation: testLocation,
        andAPIKey: testApiKey)
    } catch PlatformClientError.invalidPartnerCode {
      caught = true
    }
    XCTAssertTrue(caught, "should throw proper error if missing partner code")
  }

  func testDomainInfoInvalidLocation() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().platform.domains(
        forPartner: testPartner,
        withLocation: nil,
        andAPIKey: testApiKey)
    } catch PlatformClientError.invalidLocationCode {
      caught = true
    }
    XCTAssertTrue(caught, "should throw proper error if missing location code")
  }

  func testDomainInfoKnownValid() throws {
    let domains = try ClientTools.client.platform.domains()
    XCTAssertNotNil(domains.menu)
  }

  // MARK: - Branding
  func testRetrieveBrandingInvalidPartner() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().platform.brand(
        forPartner: nil,
        withLocation: testLocation,
        andAPIKey: testApiKey)
    } catch PlatformClientError.invalidPartnerCode {
      caught = true
    }
    XCTAssertTrue(caught, "should throw proper error if missing partner code")
  }

  func testRetrieveBrandingInvalidAPIKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().platform.brand(
        forPartner: testPartner,
        withLocation: testLocation,
        andAPIKey: nil)
    } catch PlatformClientError.invalidApiKey {
      caught = true
    }
    XCTAssertTrue(caught, "should throw proper error if missing API key")
  }

  func testRetrieveBrandingInvalidLocation() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().platform.brand(
        forPartner: testPartner,
        withLocation: nil,
        andAPIKey: testApiKey)
    } catch PlatformClientError.invalidLocationCode {
      caught = true
    }
    XCTAssertTrue(caught, "should throw proper error if missing location code")
  }

  func testRetrieveBrandingKnownValid() throws {
    let brand = try ClientTools.client.platform.brand()
    XCTAssertNotNil(brand, "branding info must be returned for validly-configured partner")
  }
}
