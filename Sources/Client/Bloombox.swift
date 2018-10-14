//
//  Bloombox.swift
//  Bloombox
//
//  Created by James Clark on 12/13/17.
//

import Schema


/// Client variant, or build permutation, of this library.
public let __BLOOMBOX_VARIANT__ = "full"

/// Version of this library.
public let __BLOOMBOX_VERSION__ = "0.0.7"


/// Main Bloombox API client class. Provides access to service-specific clients, and initializes basic settings or
/// context required for communication with servers.
public final class Bloombox {
  /// Specifies settings for an instance of Bloombox.
  public struct Settings: EventContextData {
    /// Default API key to use. Identifies the app or project invoking the API.
    public var apiKey: APIKey?

    /// Default partner code to use.
    public var partner: PartnerCode?

    /// Default partner location code to use.
    public var location: LocationCode?

    /// Default device UUID to use, if known.
    public var deviceUUID: DeviceUUID?

    /// Default collection to send events to.
    public var collection: EventCollection?

    /// Active order ID, if any.
    public var order: OrderID?

    /// Active user ID, if any.
    public var user: UserID?

    /// Menu section to specify, if any.
    public var section: MenuSection?

    /// Commercial item related to this event, if any.
    public var item: ItemID?

    /// Session or group ID, if applicable, and set.
    public var group: GroupID?

    /// Specifies the iOS application sending events.
    public var bundleId: String?

    /// Produce a default set of settings.
    public static func defaultSettings() -> Settings {
      return Settings()
    }

    /// Initialize a new settings object.
    ///
    public init(apiKey: APIKey? = nil,
                partner: PartnerCode? = nil,
                location: LocationCode? = nil,
                deviceUUID: DeviceUUID? = nil,
                collection: EventCollection? = nil,
                order: OrderID? = nil,
                user: UserID? = nil,
                section: MenuSection? = nil,
                item: ItemID? = nil,
                group: GroupID? = nil,
                bundleId: String? = nil) {
      self.apiKey = apiKey
      self.partner = partner
      self.location = location
      self.deviceUUID = deviceUUID
      self.collection = collection
      self.order = order
      self.user = user
      self.section = section
      self.item = item
      self.group = group
      self.bundleId = bundleId
    }
  }

  // -- Internals -- //
  private var _settings: Settings
  private var _services: Services

  /// Main initializer. Defaults settings to sensible values, if none are provided.
  public init(settings: Settings? = nil) {
    if let s = settings {
      self._settings = s
    } else {
      self._settings = Settings.defaultSettings()
    }
    self._services = Services(settings: self._settings)
  }

  // -- Public Interface -- //

  func updateSettings(_ settings: Settings) {
    self._settings = settings
    self._services = Services(settings: self._settings)
  }

  /// Fetch active settings for this client.
  public var settings: Settings {
    return _settings
  }

  /// Public access to the mounted services.
  public var services: Services {
    return _services
  }

  /// Public access to the Devices service client.
  public var devices: DevicesClient {
    return _services.devices
  }

  /// Public access to the Shop service client.
  public var shop: ShopClient {
    return _services.shop
  }

  /// Public access to the Menu service client.
  public var menu: MenuClient {
    return _services.menu
  }

  /// Public access to the Point-of-Sale service client.
  public var pos: PointOfSaleClient {
    return _services.pos
  }

  /// Public access to the Platform service client.
  public var platform: PlatformClient {
    return _services.platform
  }

  /// Public access to the Telemetry service client.
  public var telemetry: TelemetryClient {
    return _services.telemetry
  }

}
