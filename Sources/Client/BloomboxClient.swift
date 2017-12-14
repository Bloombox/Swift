//
//  BloomboxClient.swift
//  BloomboxClient
//
//  Created by James Clark on 12/13/17.
//

import Schema


/**
 * Variant, or build permutation, of this library.
 */
public let __BLOOMBOX_VARIANT__ = "full"

/**
 * Version of this library.
 */
public let __BLOOMBOX_VERSION__ = "0.0.1"


/**
 * Main client class. Provides access to service-specific clients, and initializes basic settings
 * or context required for communication with servers.
 */
public final class BloomboxClient {
  /**
   * Specifies settings for an instance of BloomboxClient.
   */
  public struct Settings: EventContextData {
    /**
     * Default partner code to use.
     */
    public let partner: PartnerCode? = nil

    /**
     * Default partner location code to use.
     */
    public let location: LocationCode? = nil

    /**
     * Default device UUID to use, if known.
     */
    public let deviceUUID: DeviceUUID? = nil

    /**
     * Default collection to send events to.
     */
    public let collection: EventCollection? = nil

    /**
     * Active order ID, if any.
     */
    public let order: OrderID? = nil

    /**
     * Active user ID, if any.
     */
    public let user: UserID? = nil

    /**
     * Menu section to specify, if any.
     */
    public let section: MenuSection? = nil

    /**
     * Commercial item related to this event, if any.
     */
    public let item: ItemID? = nil

    /**
     * Session or group ID, if applicable, and set.
     */
    public let group: GroupID? = nil

    /**
     * Specifies the iOS application sending events.
     */
    public let bundleId: String? = nil

    /**
     * Produce a default set of settings.
     */
    static func defaultSettings() -> Settings {
      return Settings()
    }
  }

  // -- Internals -- //
  private let _settings: Settings
  private let _services: Services

  /**
   * Main initializer. Defaults settings to sensible values, if none are provided.
   */
  public init(settings: Settings? = nil) {
    if let s = settings {
      self._settings = s
    } else {
      self._settings = Settings.defaultSettings()
    }
    self._services = Services(settings: self._settings)
  }

  // -- Public Interface -- //

  /**
   * Fetch active settings for this client.
   */
  public var settings: Settings {
    return _settings
  }

  /**
   * Public access to the mounted services.
   */
  public var services: Services {
    return _services
  }

  /**
   * Public access to the Shop service client.
   */
  public var shop: ShopClient {
    return _services.shop
  }

  /**
   * Public access to the Telemetry service client.
   */
  public var telemetry: TelemetryClient {
    return _services.telemetry
  }
}
