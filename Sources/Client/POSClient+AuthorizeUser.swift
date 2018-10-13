//
//  POSClient+AuthorizeUser.swift
//  BloomboxPackageDescription
//
//  Created by Sam Gammon on 9/28/18.
//

import Foundation
import SwiftGRPC
import Schema


// Callback Types
public typealias POSAuthorizeCallback = (CallResult, POSAuthorize.Response?) -> Void


///
///
public protocol IPOSAuthorizeUser {
  /// Authorize: User with Token (Sync)
  ///
  func authorize(userToken token: IdentityToken,
                 forDevice device: PartnerDeviceKey,
                 withOptions options: POSAuthorizeOptions) throws -> POSAuthorize.Response

  /// Authorize: User with Token (Async)
  ///
  func authorize(userToken token: IdentityToken,
                 forDevice device: PartnerDeviceKey,
                 withOptions options: POSAuthorizeOptions,
                 _ callback: @escaping POSAuthorizeCallback) throws -> POSAuthorizeCall

  /// Authorize: User with Challenge (Sync)
  ///
  func authorize(withUserChallenge challenge: Hash,
                 forDevice device: PartnerDeviceKey,
                 withOptions options: POSAuthorizeOptions) throws -> POSAuthorize.Response

  /// Authorize: User with Challenge (Async)
  ///
  func authorize(withUserChallenge challenge: Hash,
                 forDevice device: PartnerDeviceKey,
                 withOptions options: POSAuthorizeOptions,
                 _ callback: @escaping POSAuthorizeCallback) throws -> POSAuthorizeCall
}


///
///
public struct POSAuthorizeOptions {
  ///
  public struct MessagingOptions {
    ///
    public let nonce: String
  }

  ///
  public let apiKey: APIKey?  /* Override the default API key. */

  ///
  public let messaging: MessagingOptions?

  ///
  public let resume: String?

  ///
  public static var defaults: POSAuthorizeOptions {
    get {
      return POSAuthorizeOptions(apiKey: nil, messaging: nil, resume: nil)
    }
  }

  ///
  ///
  public func withOverrides(apiKey: APIKey? = nil,
                            messaging: MessagingOptions? = nil,
                            resume: String? = nil) -> POSAuthorizeOptions {
    return POSAuthorizeOptions(apiKey: apiKey ?? self.apiKey,
                               messaging: messaging ?? self.messaging,
                               resume: resume ?? self.resume)
  }
}


// MARK: - Method: Authorize User -

///
///
extension PointOfSaleClient: IPOSAuthorizeUser {
  // MARK: Internals

  ///
  ///
  private func authorizeUser(_ request: POSAuthorize.Request,
                             withAPIKey apiKey: APIKey) throws -> POSAuthorize.Response {
    return try self.service(apiKey).authorize(request)
  }

  ///
  ///
  private func authorizeUser(_ request: POSAuthorize.Request,
                             withAPIKey apiKey: APIKey,
                             _ callback: @escaping POSAuthorizeCallback) throws -> POSAuthorizeCall {
    return try self.service(apiKey).authorize(request) { (response, callResult) in
      // handle callback
      callback(callResult, response)
    }
  }

  // MARK: Public API

  /// Authorize a user account for a staff member to make use of point-of-sale hardware, using an identity token
  /// provided via user auth, for an account that has never been used on POS before or has lost their passcode.
  ///
  public func authorize(userToken token: IdentityToken,
                        forDevice device: PartnerDeviceKey,
                        withOptions options: POSAuthorizeOptions) throws -> POSAuthorize.Response {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.authorizeUser(POSAuthorize.Request.with { obj in
      obj.token = token
      obj.register = deviceKey
      if let nce = options.messaging?.nonce {
        obj.messaging = MessagingAuth.with { msg in
          msg.nonce = nce
        }
      }
    }, withAPIKey: apiKey)
  }

  /// Authorize a user account for a staff member to make use of point-of-sale hardware, using their response to an auth
  /// challenge (usually a passcode).
  ///
  public func authorize(withUserChallenge challenge: Hash,
                        forDevice device: PartnerDeviceKey,
                        withOptions options: POSAuthorizeOptions) throws -> POSAuthorize.Response {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.authorizeUser(POSAuthorize.Request.with { obj in
      obj.challenge = challenge
      obj.register = deviceKey
      if let nce = options.messaging?.nonce {
        obj.messaging = MessagingAuth.with { msg in
          msg.nonce = nce
        }
      }
    }, withAPIKey: apiKey)
  }

  /// Authorize a user account for a staff member to make use of point-of-sale hardware, using an identity token
  /// provided via user auth, for an account that has never been used on POS before or has lost their passcode.
  ///
  public func authorize(userToken token: IdentityToken,
                        forDevice device: PartnerDeviceKey,
                        withOptions options: POSAuthorizeOptions,
                        _ callback: @escaping POSAuthorizeCallback) throws -> POSAuthorizeCall {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.authorizeUser(POSAuthorize.Request.with { obj in
      obj.token = token
      obj.register = deviceKey
      if let nce = options.messaging?.nonce {
        obj.messaging = MessagingAuth.with { msg in
          msg.nonce = nce
        }
      }
    }, withAPIKey: apiKey, callback)
  }

  /// Authorize a user account for a staff member to make use of point-of-sale hardware, using their response to an auth
  /// challenge (usually a passcode).
  ///
  public func authorize(withUserChallenge challenge: Hash,
                        forDevice device: PartnerDeviceKey,
                        withOptions options: POSAuthorizeOptions,
                        _ callback: @escaping POSAuthorizeCallback) throws -> POSAuthorizeCall {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.authorizeUser(POSAuthorize.Request.with { obj in
      obj.challenge = challenge
      obj.register = deviceKey
      if let nce = options.messaging?.nonce {
        obj.messaging = MessagingAuth.with { msg in
          msg.nonce = nce
        }
      }
    }, withAPIKey: apiKey, callback)
  }

}
