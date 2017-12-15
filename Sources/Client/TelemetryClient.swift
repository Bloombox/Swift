//
//  TelemetryService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import gRPC


// Callback Types
/**
 * Specifies a callback for a `ping` operation. It is passed one parameter, which is the observed
 * latency of PING to PONG.
 */
public typealias PingCallback = (Double) -> ()

/**
 * Specifies a callback for an `event` submission operation. It is passed two parameters - the
 * call result object, and the telemetry response.
 */
public typealias GenericEventCallback = (CallResult) -> ()


// MARK: Telemetry Service

/**
 * Provides functionality for the Telemetry API, which supports sending event analytics data as it
 * happens, to be recorded and stored, and later analyzed.
 */
public class TelemetryClient: RemoteService {
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
   * Generic event telemetry service.
   */
  internal let events: EventTelemetry

  /**
   * Client-wide settings.
   */
  internal let settings: BloomboxClient.Settings

  /**
   * Library-internal initializer.
   */
  internal init(settings: BloomboxClient.Settings) {
    self.settings = settings

    // initialize events service
    events = RPCServiceFactory<EventTelemetry>.factory(forService: Transport.config.services.telemetry)
  }

  /**
   * Prepare the telemetry service for use.
   */
  func prepare() { /* default: no-op */ }
}
