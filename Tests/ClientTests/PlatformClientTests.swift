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

    // `Healthcheck`
    ("testHealthcheck", testHealthcheck),
    ("testHealthcheckAsync", testHealthcheckAsync),

    // `Resolve`
    ("testResolveDomainInvalidAPIKey", testResolveDomainInvalidAPIKey),
    ("testResolveDomainKnownValid", testResolveDomainKnownValid),
    ("testResolveDomainKnownInvalid", testResolveDomainKnownInvalid),
    ("testResolveDomainKnownInvalidAsync", testResolveDomainKnownInvalidAsync),
    ("testResolveDomainKnownValidAsync", testResolveDomainKnownValidAsync),

    // `DomainInfo`
    ("testDomainInfoInvalidAPIKey", testDomainInfoInvalidAPIKey),
    ("testDomainInfoInvalidPartner", testDomainInfoInvalidPartner),
    ("testDomainInfoInvalidLocation", testDomainInfoInvalidLocation),
    ("testDomainInfoKnownValid", testDomainInfoKnownValid),
    ("testDomainInfoKnownInvalid", testDomainInfoKnownInvalid),
    ("testDomainInfoKnownValidAsync", testDomainInfoKnownValidAsync),
    ("testDomainInfoKnownInvalidAsync", testDomainInfoKnownInvalidAsync),

    // `Brand`
    ("testRetrieveBrandingInvalidPartner", testRetrieveBrandingInvalidPartner),
    ("testRetrieveBrandingInvalidLocation", testRetrieveBrandingInvalidLocation),
    ("testRetrieveBrandingInvalidAPIKey", testRetrieveBrandingInvalidAPIKey),
    ("testRetrieveBrandingKnownValid", testRetrieveBrandingKnownValid),
    ("testRetrieveBrandingKnownInvalid", testRetrieveBrandingKnownInvalid),
    ("testRetrieveBrandingKnownValidAsync", testRetrieveBrandingKnownValidAsync),
    ("testRetrieveBrandingKnownInvalidAsync", testRetrieveBrandingKnownInvalidAsync)
  ]

  // MARK: - Healthcheck
  func testHealthcheck() throws {
    try ClientTools.client.platform.healthcheck()
  }

  func testHealthcheckAsync() throws {
    let expectation = XCTestExpectation(description: "Check system health")

    try ClientTools.client.platform.healthcheck { _ in
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
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
    XCTAssertEqual(manifest.partner, "abatin", "should be able to resolve known-good domain partner")
    XCTAssertEqual(manifest.location, "sacramento", "should be able to resolve known-good domain location")
  }

  func testResolveDomainKnownValidAsync() throws {
    let expectation = XCTestExpectation(description: "Resolve known-valid domain in async mode")

    try ClientTools.client.platform.resolve(domain: testOrigin) { (result, response) in
      XCTAssertNotNil(response, "should get response for valid domain resolve")
      XCTAssertEqual(response?.partner, "abatin", "partner resolved for test origin should match")
      XCTAssertEqual(response?.location, "sacramento", "location resolved for test origin should match")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
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

  func testResolveDomainKnownInvalidAsync() throws {
    let expectation = XCTestExpectation(description: "Resolve known-valid domain in async mode")

    try ClientTools.client.platform.resolve(domain: "sample-does-not-exist.com:443") { (result, response) in
      XCTAssertNil(response, "should NOT get response for invalid domain resolve")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
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

  func testDomainInfoKnownValidAsync() throws {
    let expectation = XCTestExpectation(description: "Resolve domain info in async mode")

    try ClientTools.client.platform.domains() { (result, response) in
      XCTAssertNotNil(response, "should get response for valid domain resolve")
      XCTAssertNotNil(response?.menu, "should get a menu link from domains list")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
  }

  func testDomainInfoKnownInvalid() throws {
    var caught = false
    do {
      let _ = try ClientTools.client.platform.domains(withLocation: "hello-does-not-exist")
    } catch {
      caught = true
    }
    XCTAssertTrue(caught, "resolving invalid domain info should produce an error")
  }

  func testDomainInfoKnownInvalidAsync() throws {
    let expectation = XCTestExpectation(description: "Resolve domain info in async mode")

    try ClientTools.client.platform.domains(withLocation: "hello-does-not-exist") { (result, response) in
      XCTAssertNil(response, "should NOT get response for invalid domain resolve")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
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

  func testRetrieveBrandingKnownInvalid() throws {
    let brand = try ClientTools.client.platform.brand(withLocation: "does-not-exist")
    XCTAssertFalse(brand.brand.hasTheme, "brand should not be resolvable for unknown location")
  }

  func testRetrieveBrandingKnownValidAsync() throws {
    let expectation = XCTestExpectation(description: "Resolve branding in async mode")

    try ClientTools.client.platform.brand() { (result, response) in
      XCTAssertNotNil(response, "should get branding from async request")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
  }

  func testRetrieveBrandingKnownInvalidAsync() throws {
    let expectation = XCTestExpectation(description: "Resolve unknown branding in async mode")

    try ClientTools.client.platform.brand(withLocation: "does-not-exist") { (result, response) in
      XCTAssertFalse(response!.brand.hasTheme, "should NOT get branding from invalid async brand request")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 30.0)
  }
}
