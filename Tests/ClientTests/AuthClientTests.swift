//
//  AuthClientTests.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/29/18.
//

import Foundation
import XCTest
import Bloombox


internal final class AuthClientTests: XCTestCase {
  static var allTests = [
    // Auth Tests
    ("testAuthNonceInvalidApiKey", testAuthNonceInvalidApiKey),
    ("testAuthConnectInvalidApiKey", testAuthConnectInvalidApiKey),
    ("testAuthNonce", testAuthNonce),
    ("testAuthNonceAsync", testAuthNonceAsync),
//    ("testGetProfile", testGetProfile),
    ("testGetProfileNotFound", testGetProfileNotFound),
    ("testGetProfileNotFoundAsync", testGetProfileNotFoundAsync)
  ]

  // MARK: - Auth Nonce
  func testAuthNonceInvalidApiKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().auth.nonce()
    } catch AuthClientError.invalidApiKey {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid API key'")
  }

  func testAuthNonce() throws {
    let nonce = try ClientTools.client.auth.nonce()
    assert(nonce.count > 1, "nonce must be valid")
  }

  func testAuthNonceAsync() throws {
    let expectation = XCTestExpectation(description: "Acquire nonce in async mode")

    let _ = try ClientTools.client.auth.nonce { result, nonce in
      assert(nonce != nil, "")
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 20.0)
  }

  // MARK: - Identity Connect
  func testAuthConnectInvalidApiKey() throws {
    var caught = false
    do {
      let _ = try ClientTools.emptyClient().auth.connect(
        identity: "identityABC",
        withPublicKey: "abc123",
        andNonce: "nonce123",
        forClient: ConnectApp(
          client: "io.bloombox.test.Test",
          fingerprint: "UUID-1234-FINGERPRINT",
          fcm: "fcm-push-token",
          apns: nil,
          adid: nil))

    } catch AuthClientError.invalidApiKey {
      // it worked
      caught = true
    }
    assert(caught, "didn't error with 'invalid API key'")
  }

  func testAuthConnectBunkValues() throws {
    var caught = false
    do {
      let _ = try ClientTools.client().auth.connect(
        identity: "",
        withPublicKey: "",
        andNonce: "",
        forClient: ConnectApp(
          client: "io.bloombox.test.Test",
          fingerprint: "UUID-1234-FINGERPRINT",
          fcm: "fcm-push-token",
          apns: nil,
          adid: nil))

    } catch {
      // it worked
      caught = true
    }
    assert(caught, "didn't catch server-side error")
  }

  func testAuthConnectBunkValuesAsync() throws {
    let expectation = XCTestExpectation(description: "Identity connect async")

    let _ = try ClientTools.client().auth.connect(
      identity: "",
      withPublicKey: "",
      andNonce: "",
      forClient: ConnectApp(
        client: "io.bloombox.test.Test",
        fingerprint: "UUID-1234-FINGERPRINT",
        fcm: "fcm-push-token",
        apns: nil,
        adid: nil)) { callResult, response in
      // assert that it was a failure
      assert(response == nil, "response should be nil for bunk identity connect")
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 15.0)
  }

  // MARK: - Profile Retrieve
//  func testGetProfile() throws {
//    let user = try ClientTools.client().auth.profile(forUser: testUser)
//    assert(!user.uid.isEmpty, "should be able to find user and person data")
//  }

  func testGetProfileNotFoundAsync() throws {
    let expectation = XCTestExpectation(description: "Fetch profile async")

    try ClientTools.client().auth.profile(forUser: UserKey.with { $0.uid = "blablabla123" }) { callResult, profile in
      assert(profile == nil, "should get null profile")
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 30.0)
  }

  func testGetProfileNotFound() throws {
    var caught = false
    do {
      let _ = try ClientTools.client().auth.profile(forUser: UserKey.with { $0.uid = "blablabla123" })
    } catch {
      caught = true
    }
    assert(caught, "should throw error when no profile could be found")
  }
}
