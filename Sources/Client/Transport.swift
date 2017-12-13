//
//  Transport.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


// MARK: - Configuration

/**
 * Main library transport settings.
 */
internal struct Transport {
  /**
   * Selected environment to use.
   */
  static let environment: TransportEnvironment = .sandbox

  /**
   * Configuration resolved from the above transport environment.
   */
  static let config: TransportSettings = Transport.environment.config

  // MARK: Configuration Profiles
  #if DEBUG
  /**
   * Sandbox transport profile.
   */
  internal struct Sandbox: TransportSettings {
    let data: DataEnvironment = .sandbox
    let services: ServiceSettings = RPCServicesConfig(
      shop: ProductionShop(),
      telemetry: ProductionTelemetry())
  }

  /**
   * Staging transport profile.
   */
  internal struct Staging: TransportSettings {
    let data: DataEnvironment = .v1
    let services: ServiceSettings = RPCServicesConfig(
      shop: ProductionShop(),
      telemetry: ProductionTelemetry())
  }
  #endif

  /**
   * Production transport profile.
   */
  internal struct Production: TransportSettings {
    let data: DataEnvironment = .v1
    let services: ServiceSettings = RPCServicesConfig(
      shop: ProductionShop(),
      telemetry: ProductionTelemetry())
  }
}


// MARK: - Singletons
#if DEBUG
fileprivate let __sandbox = Transport.Sandbox()
fileprivate let __staging = Transport.Staging()
#endif
fileprivate let __production = Transport.Production()


/**
 * Specifies known transport environments to which RPC service settings may be
 * bound/associated.
 */
internal enum TransportEnvironment {
  /**
   * Sandbox: Environment for testing and development.
   */
  case sandbox

  /**
   * Staging: Production release testing.
   */
  case staging

  /**
   * Production: Live services.
   */
  case production

  /**
   * Retrieve the configuration singleton for a particular transport environment.
   */
  var config: TransportSettings {
    #if DEBUG
      switch self {
      case .sandbox: return __sandbox
      case .staging: return __staging
      case .production: return __production
      }
    #else
      return __production
    #endif
  }
}

/**
 * Production shop settings.
 */
internal struct ProductionShop: RPCServiceSettings {
  let secure = false
  let host = "shop.api.bloombox.cloud"
  let port = 443
}

/**
 * Production telemetry settings.
 */
internal struct ProductionTelemetry: RPCServiceSettings {
  let secure = false
  let host = "telemetry.api.bloombox.cloud"
  let port = 443
}

#if DEBUG
  /**
   * Local shop settings.
   */
  internal struct LocalShop: RPCServiceSettings {
    let secure = false
    let host = "127.0.0.1"
    let port = 1091
  }

  /**
   * Local telemetry settings.
   */
  internal struct LocalTelemetry: RPCServiceSettings {
    let secure = false
    let host = "127.0.0.1"
    let port = 1090
  }
#endif


// MARK: - Structural Specification

/**
 * Specifies gathered transport-layer settings.
 */
internal protocol TransportSettings {
  var data: DataEnvironment { get }
  var services: ServiceSettings { get }
}

// MARK: RPC Services

/**
 * Specifies a configuration set for supported RPC services.
 */
internal struct RPCServicesConfig: ServiceSettings {
  let shop: RPCServiceSettings
  let telemetry: RPCServiceSettings
}

/**
 * Specifies a structure for a block of settings for an individual RPC
 * service.
 */
internal protocol RPCServiceSettings {
  var secure: Bool { get }
  var host: String { get }
  var port: Int { get }
  var cert: String? { get }
  var key: String? { get }
  var hostname: String? { get }
  var chain: String? { get }
}

/**
 * Extend standard RPC service settings with the ability to specify TLS
 * layer configuration.
 */
extension RPCServiceSettings {
  var cert: String? { return nil }
  var key: String? { return nil }
  var hostname: String? { return nil }
  var chain: String? { return nil }
}

/**
 * Specifies a full set of service settings.
 */
internal protocol ServiceSettings {
  var shop: RPCServiceSettings { get }
  var telemetry: RPCServiceSettings { get }
}

// MARK: Data Services

/**
 * Specifies known data environments.
 */
internal enum DataEnvironment: String {
  case sandbox = "sandbox"
  case v1 = "v1"
  case v2 = "v2"
}

