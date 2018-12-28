//
//  IdentityClient.swift
//  Bloombox
//
//  Created by Sam Gammon on 12/16/18.
//

import Foundation
import SwiftGRPC


// Type Aliases


public typealias KeyID = String


// Callback Types

/// Callback type definition for an identity resolution routine, where public key material is fetched according to its
/// opaque key ID, or cryptographic fingerprint.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `ResolveKey.Response?`: If the call succeeded, a key resolution response, else `nil`.
///    - `Error?`: If an error occurred before request transmission, or server-side, it is provided here.
public typealias IdentityResolveCallback = (CallResult?, ResolveKey.Response?, Error?) -> ()


/// Enumerates code-level errors in the identity client.
public enum IdentityClientError: Error {
  /// No API key could be resolved, or the given API key was invalid.
  case invalidApiKey

  /// Thrown when a key is attempted for resolution with a fingerprint that uses an unsupported algorithm.
  case unsupportedAlgorithm

  /// Thrown when digest content cannot be resolved.
  case invalidDigest

  /// An unknown client-side error occurred.
  case unknown
}

/// Provides functionality for the Identity API, which is a simple service that supports resolution of arbitrary public
/// key material, previously registered by the agent that controls each key, by the public key's opaque key ID or
/// cryptographic fingerprint. In some circumstances, key ownership information is provided as well.
///
/// The main function of the Identity API is to resolve public keys for the purpose of verifying signatures. In most
/// cases, a signature in the Bloombox ecosystem includes the fingerprint of the public key portion of the asymmetric
/// keypair that performed the signing.
public final class IdentityClient: RemoteService {
  /// Name of the Identity API, which is "identity".
  let name = "identity"

  /// Version of this service.
  let version = "v1beta1"

  // MARK: Internals

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Low-level identity service.
  internal var svc: IdentityService?

  /// Library-internal initializer.
  ///
  /// - Parameter settings: Client-wide settings to apply.
  internal init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Identity service. Retrieve an implementation of the identity service, capable of communicating with server-side
  /// methods for resolving public key material.
  ///
  /// - Parameter apiKey: API Key to use.
  /// - Parameter settings: Combined settings to use.
  /// - Returns: Prepared Identity API service class.
  /// - Throws: Client-side errors. See: `IdentityClientError`.
  private func service(_ apiKey: APIKey) throws -> IdentityService {
    if let s = self.svc {
      return s
    }
    let svc = RPCServiceFactory<IdentityService>.factory(
      forService: Transport.config.services.identity,
      withSettings: self.settings)

    try svc.metadata.add(key: "x-api-key", value: apiKey)
    self.svc = svc
    return svc
  }

  /// Resolve method context, throwing an error if it cannot be figured out. Where identity ops are concerned, this
  /// only includes the API key with which we should connect to the service.
  ///
  /// - Parameter apiKey: API key to connect to the service with.
  /// - Returns: API key to use, based either on the override or library-default value.
  /// - Throws: Client-side errors. See: `IdentityClientError`.
  private func resolveContext(_ apiKey: APIKey? = nil) throws -> APIKey {
    let apiKey: APIKey? = apiKey ?? settings.apiKey
    
    guard apiKey != nil else {
      throw IdentityClientError.invalidApiKey
    }
    return apiKey!
  }

  /// Resolve cryptographic hex digest from a `Hash` data structure, for the purpose of resolving a key.
  ///
  /// - Parameter fingerprint: Cryptographic fingerprint structure.
  /// - Returns: Hash algorithm in use and resolved hexdigest.
  /// - Throws: `IdentityClientError.invalidDigest` if digest content cannot be resolved.
  private func resolveHexdigest(_ fingerprint: Hash) throws -> (algorithm: HashAlgorithm, content: String) {
    guard fingerprint.algorithm == .sha1 || fingerprint.algorithm == .md5 else {
      throw IdentityClientError.unsupportedAlgorithm
    }
    
    guard let digest = fingerprint.digest else {
      throw IdentityClientError.invalidDigest
    }
    
    // we have some kind of digest content
    let subject: String
    switch digest {
    case .hex(let content):
      subject = content.uppercased().trimmingCharacters(in: .whitespacesAndNewlines)
    default:
      throw IdentityClientError.invalidDigest
    }
    return (algorithm: fingerprint.algorithm, content: subject)
  }

  // MARK: - Public API -

  // MARK: Key Resolution

  /// Resolve public key material by the key pair's assigned or generated opaque key ID. In some circumstances,
  /// public keys are resolved by an ID (for instance when JWT or JWS structures are involved). Keypairs are
  /// registered by the agent that originally retains custody of the key.
  ///
  /// - Parameter id: Opaque key ID to retrieve.
  /// - Parameter apiKey: Override the API key set in library defaults.
  /// - Returns: Key material response. This method is synchronous, so a response is returned directly.
  /// - Throws: `IdentityClientError` codes related to the API key or other circumstances.
  public func publicKey(byID id: KeyID,
                        authorizedBy apiKey: APIKey? = nil) throws -> ResolveKey.Response {
    return try self.service(try resolveContext(apiKey)).keyResolve(ResolveKey.Request.with { builder in
      builder.keyID = id
    })
  }

