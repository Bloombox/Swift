//
//  Services.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


internal final class Services: ClientLogic {
  var all: [RemoteService] {
    return [
    ]
  }

  // Low-level RPC Logic
  fileprivate let rpc = RPCLogic()

  // Services
  public let shop = ShopService()
  public let telemetry = TelemetryService()

  func prepare() {
    rpc.prepare()
    for service in all {
      service.prepare()
    }
  }
}
