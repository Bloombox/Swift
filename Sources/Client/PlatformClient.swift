//
//  PlatformClient.swift
//  BloomboxPackageDescription
//
//  Created by Sam Gammon on 9/29/18.
//

import Foundation
import SwiftGRPC
import Schema


// Callback Types
public typealias PlatformPingCallback = (CallResult, PlatformServiceStatus?) -> ()
public typealias HealthcheckCallback = (CallResult) -> ()
public typealias ResolveCallback = (CallResult, ResolveDomains.Response?) -> ()
public typealias DomainInfoCallback = (CallResult, DomainInfo.Response?) -> ()
public typealias BrandCallback = (CallResult, BrandInfo.Response?) -> ()


/// Enumerates code-level errors in the platform client.
public enum PlatformClientError: Error {
  case invalidApiKey
  case invalidPartnerCode
  case invalidLocationCode
  case cannotBase64Encode
}


/// Provides functionality for the Platform API, which supports general configuration and information support for
/// cannabis retail partner locations.
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
  public init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Platform service.
  ///
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

  /// Resolve partner and location context, throwing an error if it cannot be figured out.
  ///
  private func resolveContext(_ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil,
                              _ apiKey: APIKey? = nil) throws -> (partner: PartnerCode, location: LocationCode, apiKey: APIKey) {
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
  func ping() throws -> PlatformPing.Response {
    return try self.service(self.resolveContext().apiKey).ping(PlatformPing.Request())
  }

  ///
  ///
  func ping(_ callback: @escaping PlatformPingCallback) throws -> PlatformPingCall {
    return try self.service(self.resolveContext().apiKey).ping(PlatformPing.Request()) { (resp, result) in
      callback(result, resp?.status)
    }
  }

  // MARK: Method: Healthcheck

  ///
  ///
  func healthcheck() throws -> Empty {
    return try self.service(self.resolveContext().apiKey).health(Empty())
  }

  ///
  ///
  func healthcheck(_ callback: @escaping HealthcheckCallback) throws -> HealthcheckCall {
    return try self.service(self.resolveContext().apiKey).health(Empty()) { (_, result) in
      callback(result)
    }
  }

  // MARK: Method: Resolve

  ///
  ///
  func resolve(encodedDomain domain: String,
               forAPIKey apiKey: APIKey? = nil) throws -> ResolveDomains.Response {
    return try self.service(self.resolveContext(apiKey).apiKey)
      .resolve(ResolveDomains.Request.with { req in
        req.origin = domain
      })
  }

  ///
  ///
  func resolve(encodedDomain domain: String,
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
  func resolve(domain: String) throws -> ResolveDomains.Response {
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
  func resolve(domain: String, _ callback: @escaping ResolveCallback) throws -> ResolveDomainsCall {
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
  func domains(forPartner partner: PartnerCode? = nil,
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
  func domains(forPartner partner: PartnerCode? = nil,
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
  func brand(forPartner partner: PartnerCode? = nil,
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
  func brand(forPartner partner: PartnerCode? = nil,
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
