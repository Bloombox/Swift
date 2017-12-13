//
//  RPCLogic.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import gRPC


// MARK: Settings
internal protocol RPCServiceSettings {
  var secure: Bool { get }
  var host: String { get }
  var port: Int { get }
  var cert: String? { get }
  var key: String? { get }
  var hostname: String? { get }
  var chain: String? { get }
}


// MARK: - RPC Endpoints
internal protocol RPCEndpoint {
  var host: String { get }
  var port: Int { get }
}

internal protocol SecureRPCEndpoint: RPCEndpoint {
  var cert: String { get }
  var key: String { get }
  var chain: String { get }
  var hostname: String? { get }
}

internal struct PlaintextEndpoint: RPCEndpoint {
  let host: String
  let port: Int
}

internal struct TLSEndpoint: SecureRPCEndpoint {
  let host: String
  let port: Int
  let cert: String
  let key: String
  let chain: String
  let hostname: String?
}


// MARK: - RPC Services
internal protocol RPCService {
  init(endpoint: RPCEndpoint)
  init(endpoint: SecureRPCEndpoint)

  var metadata : Metadata { get }
  var host: String { get set }
}

extension RPCService {
  func prepare() {}
}

internal struct RPCServiceFactory<Service: RPCService> {
  static func endpoint(settings: RPCServiceSettings) -> RPCEndpoint {
    if settings.secure {
      guard let cert = settings.cert, let key = settings.key, let chain = settings.chain else {
        fatalError("missing SSL settings for service")
      }

      return TLSEndpoint(
        host: settings.host,
        port: settings.port,
        cert: cert,
        key: key,
        chain: chain,
        hostname: settings.hostname ?? settings.host)
    } else {
      return PlaintextEndpoint(
        host: settings.host,
        port: settings.port)
    }
  }

  static func factory(endpoint: RPCEndpoint) -> Service {
    if let secure = endpoint as? SecureRPCEndpoint {
      // connect over plaintext
      return Service.init(endpoint: secure)
    } else {
      // connect over TLS
      return Service.init(endpoint: endpoint)
    }
  }

  static func factory(settings: RPCServiceSettings) -> Service {
    return factory(endpoint: endpoint(settings: settings))
  }
}


// MARK: - RPC Logic
internal final class RPCLogic: ClientLogic {
  func prepare() {
  }
}

