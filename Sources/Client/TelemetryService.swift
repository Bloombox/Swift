//
//  TelemetryService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


typealias PingCallback = (Double) -> ()


fileprivate final class EventTelemetryServiceImpl: EventTelemetryService, RPCService {
  required init(endpoint: RPCEndpoint) {
    super.init(
      address: "\(endpoint.host):\(endpoint.port)")
  }

  required init(endpoint: SecureRPCEndpoint) {
    super.init(
      address: "\(endpoint.host):\(endpoint.port)",
      certificates: endpoint.chain,
      host: endpoint.hostname ?? endpoint.host)
  }
}


// MARK: - Telemetry Service
internal final class TelemetryService: RemoteService {
  let name = "telemetry"

  // MARK: Internals
  fileprivate final class TelemetryClient {
    fileprivate let events: EventTelemetryService

    init() {
      // initialize events service
      events = RPCServiceFactory<EventTelemetryServiceImpl>.factory(settings: Transport.config.services.telemetry)
    }
  }

  fileprivate let client = TelemetryClient()

  func prepare() {
    Dispatch.background {
      self.ping()
    }
  }

  // MARK: Event Telemetry
  func ping(callback: PingCallback? = nil) {
    do {
      let request = TelemetryPing.Request()
      let ts = (Date().timeIntervalSinceReferenceDate * 1000)
      let _ = try client.events.ping(request)

      let tsEnd = (Date().timeIntervalSinceReferenceDate * 1000)
      let diff = Double(round((tsEnd - ts)*1000)/1000)

      Logging.say("PING <-> PONG - \(diff)ms")
      callback?(diff)

    } catch EventTelemetryClientError.endOfStream {
      Logging.error("Stream was closed.")
    } catch EventTelemetryClientError.invalidMessageReceived {
      Logging.error("Invalid message received and dropped.")
    } catch EventTelemetryClientError.error(let result) {
      Logging.error("PING call resulted in an error: \(result.statusCode) (\(result.description)")
    } catch {
      Logging.error("An unrecognized error occurred during PING.")
    }
  }
}
