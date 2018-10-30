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
    ("testAuthConnectInvalidApiKey", testAuthConnectInvalidApiKey)
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
