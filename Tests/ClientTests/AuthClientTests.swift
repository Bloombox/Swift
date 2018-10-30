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
    ("testAuthNonceAsync", testAuthNonceAsync)
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
}
