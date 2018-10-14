//
//  POSClient+VerifyTicketKey.swift
//  BloomboxPackageDescription
//
//  Created by Sam Gammon on 9/28/18.
//

import Foundation
import SwiftGRPC
import Schema


// Callback Types

/// Callback type definition for a ticket key verification operation, where a potential purchase ticket key is validated
/// for global uniqueness. The callback accepts two parameters and no return value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `POSOpenTicket.Response?`: If the call succeeded, a POS open-ticket response will be provided.
public typealias POSVerifyTicketKeyCallback = (CallResult, POSOpenTicket.Response?) -> Void


// MARK: - Method: Authorize User -

extension PointOfSaleClient {
  // MARK: Internals

  private func verifyTicketKey(_ request: POSOpenTicket.Request,
                               withAPIKey apiKey: APIKey) throws -> POSOpenTicket.Response {
    return try self.service(apiKey).ticketOpen(request)
  }

  private func verifyTicketKey(_ request: POSOpenTicket.Request,
                               withAPIKey apiKey: APIKey,
                               _ callback: @escaping POSVerifyTicketKeyCallback) throws -> POSOpenTicketCall {
    return try self.service(apiKey).ticketOpen(request) { (response, callResult) in
      // handle callback
      callback(callResult, response)
    }
  }

  // MARK: Public API

  /// Verify a candidate string to be a ticket key, synchronously, with server-side systems. Since ticket key UUIDs are
  /// generate client-side, they must be validated with the server when possible for uniqueness.
  ///
  /// - SeeAlso: Asynchronous version: `verify(ticketKey:forDevice:withOptions:_ callback)`.
  ///
  /// - Parameter key: Ticket key to validate with the server. It should not yet exist.
  /// - Parameter device: Device key referencing the POS device from which we are validating this key.
  /// - Returns: Ticket verificaton response.
  /// - Throws: Client-side errors and server-side errors are both thrown.
  public func verify(ticketKey key: PurchaseKey,
                     forDevice device: PartnerDeviceKey) throws -> POSOpenTicket.Response {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.verifyTicketKey(POSOpenTicket.Request.with { request in
      request.purchase = key
      request.register = deviceKey
    }, withAPIKey: apiKey)
  }

  /// Verify a candidate string to be a ticket key, asynchronously, with server-side systems. Since ticket key UUIDs are
  /// generate client-side, they must be validated with the server when possible for uniqueness.
  ///
  /// - SeeAlso: Synchronous version: `verify(ticketKey:forDevice:withOptions)`.
  ///
  /// - Parameter key: Ticket key to validate with the server. It should not yet exist.
  /// - Parameter device: Device key referencing the POS device from which we are validating this key.
  /// - Parameter callback: Callable to dispatch once either a terminal error or response are available.
  /// - Returns: RPC call object, that can be used to observe status or cancel the call.
  /// - Throws: Client-side errors only. This method is asynchronous.
  public func verify(ticketKey key: PurchaseKey,
                     forDevice device: PartnerDeviceKey,
                     _ callback: @escaping POSVerifyTicketKeyCallback) throws -> POSOpenTicketCall {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.verifyTicketKey(POSOpenTicket.Request.with { request in
      request.purchase = key
      request.register = deviceKey
      request.fresh = true
    }, withAPIKey: apiKey, callback)
  }

}
