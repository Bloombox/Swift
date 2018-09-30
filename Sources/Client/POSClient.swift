//
//  POSClient.swift
//  BloomboxPackageDescription
//
//  Created by Sam Gammon on 9/28/18.
//

import Foundation
import gRPC


/**
 * Apply RPC Service compliance to the POS service.
 */
extension PointOfSaleService: RPCService {}


/**
 * Enumerates code-level errors in the POS client.
 */
public enum POSClientError: Error {
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


/**
 * Provides functionality for the Point-of-Sale API, which supports physical in-person transactions between a licensed
 * cannabis retailer and qualified cannabis consumer.
 */
public final class PointOfSaleClient: RemoteService {
  /**
   * Name of the Point of Sale API, which is "pos".
   */
  let name = "pos"

  /**
   * Version of this service.
   */
  let version = "v1beta1"

  // MARK: Internals

  /**
   * Client-wide settings.
   */
  internal let settings: Bloombox.Settings

  /**
   * Library-internal initializer.
   */
  public init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /**
   * Point-of-Sale service.
   */
  internal func service(_ apiKey: APIKey) -> PointOfSaleService {
    let svc = RPCServiceFactory<PointOfSaleService>.factory(forService: Transport.config.services.pos)
    svc.metadata.add(key: "x-api-key", value: apiKey)
    return svc
  }

  /**
   * Resolve partner and location context, throwing an error if it cannot be figured out.
   */
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
      if (partnerCode == nil) {
        throw POSClientError.invalidPartnerCode
      }
      throw POSClientError.invalidLocationCode
    }

    let device: PartnerDeviceKey = device ?? PartnerDeviceKey.with { obj in
      obj.uuid = settings.deviceUUID!
      obj.location = PartnerLocationKey.with { loc in
        loc.code = locationCode!
        loc.partner = PartnerKey.with { ptr in
          ptr.code = partnerCode!
        }
      }
    }

    return (device: device, apiKey: apiKey!)
  }
}
