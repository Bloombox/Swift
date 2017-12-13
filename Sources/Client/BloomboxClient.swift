//
//  BloomboxClient.swift
//  BloomboxClient
//
//  Created by James Clark on 12/13/17.
//

import Schema


/**
 * Main client class. Provides access to service-specific clients, and initializes basic settings
 * or context required for communication with servers.
 */
public final class BloomboxClient {
  /**
   * Specifies settings for an instance of BloomboxClient.
   */
  public struct Settings {
    let partner: String?
    let location: String?

    /**
     * Produce a default set of settings.
     */
    static func defaultSettings() -> Settings {
      return Settings(partner: nil, location: nil)
    }
  }

  // -- Internals -- //
  private let _settings: Settings

  /**
   * Main initializer. Defaults settings to sensible values, if none are provided.
   */
  public init(settings: Settings? = nil) {
    if let s = settings {
      self._settings = s
    } else {
      self._settings = Settings.defaultSettings()
    }
  }

  // -- Public Interface -- //
  public var settings: Settings {
    return _settings
  }
}
