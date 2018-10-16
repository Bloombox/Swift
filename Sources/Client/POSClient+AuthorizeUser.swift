//
//  POSClient+AuthorizeUser.swift
//  BloomboxPackageDescription
//
//  Created by Sam Gammon on 9/28/18.
//

import Foundation
import SwiftGRPC
import OpenCannabis


// Callback Types

/// Callback type definition for a point-of-sale session-authorize operation, which authorizes a given POS session
/// against an authenticated (and, presumably, duly authorized) user account. The callback accepts two parameters and
/// no return value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `POSAuthorize.Response?`: If the call succeeded, a POS authorization response will be provided.
public typealias POSAuthorizeCallback = (CallResult, POSAuthorize.Response?) -> Void


/// Specifies options that may be passed to a point-of-sale session authorization call. These may include additional
/// credential options, such as the messaging nonce or a session ID to resume.
public struct POSAuthorizeOptions {
  /// Specifies options related to messaging authorization.
  public struct MessagingOptions {
    /// Specifies an authorization nonce for messaging access.
    public let nonce: String
  }

  /// Specifies the API key to use when communicating with the remote service.
  public let apiKey: APIKey?  /* Override the default API key. */

  /// Specifies options related to messaging access.
  public let messaging: MessagingOptions?

  /// Optionally specifies a session ID to resume.
  public let resume: POSSessionID?

  /// Specifies information about the point-of-sale hardware we're running on.
  public let hardware: POSHardware?

  /// Specifies information about the point-of-sale software app we're running.
  public let app: DeviceApplication?

  /// Access a generated set of default POS authorization options.
  public static var defaults: POSAuthorizeOptions {
    get {
      return POSAuthorizeOptions(apiKey: nil, messaging: nil, resume: nil, hardware: nil, app: nil)
    }
  }

  /// Specify override values for various POS client settings. For each overridden value, re-write the relevant setting
  /// entry and return the resulting structure.
  ///
  /// - Parameter apiKey: API key to use when communicating with the remote service.
  /// - Parameter messaging: Options related to messaging access.
  /// - Parameter resume: Session ID to resume, if applicable.
  /// - Parameter hardware: Information about the point-of-sale hardware we're running on.
  /// - Parameter app: Information about the point-of-sale application we're running.
  /// - Returns: Point-of-Sale authorize options, with the specified overrides.
  public func withOverrides(apiKey: APIKey? = nil,
                            messaging: MessagingOptions? = nil,
                            resume: String? = nil,
                            hardware: POSHardware? = nil,
                            app: DeviceApplication? = nil) -> POSAuthorizeOptions {
    return POSAuthorizeOptions(apiKey: apiKey ?? self.apiKey,
                               messaging: messaging ?? self.messaging,
                               resume: resume ?? self.resume,
                               hardware: hardware,
                               app: app)
  }
}


// MARK: - Method: Authorize User -

extension PointOfSaleClient {
  // MARK: Internals

  private func authorizeUser(_ request: POSAuthorize.Request,
                             withAPIKey apiKey: APIKey) throws -> POSAuthorize.Response {
    return try self.service(apiKey).authorize(request)
  }

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
  /// provided via user auth, for an account that has never been used on POS before or has lost their passcode. Initial
  /// account authorization (via this method) is supported for email/password and business-social-based authentication.
  ///
  /// - Attention: Device activation is required before most operations. Authorization tokens for menu downloads, shop
  /// operations, and others, are provided by the device activation process.
  ///
  /// - SeeAlso: Asynchronous variants of `authorize(userToken:)`.
  ///
  /// - Parameter token: User identity token to authorize.
  /// - Parameter device: Device key for the POS device requesting authorization.
  /// - Parameter options: Options to apply to the request.
  /// - Returns: Authorization response. This method is synchronous.
  /// - Throws: Client-side and server-side errors are both thrown.
  public func authorize(userToken token: IdentityToken,
                        forDevice device: PartnerDeviceKey,
                        withOptions options: POSAuthorizeOptions) throws -> POSAuthorize.Response {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.authorizeUser(POSAuthorize.Request.with { obj in
      obj.token = token
      obj.register = deviceKey
      if let resumption = options.resume {
        obj.session = resumption
      }
      if let hw = options.hardware {
        obj.hardware = hw
      }
      if let app = options.app {
        obj.app = app
      }
      if let nce = options.messaging?.nonce {
        obj.messaging = MessagingAuth.with { msg in
          msg.nonce = nce
        }
      }
    }, withAPIKey: apiKey)
  }

