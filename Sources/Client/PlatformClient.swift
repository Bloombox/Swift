//
//  PlatformClient.swift
//  BloomboxPackageDescription
//
//  Created by Sam Gammon on 9/29/18.
//

import Foundation
import SwiftGRPC
import Schema


// Types & Enums

/// Ping callback specification. Accepts a gRPC call result, and a platform service status, which indicates the status
/// of the server-side systems that responded to the ping. Two parameters are given and no return value is expected.
///
/// - Parameters:
///    - `CallResult: gRPC call result, carrying the status of the call.
///    - `PlatformServiceStatus?`: If the call succeeded, the self-reported status of the responder server systems.
public typealias PlatformPingCallback = (CallResult, PlatformServiceStatus?) -> ()

/// Health check callback specification. Accepts a simple gRPC call result, and no response, because health checks
/// simply provide an empty success as a response in the case of an all-clear. Just one parameter is given and no return
/// value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
public typealias HealthcheckCallback = (CallResult) -> ()

/// Domain resolution callback specification. Accepts a gRPC call result, and a domain resolution response, if info
/// could be resolved for the given partner and location account codes. Two parameters are given and no return value is
/// expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `ResolveDomains.Response?`: Domain resolution response, if information could be resolved.
public typealias ResolveCallback = (CallResult, ResolveDomains.Response?) -> ()

/// Domain configuration callback specification. Accepts a gRPC call result, and a domain info manifest, if domain info
/// could be resolved for the given partner and location account codes. Two parameters are given and no return value is
/// expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `DomainInfo.Response?`: Domain info manifest for the given partner/location info, if available.
public typealias DomainInfoCallback = (CallResult, DomainInfo.Response?) -> ()

/// Brand information callback specification. Accepts a gRPC call result, and a set of branding info for a given partner
/// and location account code set. Two parameters are given and no return value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `BrandInfo.Response?`: Brand information manifest for the given partner/location info, if available.
public typealias BrandCallback = (CallResult, BrandInfo.Response?) -> ()


/// Enumerates code-level errors in the platform client. Client errors occur before a given request is transmitted to
/// remote services.
public enum PlatformClientError: Error {
  /// The provided API key was found to be invalid.
  case invalidApiKey

  /// The provided partner account code was found to be invalid, or none could be resolved.
  case invalidPartnerCode

  /// The provided location account code was found to be invalid, or none could be resolved.
  case invalidLocationCode

  /// The engine failed to base64 encode a given request or request value.
  case cannotBase64Encode
}


/// Provides functionality for the Platform API, which supports general configuration and information support for
/// cannabis retail partner locations. Domains are resolved through the Platform Service to their respective partner and
/// location account codes, or domain info can be resolved for a given partner/location pair. Other utility methods are
/// supported through the Platform Service including healthchecks, pings, and others.
public final class PlatformClient: RemoteService {
  /// API name. Always 'platform'.
  let name = "platform"

  /// Active API version. Currently 'v1'.
  let version = "v1"

  // MARK: Internals

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Library-internal initializer.
  ///
  /// - Parameter settings: Client-wide settings to apply.
  internal init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Platform service. Retrieve an implementation of the platform service, capable of resolving and providing basic,
  /// system and account configuration info.
  ///
  /// - Parameter apiKey: API Key to use.
  /// - Returns: Prepared Platform API service class.
  /// - Throws: `POSClientError` if the API key is not able to be resolved.
  internal func service(_ apiKey: APIKey) throws -> PlatformService {
    let svc = RPCServiceFactory<PlatformService>.factory(forService: Transport.config.services.platform)
    do {
      try svc.metadata.add(key: "x-api-key", value: apiKey)
    } catch {
      // unable to mount API key
      throw POSClientError.invalidApiKey
    }
    return svc
  }

  /// Resolve partner and location context, throwing an error if it cannot be figured out. Partner and location context
  /// is required for all partner calls, along with an API key.
  ///
  /// - Parameter partner: Partner account code to use. If unspecified, library defaults will be used.
  /// - Parameter location: Location account code to use. If unspecified, library defaults will be used.
  /// - Parameter apiKey: API key to identify ourselves with. If unspecified, library defaults will be used.
  /// - Returns: Tuple of `(partner, location, apiKey)`.
  /// - Throws: `MenuClientError` codes if details cannot be resolved.
  private func resolveContext(_ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil,
                              _ apiKey: APIKey? = nil) throws -> (partner: PartnerCode,
                                                                  location: LocationCode,
                                                                  apiKey: APIKey) {
    let partnerCode: PartnerCode? = partner ?? settings.partner
    let locationCode: LocationCode? = location ?? settings.location
    let apiKey: APIKey? = apiKey ?? settings.apiKey

    guard apiKey != nil else {
      throw MenuClientError.invalidApiKey
    }

    // validate partner and location codes
    guard partnerCode != nil, locationCode != nil else {
      // throw error: we require a partner or location code from somewhere
      if partnerCode == nil {
        throw MenuClientError.invalidPartnerCode
      }
      throw MenuClientError.invalidLocationCode
    }
    return (partner: partnerCode!, location: locationCode!, apiKey: apiKey!)
  }

