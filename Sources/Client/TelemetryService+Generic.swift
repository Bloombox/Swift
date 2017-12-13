//
//  TelemetryService+Generic.swift
//  Client
//
//  Created by James Clark on 12/13/17.
//

import Foundation


/**
 * Implementation of the Event Telemetry service client. Supports standard endpoints for secure
 * and plaintext access.
 */
internal final class EventTelemetryImpl: EventTelemetry, RPCService {
  /**
   * Client-wide settings.
   */
  internal let settings: BloomboxClient.Settings

  /**
   * Initialize the Event Telemetry service with a plaintext endpoint.
   */
  required init(endpoint: RPCEndpoint, settings: BloomboxClient.Settings) {
    self.settings = settings
    super.init(
      address: "\(endpoint.host):\(endpoint.port)")
  }

  /**
   * Initialize the Event Telemetry service with a secure endpoint.
   */
  required init(endpoint: SecureRPCEndpoint, settings: BloomboxClient.Settings) {
    self.settings = settings
    super.init(
      address: "\(endpoint.host):\(endpoint.port)",
      certificates: endpoint.chain,
      host: endpoint.hostname ?? endpoint.host)
  }
}


extension TelemetryClient {
  // MARK: Event Telemetry

  /**
   * Method `ping`. Send a message to the Telemetry service, and receive a message back. This
   * function is intended to warm the connection and measure latency.
   */
  func ping(callback: PingCallback? = nil) throws {
    let request = TelemetryPing.Request()
    let ts = (Date().timeIntervalSinceReferenceDate * 1000)
    let _ = try events.ping(request)
    let tsEnd = (Date().timeIntervalSinceReferenceDate * 1000)
    let diff = Double(round((tsEnd - ts)*1000)/1000)
    callback?(diff)
  }

  /**
   * Method `event`. Submit a generic event to the Telemetry service. Can be used for any
   * visibility instrumentation desired and supports arbitrary JSON payloads.
   */
  func event(collection: String,
             payload: [String: Any],
             context: EventContext? = nil) throws {
//    let resolved = context ??
  }
}
