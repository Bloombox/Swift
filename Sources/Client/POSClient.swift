//
//  POSClient.swift
//  BloomboxPackageDescription
//
//  Created by Sam Gammon on 9/28/18.
//

import Foundation
import SwiftGRPC


// Types & Enums
public typealias POSSessionID = String


/// Enumerates code-level errors in the POS client.
public enum POSClientError: Error {
  case notReady
  case invalidApiKey
  case invalidPartnerCode
  case invalidLocationCode
  case invalidPurchaseKey
  case invalidDeviceKey
  case invalidIDToken
  case invalidAuthToken
  case invalidAuthChallenge
  case invalidAuthUID
}


/// Provides functionality for the Point-of-Sale API, which supports physical, in-person transactions between a licensed
/// cannabis retailer and qualified cannabis consumer. Point-of-Sale hardware is usually managed by Bloombox and
/// provided by our main hardware partner, Elo.
///
/// Point-of-Sale services are designed for private use, but integration is possible with custom software. Once a POS
/// device has activated via the Devices API, the user is authenticated, and an authorized point-of-sale session is
/// established. With an active session, point-of-sale devices can open and modify purchase tickets owned or claimed by
/// the logged-in facilitator.
///
/// A purchase ticket represents the entirety of a physical transaction, including the items purchased, payments made,
/// and a breakdown of subtotal/discounts/taxes, etc.
public final class PointOfSaleClient: RemoteService {
  /// Name of the Point of Sale API, which is "pos".
  let name = "pos"

  /// Version of this service.
  let version = "v1beta1"

  // MARK: Internals

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Library-internal initializer.
  ///
  /// - Parameter settings: Client-wide settings to apply.
  internal init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Point-of-Sale service. Retrieves a prepared copy of the POS service client, initialized with the given API key,
  /// which will be used to identify this hardware/software to the server.
  ///
  /// - Parameter apiKey: API key to identify ourselves to the server with.
  /// - Returns: Prepared point-of-sale service.
  /// - Throws: `POSClientError`s related to client-side configuration.
  internal func service(_ apiKey: APIKey) throws -> PointOfSaleService {
    let svc = RPCServiceFactory<PointOfSaleService>.factory(
      forService: Transport.config.services.pos,
      withSettings: self.settings)
    do {
      try svc.metadata.add(key: "x-api-key", value: apiKey)
    } catch {
      // unable to mount API key
      throw POSClientError.invalidApiKey
    }
    return svc
  }

  /// Resolve partner and location context, throwing an error if it cannot be figured out. If a partner device key or
  /// API key cannot be resolved via arguments, library defaults are used.
  ///
  /// - Parameter device: Device key for the point-of-sale device we're running on.
  /// - Parameter apiKey: Key to identify ourselves to the API with.
  /// - Returns: Tuple of `(device, apiKey)`.
  /// - Throws: `POSClientError.invalidDeviceKey` if a device key cannot be resolved.
  /// - Throws: `POSClientError.invalidApiKey` if a valid API key cannot be resolved.
  /// - Throws: `POSClientError.invalidPartnerCode` or `POSClientError.invalidLocationCode` if account or location code
  ///           values are incorrect or could not be resolved.
  internal func resolveContext(_ device: PartnerDeviceKey? = nil,
                               _ apiKey: APIKey? = nil) throws -> (device: PartnerDeviceKey, apiKey: APIKey) {
    let partnerCode: PartnerCode? = device?.location.partner.code ?? settings.partner
    let locationCode: LocationCode? = device?.location.code ?? settings.location

    let apiKey: APIKey? = apiKey ?? settings.apiKey

    guard apiKey != nil else {
      throw POSClientError.invalidApiKey
    }

    guard device != nil || settings.deviceUUID != nil else {
      throw POSClientError.invalidDeviceKey
    }

    // validate partner and location codes
    guard partnerCode != nil, locationCode != nil else {
      // throw error: we require a partner or location code from somewhere
      if partnerCode == nil {
        throw POSClientError.invalidPartnerCode
      }
      throw POSClientError.invalidLocationCode
    }

    let device: PartnerDeviceKey = device ?? PartnerDeviceKey.with { obj in
      obj.uuid = settings.deviceUUID!
      obj.location = LocationKey.with { loc in
        loc.code = locationCode!
        loc.partner = PartnerKey.with { ptr in
          ptr.code = partnerCode!
        }
      }
    }
    return (device: device, apiKey: apiKey!)
  }

}