  // MARK: - Public API -

  // MARK: Method: Ping

  ///
  ///
  public func ping() throws -> PlatformPing.Response {
    return try self.service(self.resolveContext().apiKey).ping(PlatformPing.Request())
  }

  ///
  ///
  public func ping(_ callback: @escaping PlatformPingCallback) throws -> PlatformPingCall {
    return try self.service(self.resolveContext().apiKey).ping(PlatformPing.Request()) { (resp, result) in
      callback(result, resp?.status)
    }
  }

  // MARK: Method: Healthcheck

  ///
  ///
  public func healthcheck() throws -> Empty {
    return try self.service(self.resolveContext().apiKey).health(Empty())
  }

  ///
  ///
  public func healthcheck(_ callback: @escaping HealthcheckCallback) throws -> HealthcheckCall {
    return try self.service(self.resolveContext().apiKey).health(Empty()) { (_, result) in
      callback(result)
    }
  }

  // MARK: Method: Resolve

  ///
  ///
  public func resolve(encodedDomain domain: String,
                      forAPIKey apiKey: APIKey? = nil) throws -> ResolveDomains.Response {
    return try self.service(self.resolveContext(apiKey).apiKey)
      .resolve(ResolveDomains.Request.with { req in
        req.origin = domain
      })
  }

  ///
  ///
  public func resolve(encodedDomain domain: String,
                      forAPIKey apiKey: APIKey? = nil,
                      _ callback: @escaping ResolveCallback) throws -> ResolveDomainsCall {
    return try self.service(self.resolveContext(apiKey).apiKey)
      .resolve(ResolveDomains.Request.with { req in
        req.origin = domain
      }) { resp, result in
        // async copy
        callback(result, resp)
    }
  }

  ///
  ///
  public func resolve(domain: String) throws -> ResolveDomains.Response {
    if let encoded = domain.data(using: .utf8)?
                           .base64EncodedString()
                           .replacingOccurrences(of: "=", with: "") {
      // encoded domain
      return try self.resolve(encodedDomain: encoded)
    }
    throw PlatformClientError.cannotBase64Encode
  }

  ///
  ///
  public func resolve(domain: String, _ callback: @escaping ResolveCallback) throws -> ResolveDomainsCall {
    if let encoded = domain.data(using: .utf8)?
                           .base64EncodedString()
                           .replacingOccurrences(of: "=", with: "") {
      return try self.resolve(encodedDomain: encoded, callback)
    }
    throw PlatformClientError.cannotBase64Encode
  }

  // MARK: Method: Domain Info

  ///
  ///
  public func domains(forPartner partner: PartnerCode? = nil,
                      withLocation location: LocationCode? = nil,
                      andAPIKey apiKey: APIKey? = nil) throws -> DomainInfo.Response {
    let ctx = try self.resolveContext(partner, location, apiKey)

    return try self.service(ctx.apiKey).domains(DomainInfo.Request.with { req in
        req.partnerID = ctx.partner
        req.locationID = ctx.location
      })
  }

  ///
  ///
  public func domains(forPartner partner: PartnerCode? = nil,
                      withLocation location: LocationCode? = nil,
                      andAPIKey apiKey: APIKey? = nil,
                      _ callback: @escaping DomainInfoCallback) throws -> DomainInfoCall {
    let ctx = try self.resolveContext(partner, location, apiKey)

    return try self.service(ctx.apiKey).domains(DomainInfo.Request.with { req in
      req.partnerID = ctx.partner
      req.locationID = ctx.location
    }) { resp, result in
      // handle callback
      callback(result, resp)
    }
  }

  // MARK: Method: Brand Info

  ///
  ///
  public func brand(forPartner partner: PartnerCode? = nil,
                    withLocation location: LocationCode? = nil,
                    andAPIKey apiKey: APIKey? = nil) throws -> BrandInfo.Response {
    let ctx = try self.resolveContext(partner, location, apiKey)

    return try self.service(ctx.apiKey).brand(BrandInfo.Request.with { req in
      req.partner = ctx.partner
      req.location = ctx.location
    })
  }

  ///
  ///
  public func brand(forPartner partner: PartnerCode? = nil,
                    withLocation location: LocationCode? = nil,
                    andAPIKey apiKey: APIKey? = nil,
                    _ callback: @escaping BrandCallback) throws -> BrandInfoCall {
    let ctx = try self.resolveContext(partner, location, apiKey)

    return try self.service(ctx.apiKey).brand(BrandInfo.Request.with { req in
      req.partner = ctx.partner
      req.location = ctx.location
    }) { resp, result in
      // handle callback
      callback(result, resp)
    }
  }

}
