/**
* Copyright 2019, Momentum Ideas, Co. All rights reserved.
* Source and object computer code contained herein is the private intellectual
* property of Momentum Ideas Co., a Delaware Corporation. Use of this
* code in source form requires permission in writing before use or the
* assembly, distribution, or publishing of derivative works, for commercial
* purposes or any other purpose, from a duly authorized officer of Momentum
* Ideas Co.
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

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
      checkin: ProductionCheckin(),
      identity: ProductionIdentity())
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
      checkin: ProductionCheckin(),
      identity: ProductionIdentity())
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
      checkin: ProductionCheckin(),
      identity: ProductionIdentity())
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

/// Production identity service settings.
internal struct ProductionIdentity: RPCServiceSettings {
    let secure = true
    let host = "rpc.bloombox.cloud"
    let port = 443
    let hostname: String? = "rpc.bloombox.cloud"
    let chain: String? = authorityChain
    let cert: String? = nil
    let key: String? = nil
}

/// Production devices service settings.
internal struct ProductionDevices: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production shop settings.
internal struct ProductionShop: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production telemetry settings.
internal struct ProductionTelemetry: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production media settings.
internal struct ProductionMedia: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production menu settings.
internal struct ProductionMenu: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production POS settings.
internal struct ProductionPOS: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production auth settings.
internal struct ProductionAuth: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production checkin settings.
internal struct ProductionCheckin: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
  let chain: String? = authorityChain
  let cert: String? = nil
  let key: String? = nil
}

/// Production platform API settings.
internal struct ProductionPlatform: RPCServiceSettings {
  let secure = true
  let host = "rpc.bloombox.cloud"
  let port = 443
  let hostname: String? = "rpc.bloombox.cloud"
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
  let auth: RPCServiceSettings
  let devices: RPCServiceSettings
  let shop: RPCServiceSettings
  let telemetry: RPCServiceSettings
  let menu: RPCServiceSettings
  let media: RPCServiceSettings
  let pos: RPCServiceSettings
  let platform: RPCServiceSettings
  let checkin: RPCServiceSettings
  let identity: RPCServiceSettings
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
  var identity: RPCServiceSettings { get }
}

// MARK: Data Services

/// Specifies known data environments.
internal enum DataEnvironment: String {
  case sandbox = "sandbox"
  case v1 = "v1"
  case v2 = "v2"
}
