//
//  POSClient+VerifyTicketKey.swift
//  BloomboxPackageDescription
//
//  Created by Sam Gammon on 9/28/18.
//

import Foundation
import gRPC
import Schema


// Callback Types
public typealias POSVerifyTicketKeyCallback = (CallResult, POSOpenTicket.Response?) -> Void


/**
 * Interface for the service client ticket key verification method.
 */
public protocol IPOSVerifyTicketKey {
  // Authorize: User with Token (Sync)
  func verify(ticketKey key: PurchaseKey,
              forDevice device: PartnerDeviceKey,
              withOptions options: POSTicketVerifyOptions) throws -> POSOpenTicket.Response

  // Authorize: User with Token (Async)
  func verify(ticketKey key: PurchaseKey,
              forDevice device: PartnerDeviceKey,
              withOptions options: POSTicketVerifyOptions,
              _ callback: @escaping POSVerifyTicketKeyCallback) throws -> POSOpenTicketCall
}


/**
 * Options for ticket key verification calls.
 */
public struct POSTicketVerifyOptions {
  let fresh: Bool  /* Mark as true if we're checking a freshly-generated ID for uniqueness. */

  public static var defaults: POSTicketVerifyOptions {
    get {
      return POSTicketVerifyOptions(fresh: true)
    }
  }
}


// MARK: - Method: Authorize User -
extension PointOfSaleClient: IPOSVerifyTicketKey {
  // MARK: Internals

  private func verifyTicketKey(_ request: POSOpenTicket.Request,
                               withAPIKey apiKey: APIKey) throws -> POSOpenTicket.Response {
    return try self.service(apiKey).ticketopen(request)
  }

  private func verifyTicketKey(_ request: POSOpenTicket.Request,
                               withAPIKey apiKey: APIKey,
                               _ callback: @escaping POSVerifyTicketKeyCallback) throws -> POSOpenTicketCall {
    return try self.service(apiKey).ticketopen(request) { (response, callResult) in
      // handle callback
      callback(callResult, response)
    }
  }

  // MARK: Public API
  /**
   * Verify a candidate string to be a ticket key, synchronously, with server-side systems.
   */
  public func verify(ticketKey key: PurchaseKey,
                     forDevice device: PartnerDeviceKey,
                     withOptions options: POSTicketVerifyOptions) throws -> POSOpenTicket.Response {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.verifyTicketKey(POSOpenTicket.Request.with { request in
      request.purchase = key
      request.register = deviceKey

      if options.fresh {
        request.fresh = true
      }
    }, withAPIKey: apiKey)
  }

  /**
   * Verify a candidate string to be a ticket key, asynchronously, with server-side systems.
   */
  public func verify(ticketKey key: PurchaseKey,
                     forDevice device: PartnerDeviceKey,
                     withOptions options: POSTicketVerifyOptions,
                     _ callback: @escaping POSVerifyTicketKeyCallback) throws -> POSOpenTicketCall {
    let (deviceKey, apiKey) = try resolveContext(device, nil)

    return try self.verifyTicketKey(POSOpenTicket.Request.with { request in
      request.purchase = key
      request.register = deviceKey

      if options.fresh {
        request.fresh = true
      }
    }, withAPIKey: apiKey, callback)
  }
}