  /// Resolve public key material, asynchronously, by the key pair's assigned or generated opaque key ID. In some
  /// circumstances, public keys are resolved by an ID (for i nstance when JWT or JWS structures are involved).
  /// Keypairs are registered by the agent that originally retains custody of the key.
  ///
  /// - Parameter id: Opaque key ID to retrieve.
  /// - Parameter apiKey: Override the API key set in library defaults.
  /// - Parameter callback: Callable to dispatch once either a response or terminal error is available.
  /// - Returns: RPC call object, which can be observed or cancelled.
  /// - Throws: `IdentityClientError` codes related to the API key or other circumstances.
  @discardableResult
  public func publicKey(byID id: KeyID,
                        authorizedBy apiKey: APIKey? = nil,
                        _ callback: @escaping IdentityResolveCallback) throws -> ResolveKeyCall {
    return try self.service(try resolveContext(apiKey)).keyResolve(ResolveKey.Request.with { builder in
      builder.keyID = id
    }) { (response, callResult) in
      callback(callResult, response, nil)
    }
  }

  /// Resolve public key material, synchronously, by the subject keypair's public key cryptographic
  /// fingerprint. In circumstances where a signature is present (for instance, a transaction), the asymmetric
  /// keypair that performed the signature is referenced by a cryptographic fingerprint of the key pair's
  /// constituent public key. This method allows fetching of the backing public key, so it may be used to
  /// verify signatures associated with the key pair.
  ///
  /// - Parameter fingerprint: Key fingerprint to retrieve. Only SHA1 and MD5 are supported, for now.
  /// - Parameter apiKey: Override the API key set in library defaults.
  /// - Returns: Key material response. This method is synchronous, so a response is returned directly.
  /// - Throws: `IdentityClientError` codes related to the API key or other circumstances.
  /// - Throws: `IdentityClientError.invalidDigest` if the digest content cannot be resolved.
  /// - Throws: `IdentityCLientError.unsupportedAlgorithm` if the fingerprint structure uses an unsupported
  ///           algorithm. At the time of writing, SHA1 and MD5 are supported.
  public func publicKey(fingerprint: Hash,
                        authorizedBy apiKey: APIKey? = nil) throws -> ResolveKey.Response {
    let (algorithm, subject) = try self.resolveHexdigest(fingerprint)
    return try self.service(try resolveContext(apiKey)).keyResolve(ResolveKey.Request.with { builder in
      // we support SHA1 and MD5 here, for now
      switch algorithm {
      case .sha1: builder.sha1 = subject
      case .md5: builder.md5 = subject
      default: throw IdentityClientError.unsupportedAlgorithm
      }
    })
  }

  /// Resolve public key material, asynchronously, by the subject keypair's public key cryptographic
  /// fingerprint. In circumstances where a signature is present (for instance, a transaction), the asymmetric
  /// keypair that performed the signature is referenced by a cryptographic fingerprint of the key pair's
  /// constituent public key. This method allows fetching of the backing public key, so it may be used to
  /// verify signatures associated with the key pair.
  ///
  /// - Parameter fingerprint: Key fingerprint to retrieve. Only SHA1 and MD5 are supported, for now.
  /// - Parameter apiKey: Override the API key set in library defaults.
  /// - Parameter callback: Callable to dispatch once either a response or terminal error is available.
  /// - Returns: RPC call object, which can be observed or cancelled.
  /// - Throws: `IdentityClientError` codes related to the API key or other circumstances.
  /// - Throws: `IdentityClientError.invalidDigest` if the digest content cannot be resolved.
  /// - Throws: `IdentityCLientError.unsupportedAlgorithm` if the fingerprint structure uses an unsupported
  ///           algorithm. At the time of writing, SHA1 and MD5 are supported.
  public func publicKey(fingerprint: Hash,
                        authorizedBy apiKey: APIKey? = nil,
                        _ callback: @escaping IdentityResolveCallback) throws -> ResolveKeyCall {
    let (algorithm, subject) = try self.resolveHexdigest(fingerprint)
    return try self.service(try resolveContext(apiKey)).keyResolve(ResolveKey.Request.with { builder in
      // we support SHA1 and MD5 here, for now
      switch algorithm {
      case .sha1: builder.sha1 = subject
      case .md5: builder.md5 = subject
      default: throw IdentityClientError.unsupportedAlgorithm
      }
    }) { (response, callResult) in
      callback(callResult, response, nil)
    }
  }
}
