//
//  Services.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


/// Collects individual service classes, providing iterative access to them, and supporting basic flow for preparing
/// them for fulfillment of RPCs.
public final class Services: ClientLogic {
  // MARK: - Internals

  /// Client-level settings.
  public let settings: Bloombox.Settings

  /// Low-level RPC dispatch logic.
  fileprivate let rpc: RPCLogic

  /// Main initializer, used by the library.
  ///
  internal init(settings: Bloombox.Settings) {
    self.settings = settings
    self.rpc = RPCLogic(settings: self.settings)

    self.auth = AuthClient(settings: settings)
    self.devices = DevicesClient(settings: settings)
    self.shop = ShopClient(settings: settings)
    self.telemetry = TelemetryClient(settings: settings)
    self.menu = MenuClient(settings: settings)
    self.pos = PointOfSaleClient(settings: settings)
    self.platform = PlatformClient(settings: settings)
  }

  /// Holds a reference to each supported remote service.
  fileprivate var all: [RemoteService] {
    return [
      auth,
      shop,
      telemetry,
      menu,
      pos,
      devices,
      platform
    ]
  }

  /// Prep function for remote services. Dispatched early in the client initialization flow, so corresponding methods
  /// may be called on each service to prepare it for use.
  internal func prepare() {
    rpc.prepare()
    for service in all {
      service.prepare()
    }
  }

  // MARK: - Services

  /// Auth services. Authenticates user credentials, authorizes permissions, conducts consent operations, and provides
  /// write/read access to user profiles.
  public let auth: AuthClient

  /// Shop service. Provides information about a dispensary, and the ability to verify/enroll members. Also provides
  /// order submission and status methods.
  public let shop: ShopClient

  /// Telemetry service. Provides the ability to submit event analytics data as it happens, and have it attributed and
  /// placed in the larger flow.
  public let telemetry: TelemetryClient

  /// Menu service. Provides the ability to download menu data, update product inventory or content, and filter and sort
  /// items.
  public let menu: MenuClient

  /// Point-of-Sale service. Provides supporting logic for physical, in-person purchases at brick and mortar retailer
  /// locations.
  public let pos: PointOfSaleClient

  /// Devices service. Provides methods that deal with partner co-located, or 2nd party, hardware devices, including
  /// pings, activations, and so on.
  public let devices: DevicesClient

  /// Platform service. Provides methods that resolve basic info, map info to other info, and so on. Healthchecks and
  /// cloud platform pings happen here, too.
  public let platform: PlatformClient
}
