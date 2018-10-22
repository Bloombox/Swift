//
//  Transport.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


private let authorityChain = """
-----BEGIN CERTIFICATE-----
MIIDrzCCApegAwIBAgIQCDvgVpBCRrGhdWrJWZHHSjANBgkqhkiG9w0BAQUFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD
QTAeFw0wNjExMTAwMDAwMDBaFw0zMTExMTAwMDAwMDBaMGExCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
b20xIDAeBgNVBAMTF0RpZ2lDZXJ0IEdsb2JhbCBSb290IENBMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4jvhEXLeqKTTo1eqUKKPC3eQyaKl7hLOllsB
CSDMAZOnTjC3U/dDxGkAV53ijSLdhwZAAIEJzs4bg7/fzTtxRuLWZscFs3YnFo97
nh6Vfe63SKMI2tavegw5BmV/Sl0fvBf4q77uKNd0f3p4mVmFaG5cIzJLv07A6Fpt
43C/dxC//AH2hdmoRBBYMql1GNXRor5H4idq9Joz+EkIYIvUX7Q6hL+hqkpMfT7P
T19sdl6gSzeRntwi5m3OFBqOasv+zbMUZBfHWymeMr/y7vrTC0LUq7dBMtoM1O/4
gdW7jVg/tRvoSSiicNoxBN33shbyTApOB6jtSj1etX+jkMOvJwIDAQABo2MwYTAO
BgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUA95QNVbR
TLtm8KPiGxvDl7I90VUwHwYDVR0jBBgwFoAUA95QNVbRTLtm8KPiGxvDl7I90VUw
DQYJKoZIhvcNAQEFBQADggEBAMucN6pIExIK+t1EnE9SsPTfrgT1eXkIoyQY/Esr
hMAtudXH/vTBH1jLuG2cenTnmCmrEbXjcKChzUyImZOMkXDiqw8cvpOp/2PV5Adg
06O/nVsJ8dWO41P0jmP6P6fbtGbfYmbW0W5BjfIttep3Sp+dWOIrWcBAI+0tKIJF
PnlUkiaY4IBIqDfv8NZ5YBberOgOzW6sRBc4L0na4UU+Krk2U886UAb3LujEV0ls
YSEY1QSteDwsOoBrp+uvFRTp2InBuThs4pFsiv9kuXclVzDAGySj4dzp30d8tbQk
CAUw7C29C79Fv1C5qfPrmAESrciIxpg0X40KPMbp1ZWVbd4=
-----END CERTIFICATE-----
"""


// MARK: - Configuration

/// Main library transport settings.
internal struct Transport {
  /// Selected environment to use.
  static let environment: TransportEnvironment = .production

  /// Configuration resolved from the above transport environment.
  static let config: TransportSettings = Transport.environment.config

  // MARK: Configuration Profiles
  #if DEBUG_BBX_CLIENT
  /// Sandbox transport profile.
  internal struct Sandbox: TransportSettings {
    let data: DataEnvironment = .sandbox
    let services: ServiceSettings = RPCServicesConfig(
      auth: ProductionAuth(),
      devices: ProductionDevices(),
      shop: ProductionShop(),
      telemetry: ProductionTelemetry(),
      menu: ProductionMenu(),
      media: ProductionMedia(),
      pos: ProductionPOS(),
      platform: ProductionPlatform(),
      checkin: ProductionCheckin())
  }

  /// Staging transport profile.
  internal struct Staging: TransportSettings {
    let data: DataEnvironment = .v1
    let services: ServiceSettings = RPCServicesConfig(
      auth: ProductionAuth(),
      devices: ProductionDevices(),
      shop: ProductionShop(),
      telemetry: ProductionTelemetry(),
      menu: ProductionMenu(),
      media: ProductionMedia(),
      pos: ProductionPOS(),
      platform: ProductionPlatform(),
      checkin: ProductionCheckin())
  }
  #endif

  /// Production transport profile.
  internal struct Production: TransportSettings {
    let data: DataEnvironment = .v1
    let services: ServiceSettings = RPCServicesConfig(
      auth: ProductionAuth(),
      devices: ProductionDevices(),
      shop: ProductionShop(),
      telemetry: ProductionTelemetry(),
      menu: ProductionMenu(),
      media: ProductionMedia(),
      pos: ProductionPOS(),
      platform: ProductionPlatform(),
      checkin: ProductionCheckin())
  }
}


