//
//  MenuClient.swift
//  Client
//
//  Created by James Clark on 1/21/18.
//

import Foundation
import gRPC


// Callback Types
public typealias MenuRetrieveCallback = (CallResult, GetMenu.Response?) -> ()


/**
 * Apply RPC Service compliance to the Menu Service.
 */
extension MenuService: RPCService {}


/**
 * Enumerates code-level errors in the menu client.
 */
public enum MenuClientError: Error {
  case invalidPartnerCode
  case invalidLocationCode
}


/**
 * Provides functionality for the Shop API, which supports operations related to pickup or
 * delivery ordering, member verification and enrollment, and basic shop operations.
 */
public final class MenuClient: RemoteService {
  /**
   * Name of the Menu API, which is "menu".
   */
  let name = "menu"

  /**
   * Version of this service.
   */
  let version = "v1beta1"

  // MARK: Internals

  /**
   * Menu service.
   */
  internal let service: MenuService

  /**
   * Client-wide settings.
   */
  internal let settings: BloomboxClient.Settings

  /**
   * Library-internal initializer.
   */
  internal init(settings: BloomboxClient.Settings) {
    self.settings = settings
    service = RPCServiceFactory<MenuService>.factory(forService: Transport.config.services.menu)
  }

  /**
   * Resolve partner and location context, throwing an error if it cannot be figured out.
   */
  private func resolveContext(_ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil) throws -> (partner: PartnerCode, location: LocationCode) {
    let partnerCode: PartnerCode? = partner ?? settings.partner
    let locationCode: LocationCode? = location ?? settings.location

    // validate partner and location codes
    guard partnerCode != nil, locationCode != nil else {
      // throw error: we require a partner or location code from somewhere
      if (partnerCode == nil) {
        throw MenuClientError.invalidPartnerCode
      }
      throw MenuClientError.invalidPartnerCode
    }
    return (partner: partnerCode!, location: locationCode!)
  }

  /**
   * Prepare the shop service for use.
   */
  func prepare() {
  }

  // MARK: - Public API -

  // MARK: Menu Retrieve
  /**
   * Retrieve the active product catalog (menu) for a given partner/location.
   */
  public func retrieve(partner: PartnerCode? = nil,
                       location: LocationCode? = nil) throws -> GetMenu.Response {
    let (locationCode, partnerCode) = try resolveContext(partner, location)
    return try self.service.retrieve(GetMenu.Request.with { builder in
      builder.scope = "partners/\(locationCode)/locations/\(partnerCode)"
    })
  }

  /**
   * Retrieve the active product catalog, asynchronously (menu) for a given
   * partner/location.
   */
  public func retrieve(partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       callback: @escaping MenuRetrieveCallback) throws -> GetMenuCall {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.retrieve(GetMenu.Request.with { builder in
      builder.scope = "partners/\(locationCode)/locations/\(partnerCode)"
    }) { (response, callResult) in
      callback(callResult, response)
    }
  }
}