  /// Authorize a user account for a staff member to make use of point-of-sale hardware, using their response to an auth
  /// challenge (usually a passcode). The challenge value, which is known by the point-of-sale device and server-side
  /// system ahead of time, is combined with the user's passcode response, hashed, signed, and provided as the "auth
  /// challenge response," which is validated server-side like a password would be.
  ///
  /// - Attention: Device activation is required before most operations. Authorization tokens for menu downloads, shop
  /// operations, and others, are provided by the device activation process.
  ///
  /// - SeeAlso: Asynchronous variants of `authorize(withUserChallenge:)`.
  ///
  /// - Parameter challenge: Challenge and response, as a signed digest payload.
  /// - Parameter device: Device key for the POS device requesting authorization.
  /// - Parameter options: Options to apply to the request.
  /// - Returns: Authorization response. This method is synchronous.
  /// - Throws: Client-side and server-side errors are both thrown.
  public func authorize(withUserChallenge challenge: Hash,
                        forDevice device: PartnerDeviceKey,
                        withOptions options: POSAuthorizeOptions) throws -> POSAuthorize.Response {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.authorizeUser(POSAuthorize.Request.with { obj in
      obj.challenge = challenge
      obj.register = deviceKey
      if let resumption = options.resume {
        obj.session = resumption
      }
      if let hw = options.hardware {
        obj.hardware = hw
      }
      if let app = options.app {
        obj.app = app
      }
      if let nce = options.messaging?.nonce {
        obj.messaging = MessagingAuth.with { msg in
          msg.nonce = nce
        }
      }
    }, withAPIKey: apiKey)
  }

  /// Authorize a user account for a staff member to make use of point-of-sale hardware, using an identity token
  /// provided via user auth, for an account that has never been used on POS before or has lost their passcode. Initial
  /// account authorization (via this method) is supported for email/password and business-social-based authentication.
  ///
  /// This method variant is asynchronous and accepts a callback to continue execution.
  ///
  /// - Attention: Device activation is required before most operations. Authorization tokens for menu downloads, shop
  /// operations, and others, are provided by the device activation process.
  ///
  /// - SeeAlso: Synchronous variants of `authorize(userToken:)`.
  ///
  /// - Parameter token: User identity token to authorize.
  /// - Parameter device: Device key for the POS device requesting authorization.
  /// - Parameter options: Options to apply to the request.
  /// - Parameter callback: Callable to dispatch once either a terminal error or response are available.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: Client-side errors are thrown before the request is sent.
  @discardableResult
  public func authorize(userToken token: IdentityToken,
                        forDevice device: PartnerDeviceKey,
                        withOptions options: POSAuthorizeOptions,
                        _ callback: @escaping POSAuthorizeCallback) throws -> POSAuthorizeCall {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.authorizeUser(POSAuthorize.Request.with { obj in
      obj.token = token
      obj.register = deviceKey
      if let resumption = options.resume {
        obj.session = resumption
      }
      if let hw = options.hardware {
        obj.hardware = hw
      }
      if let app = options.app {
        obj.app = app
      }
      if let nce = options.messaging?.nonce {
        obj.messaging = MessagingAuth.with { msg in
          msg.nonce = nce
        }
      }
    }, withAPIKey: apiKey, callback)
  }

  /// Authorize a user account for a staff member to make use of point-of-sale hardware, using their response to an auth
  /// challenge (usually a passcode). The challenge value, which is known by the point-of-sale device and server-side
  /// system ahead of time, is combined with the user's passcode response, hashed, signed, and provided as the "auth
  /// challenge response," which is validated server-side like a password would be.
  ///
  /// This method variant is asynchronous and accepts a callback to continue execution.
  ///
  /// - Attention: Device activation is required before most operations. Authorization tokens for menu downloads, shop
  /// operations, and others, are provided by the device activation process.
  ///
  /// - SeeAlso: Synchronous variants of `authorize(withUserChallenge:)`.
  ///
  /// - Parameter challenge: Challenge and response, as a signed digest payload.
  /// - Parameter device: Device key for the POS device requesting authorization.
  /// - Parameter options: Options to apply to the request.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: Client-side errors are thrown before the request is sent.
  @discardableResult
  public func authorize(withUserChallenge challenge: Hash,
                        forDevice device: PartnerDeviceKey,
                        withOptions options: POSAuthorizeOptions,
                        _ callback: @escaping POSAuthorizeCallback) throws -> POSAuthorizeCall {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.authorizeUser(POSAuthorize.Request.with { obj in
      obj.challenge = challenge
      obj.register = deviceKey
      if let resumption = options.resume {
        obj.session = resumption
      }
      if let hw = options.hardware {
        obj.hardware = hw
      }
      if let app = options.app {
        obj.app = app
      }
      if let nce = options.messaging?.nonce {
        obj.messaging = MessagingAuth.with { msg in
          msg.nonce = nce
        }
      }
    }, withAPIKey: apiKey, callback)
  }

}
