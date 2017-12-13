//
//  TelemetryService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


/**
 * Specifies a callback for `ping` operation. It is passed one parameter, which is the observed
 * latency of PING to PONG.
 */
typealias PingCallback = (Double) -> ()


/**
 * Implementation of the Event Telemetry service client. Supports standard endpoints for secure
 * and plaintext access.
 */
fileprivate final class EventTelemetryServiceImpl: EventTelemetryService, RPCService {
  /**
   * Initialize the Event Telemetry service with a plaintext endpoint.
   */
  required init(endpoint: RPCEndpoint) {
    super.init(
      address: "\(endpoint.host):\(endpoint.port)")
  }

  /**
   * Initialize the Event Telemetry service with a secure endpoint.
   */
  required init(endpoint: SecureRPCEndpoint) {
    super.init(
      address: "\(endpoint.host):\(endpoint.port)",
      certificates: endpoint.chain,
      host: endpoint.hostname ?? endpoint.host)
  }
}


// MARK: - Telemetry Service

/**
 * Provides functionality for the Telemetry API, which supports sending event analytics data as it
 * happens, to be recorded and stored, and later analyzed.
 */
public final class TelemetryService: RemoteService {
  /**
   * Name of the telemtry service, which is "telemetry."
   */
  let name = "telemetry"

  /**
   * Version of this service with which we intend to communicate.
   */
  let version = "v1beta3"

  // MARK: Internals

  /**
   * Main telemetry client object. Gathers service implementations of Event, Commercial, and
   * Identity Telemetry services.
   */
  fileprivate final class TelemetryClient {
    /**
     * Generic event telemetry service.
     */
    fileprivate let events: EventTelemetryService

    init() {
      // initialize events service
      events = RPCServiceFactory<EventTelemetryServiceImpl>.factory(
        settings: Transport.config.services.telemetry)
    }
  }

  /**
   * Underlying telemetry client.
   */
  fileprivate let client = TelemetryClient()

  /**
   * Prepare the telemetry service for use.
   */
  func prepare() {
  }

  // MARK: Event Telemetry

  /**
   * Method `ping`. Send a message to the Telemetry service, and receive a message back. This
   * function is intended to warm the connection and measure latency.
   */
  func ping(callback: PingCallback? = nil) throws {
    let request = TelemetryPing.Request()
    let ts = (Date().timeIntervalSinceReferenceDate * 1000)
    let _ = try client.events.ping(request)
    let tsEnd = (Date().timeIntervalSinceReferenceDate * 1000)
    let diff = Double(round((tsEnd - ts)*1000)/1000)
    callback?(diff)
  }
}
