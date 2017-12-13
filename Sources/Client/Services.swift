//
//  Services.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


/**
 * Collects individual service classes, providing iterative access to them, and supporting basic
 * flow for preparing them for fulfillment of RPCs.
 */
public final class Services: ClientLogic {
  // MARK: - Internals
  /**
   * Client-level settings.
   */
  public let settings: BloomboxClient.Settings

  /**
   * Low-level RPC dispatch logic.
   */
  fileprivate let rpc: RPCLogic

  /**
   * Main initializer, used by the library.
   */
  internal init(settings: BloomboxClient.Settings) {
    self.settings = settings
    self.rpc = RPCLogic(settings: self.settings)
    self.shop = ShopClient(settings: settings)
    self.telemetry = TelemetryClient(settings: settings)
  }

  /**
   * Holds a reference to each supported remote service.
   */
  fileprivate var all: [RemoteService] {
    return [
      shop,
      telemetry
    ]
  }

  /**
   * Prep function for remote services. Dispatched early in the client initialization flow, so
   * corresponding methods may be called on each service to prepare it for use.
   */
  internal func prepare() {
    rpc.prepare()
    for service in all {
      service.prepare()
    }
  }

  // MARK: - Services
  /**
   * Shop service. Provides information about a dispensary, and the ability to verify/enroll
   * members. Also provides order submission and status methods.
   */
  public let shop: ShopClient

  /**
   * Telemetry service. Provides the ability to submit event analytics data as it happens, and
   * have it attributed and placed in the larger flow.
   */
  public let telemetry: TelemetryClient
}
