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
extension EventTelemetry: RPCService {}

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
  func event(collection: EventCollection? = nil,
             payload: [String: Any]? = nil,
             context: EventContext? = nil) throws {
    // merge/resolve event context
    var merged: AnalyticsContext
    if let c = context {
      var exported = c.export()
      let globalContext = settings.export()
      let serialized = try globalContext.serializedData()
      try exported.merge(serializedData: serialized)
      merged = exported
    } else {
      merged = settings.export()
    }

    // override collection, if so directed
    if let localCollection = collection {
      merged.collection = localCollection.export()
    }
  }
}