// MARK: - Singletons
#if DEBUG_BBX_CLIENT
fileprivate let __sandbox = Transport.Sandbox()
fileprivate let __staging = Transport.Staging()
#endif
fileprivate let __production = Transport.Production()


/// Specifies known transport environments to which RPC service settings may be bound/associated.
internal enum TransportEnvironment {
  /// Sandbox: Environment for testing and development.
  case sandbox

  /// Staging: Production release testing.
  case staging

  /// Production: Live services.
  case production

  /// Retrieve the configuration singleton for a particular transport environment.
  var config: TransportSettings {
    #if DEBUG_BBX_CLIENT
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

/// Production devices service settings.
internal struct ProductionDevices: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production shop settings.
internal struct ProductionShop: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production telemetry settings.
internal struct ProductionTelemetry: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production media settings.
internal struct ProductionMedia: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production menu settings.
internal struct ProductionMenu: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production POS settings.
internal struct ProductionPOS: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production auth settings.
internal struct ProductionAuth: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production checkin settings.
internal struct ProductionCheckin: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production platform API settings.
internal struct ProductionPlatform: RPCServiceSettings {
  let secure = true
  let host = "api.bloombox.cloud"
  let port = 443
  let hostname: String? = "api.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

#if DEBUG_BBX_CLIENT
  /// Local shop settings.
  internal struct LocalShop: RPCServiceSettings {
    let secure = false
    let host = "127.0.0.1"
    let port = 1091
  }

  /// Local telemetry settings.
  internal struct LocalTelemetry: RPCServiceSettings {
    let secure = false
    let host = "127.0.0.1"
    let port = 1090
  }

  /// Local menu settings.
  internal struct LocalMenu: RPCServiceSettings {
    let secure = false
    let host = "127.0.0.1"
    let port = 1094
  }

  /// Local POS settings.
  internal struct LocalPOS: RPCServiceSettings {
    let secure = false
    let host = "127.0.0.1"
    let port = 1105
  }
#endif


// MARK: - Structural Specification

/// Specifies gathered transport-layer settings.
internal protocol TransportSettings {
  var data: DataEnvironment { get }
  var services: ServiceSettings { get }
}

// MARK: RPC Services

/// Specifies a configuration set for supported RPC services.
internal struct RPCServicesConfig: ServiceSettings {

  /// Auth service. Provides methods that resolve authorizing a member of a dispensary.
  let auth: RPCServiceSettings

  /// Devices service. Provides methods that deal with partner co-located, or 2nd party, hardware devices, including
  /// pings, activations, and so on.
  let devices: RPCServiceSettings

  /// Shop service. Provides information about a dispensary, and the ability to verify/enroll members. Also provides
  /// order submission and status methods.
  let shop: RPCServiceSettings

  /// Telemetry service. Provides the ability to submit event analytics data as it happens, and have it attributed and
  /// placed in the larger flow.
  let telemetry: RPCServiceSettings

  /// Menu service. Provides the ability to download menu data, update product inventory or content, and filter and sort
  /// items.
  let menu: RPCServiceSettings

  /// Media service. Provides the ability to submit media.
  let media: RPCServiceSettings

  /// Point-of-Sale service. Provides supporting logic for physical, in-person purchases at brick and mortar retailer
  /// locations.
  let pos: RPCServiceSettings

  /// Platform service. Provides methods that resolve basic info, map info to other info, and so on. Healthchecks and
  /// cloud platform pings happen here, too.
  let platform: RPCServiceSettings

  /// Check-in service. Provides methods to verify members and queue or track their visit inside a dispensary.
  let checkin: RPCServiceSettings
}

/// Specifies a structure for a block of settings for an individual RPC service.
internal protocol RPCServiceSettings {
  var secure: Bool { get }
  var host: String { get }
  var port: Int { get }
  var cert: String? { get }
  var key: String? { get }
  var hostname: String? { get }
  var chain: String? { get }
}

/// Specifies a full set of service settings.
internal protocol ServiceSettings {
  var devices: RPCServiceSettings { get }
  var shop: RPCServiceSettings { get }
  var telemetry: RPCServiceSettings { get }
  var menu: RPCServiceSettings { get }
  var pos: RPCServiceSettings { get }
  var auth: RPCServiceSettings { get }
  var platform: RPCServiceSettings { get }
  var checkin: RPCServiceSettings { get }
}

// MARK: Data Services

/// Specifies known data environments.
internal enum DataEnvironment: String {
  case sandbox = "sandbox"
  case v1 = "v1"
  case v2 = "v2"
}
