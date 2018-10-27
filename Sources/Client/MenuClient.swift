//
//  MenuClient.swift
//  Client
//
//  Created by James Clark on 1/21/18.
//

import Foundation
import SwiftGRPC


// Type Definitions
public typealias MenuRetrieveCallback = (CallResult, GetMenu.Response?) -> ()
public typealias MenuAPIContext = (partner: PartnerCode, location: LocationCode, apiKey: APIKey)


/// Enumerates code-level errors in the menu client. The errors occur before requests hit the server, and deal with
/// configuration errors in most cases.
public enum MenuClientError: Error {
  /// The partner code was not provided, and could not be resolved, before calling a method that needed it.
  case invalidPartnerCode

  /// The location code was not provided, and could not be resolved, before calling a method that needed it.
  case invalidLocationCode

  /// The API key was not provided, and could not be resolved, before calling a method that needed it.
  case invalidApiKey

  /// An unknown client-side error occurred.
  case unknown
}


/// Provides functionality for the Menu API, which supports operations related to fetching, querying, and managing, menu
/// catalog data (i.e. product content, pricing, materials information, and so on). Menus do not include inventory.
public final class MenuClient: RemoteService {
  /// Name of the Menu API, which is "menu".
  let name = "menu"

  /// Version of this service.
  let version = "v1beta1"

  // MARK: Internals

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Service client.
  internal var svc: MenuService?

  /// Library-internal initializer.
  ///
  /// - Parameter settings: Client-wide settings to apply.
  internal init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Menu service. Retrieve an implementation of the menu service, capable of retrieving product catalog information,
  /// focused on the display/showcase of items.
  ///
  /// - Parameter apiKey: API Key to use.
  /// - Returns: Prepared Menu API service class.
  internal func service(_ apiKey: APIKey) throws -> MenuService {
    if let s = self.svc {
      return s
    }
    let svc = RPCServiceFactory<MenuService>.factory(
      forService: Transport.config.services.menu,
      withSettings: self.settings)

    try svc.metadata.add(key: "x-api-key", value: apiKey)
    self.svc = svc
    return svc
  }

  /// Resolve an API key, and partner/location context, throwing an error if it cannot be figured out. These items are
  /// required for all calls to the Menu API. Check library defaults and fall back to them if overrides are not given.
  ///
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Location account code to use.
  /// - Parameter apiKey: API key to use with the service.
  /// - Returns: Tuple of partner, location, and API key to use.
  /// - Throws: `MenuClientError` codes if items cannot be resolved.
  private func resolveContext(_ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil,
                              _ apiKey: APIKey? = nil) throws -> MenuAPIContext {
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

  // MARK: Menu Retrieve

  /// Retrieve the active product catalog (menu) for a given partner/location. Menus are essentially sets of product
  /// catalog information, with a focus on showcasing/displaying the items. This means that items that are currently out
  /// of stock, or not available at this location, or under other similar circumstances, are withheld as results when
  /// querying via the Menu API. These items are available by passing special flags, or via the Inventory API.
  ///
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Location account code to use.
  /// - Parameter keysOnly: Flag to indicate keys-only or full data.
  /// - Parameter apiKey: API key to identify ourselves with to the Menu API.
  /// - Returns: Materialized menu response for the subject partner/location.
  /// - Throws: Client and server-side errors, since this method is synchronous.
  public func retrieve(partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       keysOnly: Bool = false,
                       apiKey: APIKey? = nil) throws -> GetMenu.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)
    let service = try self.service(apiKey)

    return try service.retrieve(GetMenu.Request.with { builder in
      builder.scope = "partners/\(partnerCode)/locations/\(locationCode)"
    })
  }

  /// Retrieve the active product catalog (menu) for a given partner/location, asynchronously. Menus are essentially
  /// sets of product catalog information, with a focus on showcasing/displaying the items. This means that items that
  /// are currently out of stock, or not available at this location, or under other similar circumstances, are withheld
  /// as results when querying via the Menu API. These items are available by passing special flags, or via the
  /// Inventory API.
  ///
  /// The provided callback is dispatched once either a terminal error or RPC response is encountered. The return value
  /// may be used to cancel the call or observe its status.
  ///
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Location account code to use.
  /// - Parameter keysOnly: Flag to indicate keys-only or full data.
  /// - Parameter apiKey: API key to identify ourselves with to the Menu API.
  /// - Parameter callback: Callable to dispatch once a result or terminal error is available.
  /// - Returns: RPC call object, which can be observed to track call status, or used to cancel the call.
  /// - Throws: Client-side errors only. Server-side errors are surfaced in the callback.
  @discardableResult
  public func retrieve(partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       keysOnly: Bool = false,
                       apiKey: APIKey? = nil,
                       callback: @escaping MenuRetrieveCallback) throws -> GetMenuCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)
    let service = try self.service(apiKey)

    return try service.retrieve(GetMenu.Request.with { builder in
      builder.scope = "partners/\(partnerCode)/locations/\(locationCode)"
    }) { (response, callResult) in
      callback(callResult, response)
    }
  }

}
