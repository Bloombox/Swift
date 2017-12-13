//
//  RPCLogic.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import gRPC


// MARK: - RPC Endpoints

/**
 * Specifies a structure that provides information required to connect to a remote RPC endpoint
 * exposed for access over the public internet.
 */
internal protocol RPCEndpoint {
  var host: String { get }
  var port: Int { get }
}

/**
 * Specifies a structure that provides a secure RPC endpoint, wrapped with Transport Layer
 * Security (i.e. TLS/HTTPS).
 */
internal protocol SecureRPCEndpoint: RPCEndpoint {
  var cert: String { get }
  var key: String { get }
  var chain: String { get }
  var hostname: String? { get }
}

/**
 * Specifies a plaintext, unsecured endpoint.
 */
internal struct PlaintextEndpoint: RPCEndpoint {
  let host: String
  let port: Int
}

/**
 * Specifies an RPC endpoint protected by TLS.
 */
internal struct TLSEndpoint: SecureRPCEndpoint {
  let host: String
  let port: Int
  let cert: String
  let key: String
  let chain: String
  let hostname: String?
}


// MARK: - RPC Services

/**
 * Main protocol for a remotely-supported RPC service.
 */
internal protocol RPCService {
  init(endpoint: RPCEndpoint)
  init(endpoint: SecureRPCEndpoint)

  var metadata : Metadata { get }
  var host: String { get set }
}


/**
 * Interface compliance defaults for RPCService.
 */
extension RPCService {
  func prepare() {}
}

/**
 * Generic factory that is capable of creating new instances of RPC service logic classes. Given
 * settings, this class initializes and prepares an individual RPC service for use.
 */
internal struct RPCServiceFactory<Service: RPCService> {
  /**
   * Produce an RPC endpoint spec from a set of RPC service settings.
   */
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

  /**
   * Factory a new instance of the service this factory is specialized to. Given an endpoint
   * spec, initialize the new service and prepare it for use.
   */
  static func factory(endpoint: RPCEndpoint) -> Service {
    if let secure = endpoint as? SecureRPCEndpoint {
      // connect over plaintext
      return Service.init(endpoint: secure)
    } else {
      // connect over TLS
      return Service.init(endpoint: endpoint)
    }
  }

  /**
   * Factory a new instance of the service this factory is specialized to. Given a set of RPC
   * service settings, build an endpoint spec, and then initialize the new service and prepare
   * it for use.
   */
  static func factory(settings: RPCServiceSettings) -> Service {
    return factory(endpoint: endpoint(settings: settings))
  }
}


// MARK: - RPC Logic

/**
 * Low-level RPC logic class. Provides routines and methods for preparing, dispatching, and
 * fulfilling callbacks for RPCs of any type. Driven by the higher-order specialized service
 * classes to apply stronger typing.
 */
internal final class RPCLogic: ClientLogic {
  /**
   * Prepare low-level RPC logic for use.
   */
  func prepare() { /* default: no-op */ }
}
