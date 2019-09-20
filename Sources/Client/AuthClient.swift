/**
* Copyright 2019, Momentum Ideas, Co. All rights reserved.
* Source and object computer code contained herein is the private intellectual
* property of Momentum Ideas Co., a Delaware Corporation. Use of this
* code in source form requires permission in writing before use or the
* assembly, distribution, or publishing of derivative works, for commercial
* purposes or any other purpose, from a duly authorized officer of Momentum
* Ideas Co.
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

import Foundation
import SwiftGRPC


// Type Aliases

/// One-time-use authorization nonce value.
public typealias NonceValue = String

/// User public key content, encoded in hex form.
public typealias UserPublicKey = String

/// Firebase Cloud Messaging (FCM) push token.
public typealias EncodedFCMToken = String

/// Apple Push Notification Service (APNS) push token.
public typealias EncodedAPNSToken = String

/// Verified user identity ID.
public typealias VerifiedIdentityToken = String

/// Auth API call context, including a partner code, location code, and API key.
public typealias AuthAPIContext = (partner: PartnerCode?, location: LocationCode?, apiKey: APIKey)


// Callback Types

/// Defines a callback interface for receiving an authorization nonce, once one is ready, or indicating a fatal
/// error retrieving an authorization nonce. Either way, a gRPC call result is provided, which contains the
/// final status of the call. No return value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `AuthNonce?`: Resulting authorization nonce, if once could be generated.
public typealias AuthNonceCallback = (CallResult, NonceValue?) -> ()

/// Defines a callback interface for completing an identity connection flow, wherein, a verified user identity
/// is asserted to the backend platform, verified, and used to initialize a consumer-side user account. Whether
/// the call terminates in a success or error state, a gRPC call result is provided, which contains the final
/// status of the call. No return value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `IdentityConnect.Response?`: Identity connection transaction response/result.
public typealias IdentityConnectCallback = (CallResult, IdentityConnect.Response?) -> ()


/// Defines a callback interface for retrieving a user's profile, via their user key. If the profile can be located and
/// the invoking user is duly authenticated and authorized to read it, it is provided in the callback here as the second
/// parameter, with the gRPC call result as the first. No return result is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `User?`: User profile, if it could be located.
public typealias GetProfileCallback = (CallResult, User?) -> ()


/// Enumerates code-level errors in the auth client.
public enum AuthClientError: Error {
  /// No partner code could be resolved, or the given partner code was invalid.
  case invalidPartnerCode

  /// No location code could be resolved, or the given location code was invalid.
  case invalidLocationCode

  /// No API key could be resolved, or the given API key was invalid.
  case invalidApiKey

  /// An unknown client-side error occurred.
  case unknown
}


/// Describes the application and device performing identity connection, in an identity connection flow. This
/// includes both the software and hardware (in the form of the hardware's fingerprint UUID, and the software's
/// application ID and API key).
public struct ConnectApp {
  /// Software application ID, usually the bundle ID on Apple platforms.
  let client: String

  /// Device fingerprint. Generated and persisted on the device, but may change between app installs.
  let fingerprint: DeviceUUID

  /// Firebase Cloud Messaging (FCM) push token. Uniquely addresses the device for push notifications.
  let fcm: EncodedFCMToken

  /// Apple Push Notification Service (APNS) push token. Uniquely addresses the device for push notifications.
  let apns: EncodedAPNSToken?

  /// Advertising identifier for the user, if applicable.
  let adid: String?

  /// Initialize a new identity connect flow context object, which carries with it details about the client
  /// software and hardware agent performing the flow on behalf of the user.
  ///
  /// - Parameter client: Software application ID, usually the bundle ID on Apple platforms.
  /// - Parameter fingerprint: Device fingerprint. Generated and persisted on the device.
  /// - Parameter fcm: Firebase Cloud Messaging (FCM) push token, uniquely identifying the device.
  /// - Parameter apns: Apple Push Notification Service (APNS) push token, uniquely identifying the device.
  /// - Parameter adid: Advertising identifier for the user, if applicable.
  public init(client: String,
              fingerprint: DeviceUUID,
              fcm: EncodedFCMToken,
              apns: EncodedAPNSToken? = nil,
              adid: String? = nil) {
    self.client = client
    self.fingerprint = fingerprint
    self.fcm = fcm
    self.apns = apns
    self.adid = adid
  }
}


/// Specifies a client interface for the Auth API, which supports authentication and authorization flows in
/// various circumstances. The Auth API is also responsible for managing consent flows and OAuth2 parameters.
public final class AuthClient: RemoteService {
  /// Name of the Auth API, which is "auth".
  let name = "auth"

  /// Version of this service.
  let version = "v1beta1"

  // MARK: Internals

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Low-level auth service.
  internal var svc: AuthService?

  /// Library-internal initializer.
  ///
  /// - Parameter settings: Client-wide settings to apply.
  internal init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Auth service. Retrieve an implementation of the auth service, capable of authenticating, authorizing,
  /// verifying and renewing user credentials in various circumstances.
  ///
  /// - Parameter apiKey: API Key to use.
  /// - Parameter settings: Combined settings to use.
  /// - Returns: Prepared Auth API service class.
  /// - Throws: Client-side errors. See: `AuthClientError`.
  private func service(_ apiKey: APIKey) throws -> AuthService {
    if let s = self.svc {
      return s
    }
    let svc = RPCServiceFactory<AuthService>.factory(
      forService: Transport.config.services.devices,
      withSettings: self.settings)

    try svc.metadata.add(key: "x-api-key", value: apiKey)
    self.svc = svc
    return svc
  }

  /// Resolve method context, throwing an error if it cannot be figured out. Where auth is concerned, this
  /// includes the subject partner and location code associated with the property (optionally), and an API
  /// key with which we should connect to the service to identify the software.
  ///
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Location account code to use.
  /// - Parameter apiKey: API key to use with the service.
  /// - Returns: Tuple of partner, location, and API key to use.
  /// - Throws: `MenuClientError` codes if items cannot be resolved.
  private func resolveContext(_ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil,
                              _ apiKey: APIKey? = nil,
                              enforcePartnerLocation enforce: Bool = true) throws -> AuthAPIContext {
    let partnerCode: PartnerCode? = partner ?? settings.partner
    let locationCode: LocationCode? = location ?? settings.location
    let apiKey: APIKey? = apiKey ?? settings.apiKey

    guard apiKey != nil else {
      throw AuthClientError.invalidApiKey
    }

    // validate partner and location codes
    if enforce {
      guard partnerCode != nil, locationCode != nil else {
        // throw error: we require a partner or location code from somewhere
        if partnerCode == nil {
          throw MenuClientError.invalidPartnerCode
        }
        throw MenuClientError.invalidLocationCode
      }
    }
    return (partner: partnerCode, location: locationCode, apiKey: apiKey!)
  }

  /// Build a uniform request to connect a verified identity with a user account.
  ///
  /// - Parameter identity: Verified user identity ID.
  /// - Parameter publicKey: User's public key.
  /// - Parameter nonce: Authorization nonce.
  /// - Parameter client: Details about the client app and hardware.
  /// - Returns: Prepared identity connect request.
  private func buildConnectRequest(_ identity: VerifiedIdentityToken,
                                   _ publicKey: UserPublicKey,
                                   _ nonce: NonceValue,
                                   _ client: ConnectApp) -> IdentityConnect.Request {
    return IdentityConnect.Request.with { builder in
      builder.token = identity
      builder.key = publicKey
      builder.nonce = nonce
      builder.fcm = client.fcm
      builder.client = client.client
      builder.device = client.fingerprint

      if let apns = client.apns {
        builder.apns = apns
      }

      if let adid = client.adid {
        builder.adid = adid
      }
    }
  }

  // MARK: - Auth Nonce

  /// Generate and return an authorization nonce, which is required for certain secured auth flows. An auth
  /// nonce value is an opaque string, which, after being requested via an interface secured behind an API key,
  /// may be used once (and only once) as the precursor value to begin an authorization flow. If the flow fails
  /// or any other fatal error is encountered during the transaction without fully satisfying the nonce, it
  /// must be discarded and exchanged for a new one.
  ///
  /// - Parameter apiKey: API key to invoke the remote service with. If nil, the client-wide key will be used.
  /// - Returns: Resulting authorization nonce, which is a `String`, aliased to `NonceValue`.
  /// - Throws: Client-side and server-side errors, since this method is synchronous.
  public func nonce(apiKey: APIKey? = nil) throws -> NonceValue {
    let (_, _, apiKey) = try resolveContext(nil, nil, apiKey, enforcePartnerLocation: false)
    return try self.service(apiKey).nonce(Empty()).nonce
  }

  /// Generate and return an authorization nonce, asynchronously, which is required for certain secured auth
  /// flows. An auth nonce value is an opaque string, which, after being requested via an interface secured
  /// behind an API key, may be used once (and only once) as the precursor value to begin an authorization
  /// flow. If the flow fails or any other fatal error is encountered during the transaction without fully
  /// satisfying the nonce, it must be discarded and exchanged for a new one.
  ///
  /// - Parameter apiKey: API key to invoke the remote service with. If nil, the client-wide key will be used.
  /// - Parameter callback: Callback to dispatch once a nonce or a fatal error is available.
  /// - Returns: RPC call object, which may be used to observe and cancel the underlying RPC call.
  /// - Throws: Client-side errors only, since this method is async. Server side methods occur in the callback.
  @discardableResult
  public func nonce(apiKey: APIKey? = nil, _ callback: @escaping AuthNonceCallback) throws -> AuthNonceCall {
    let (_, _, apiKey) = try resolveContext(nil, nil, apiKey, enforcePartnerLocation: false)
    return try self.service(apiKey).nonce(Empty()) { response, callResult in
      callback(callResult, response?.nonce)
    }
  }

  // MARK: - Profile Fetch

  /// Retrieve a user's profile using their universal key. The user's profile key is resolved from the identity ID,
  /// which is resolved or generated during the authentication process (so, you must complete an auth flow to retrieve
  /// the user's profile via this method). Only the owning user, and any application authorized by the owning user, may
  /// read the user's full profile - for social connections and similar operations, profile results may return truncated
  /// data, omitting details to which the invoking user does not have access.
  ///
  /// - Parameter userKey: Key for the user profile we would like to fetch.
  /// - Parameter apiKey: API key to use when fetching the profile. If none is specified, use the client-wide default.
  /// - Returns: User profile, if one can be found. If one cannot be found, an error is thrown.
  /// - Throws: Server-side and client-side errors, including `USER_NOT_FOUND` if the user cannot be found.
  public func profile(forUser userKey: UserKey,
                      apiKey: APIKey? = nil) throws -> User {
    let (_, _, apiKey) = try resolveContext(nil, nil, apiKey, enforcePartnerLocation: false)
    return try self.service(apiKey).profile(GetProfile.Request.with { builder in
      builder.user = userKey.uid
    }).profile
  }

  /// Retrieve a user's profile using their universal key. The user's profile key is resolved from the identity ID,
  /// which is resolved or generated during the authentication process (so, you must complete an auth flow to retrieve
  /// the user's profile via this method). Only the owning user, and any application authorized by the owning user, may
  /// read the user's full profile - for social connections and similar operations, profile results may return truncated
  /// data, omitting details to which the invoking user does not have access.
  ///
  /// This method fetches the user profile asynchronously and provides results in callback form. The returned RPC call
  /// object may be used to cancel or observe the underlying RPC call.
  ///
  /// - Parameter userKey: Key for the user profile we would like to fetch.
  /// - Parameter apiKey: API key to use when fetching the profile. If none is specified, use the client-wide default.
  /// - Parameter callback: Callback to dispatch once a response, or terminal error, is available.
  /// - Returns: User profile, if one can be found. If one cannot be found, an error is thrown.
  /// - Throws: Server-side and client-side errors, including `USER_NOT_FOUND` if the user cannot be found.
  @discardableResult
  public func profile(forUser userKey: UserKey,
                      apiKey: APIKey? = nil,
                      _ callback: @escaping GetProfileCallback) throws -> GetProfileCall {
    let (_, _, apiKey) = try resolveContext(nil, nil, apiKey, enforcePartnerLocation: false)
    return try self.service(apiKey).profile(GetProfile.Request.with { builder in
      builder.user = userKey.uid
    }) { resp, callResult in
      callback(callResult, resp?.profile)
    }
  }

  // MARK: - Identity Connect

  /// Begin an identity connect flow, having already verified the user's identity using an external service.
  /// Before beginning this process, the invoking application must acquire a valid authorization nonce, and
  /// request that the user sign a data payload containing the nonce, verified user ID, client application,
  /// fingerprint, and other details (see online documentation). That signed payload is embedded in the JWT
  /// provided here, and sent along with the user's public key, the nonce, and client-app details.
  ///
  /// If no user account could be located, one is created and initialized, and a response is returned
  /// indicating the user must complete profile signup.
  ///
  /// - Parameter identity: Verified user identity token (JWT).
  /// - Parameter publicKey: Hex-encoded public key for the user's secure private key.
  /// - Parameter nonce: One-time-use nonce, issued for this auth flow.
  /// - Parameter client: Client application and device details for the software requesting authorization.
  /// - Parameter apiKey: API key to identify ourselves with to the Auth API.
  /// - Returns: Authorization token and user profile resulting from this transaction.
  /// - Throws: Client and server-side errors, since this method is synchronous.
  public func connect(identity: VerifiedIdentityToken,
                      withPublicKey publicKey: UserPublicKey,
                      andNonce nonce: NonceValue,
                      forClient client: ConnectApp,
                      apiKey: APIKey? = nil) throws -> IdentityConnect.Response {
    let (_, _, apiKey) = try resolveContext(nil, nil, apiKey, enforcePartnerLocation: false)
    return try self.service(apiKey).connect(self.buildConnectRequest(identity, publicKey, nonce, client))
  }

  /// Begin an identity connect flow, having already verified the user's identity using an external service.
  /// Before beginning this process, the invoking application must acquire a valid authorization nonce, and
  /// request that the user sign a data payload containing the nonce, verified user ID, client application,
  /// fingerprint, and other details (see online documentation). That signed payload is embedded in the JWT
  /// provided here, and sent along with the user's public key, the nonce, and client-app details.
  ///
  /// If no user account could be located, one is created and initialized, and a response is returned
  /// indicating the user must complete profile signup.
  ///
  /// - Parameter identity: Verified user identity token (JWT).
  /// - Parameter publicKey: Hex-encoded public key for the user's secure private key.
  /// - Parameter nonce: One-time-use nonce, issued for this auth flow.
  /// - Parameter client: Client application and device details for the software requesting authorization.
  /// - Parameter apiKey: API key to identify ourselves with to the Auth API.
  /// - Parameter callback: Response callback to dispatch once a response or error is ready.
  /// - Returns: RPC call object, which can be used
  /// - Throws: Client and server-side errors, since this method is synchronous.
  @discardableResult
  public func connect(identity: VerifiedIdentityToken,
                      withPublicKey publicKey: UserPublicKey,
                      andNonce nonce: NonceValue,
                      forClient client: ConnectApp,
                      apiKey: APIKey? = nil,
                      _ callback: @escaping IdentityConnectCallback) throws -> IdentityConnectCall {
    let (_, _, apiKey) = try resolveContext(nil, nil, apiKey, enforcePartnerLocation: false)
    let request = self.buildConnectRequest(identity, publicKey, nonce, client)

    return try self.service(apiKey).connect(request) { callResult, response in
      callback(response, callResult)
    }
  }

}
