//
//  Transport.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


// MARK: - Configuration
internal struct Transport {
  static let environment: TransportEnvironment = .sandbox
  static let config: TransportSettings = Transport.environment.config

  // MARK: Configuration Profiles
  #if DEBUG
  internal struct Sandbox: TransportSettings {
  let data: DataEnvironment = .sandbox
  let services: ServiceSettings = RPCServicesConfig(
  pos: LocalPOS(), telemetry: ProductionTelemetry())
  }

  internal struct Staging: TransportSettings {
  let data: DataEnvironment = .v1
  let services: ServiceSettings = RPCServicesConfig(
  pos: LocalPOS(), telemetry: ProductionTelemetry())
  }
  #endif

  internal struct Production: TransportSettings {
    let data: DataEnvironment = .v1
    let services: ServiceSettings = RPCServicesConfig(
      telemetry: ProductionTelemetry())
  }
}


// MARK: - Singletons
#if DEBUG
  fileprivate let __sandbox = Transport.Sandbox()
  fileprivate let __staging = Transport.Staging()
#endif
fileprivate let __production = Transport.Production()


internal enum TransportEnvironment {
  case sandbox
  case staging
  case production

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


internal struct ProductionTelemetry: RPCServiceSettings {
  let secure = false
  let host = "telemetry.api.bloombox.cloud"
  let port = 443
}

#if DEBUG
  internal struct LocalTelemetry: RPCServiceSettings {
    let secure = false
    let host = "127.0.0.1"
    let port = 1090
  }
#endif


// MARK: - Structural Specification

internal protocol TransportSettings {
  var data: DataEnvironment { get }
  var services: ServiceSettings { get }
}

// MARK: RPC Services
internal struct RPCServicesConfig: ServiceSettings {
  let telemetry: RPCServiceSettings
}

internal protocol RPCServiceSettings {
  var secure: Bool { get }
  var host: String { get }
  var port: Int { get }
  var cert: String? { get }
  var key: String? { get }
  var hostname: String? { get }
  var chain: String? { get }
}

extension RPCServiceSettings {
  var cert: String? { return nil }
  var key: String? { return nil }
  var hostname: String? { return nil }
  var chain: String? { return nil }
}

internal protocol ServiceSettings {
  var telemetry: RPCServiceSettings { get }
}

// MARK: Data Services
internal enum DataEnvironment: String {
  case sandbox = "sandbox"
  case v1 = "v1"
  case v2 = "v2"
}

