//
//  POSClient+Session.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/14/18.
//

import Foundation
import SwiftGRPC


// Types & Enums

/// Callback type definition for a point-of-sale session-open operation, which creates and opens a fresh POS session for
/// a given authorized user. Two parameters are given and no return value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `OpenSession.Response?`: If the call succeeded, a POS session-open-response will be provided.
public typealias OpenSessionCallback = (CallResult, OpenSession.Response?) -> Void


// MARK: - Method: Session Open -

extension PointOfSaleClient {
  // MARK: Internals

  private func openSession(_ request: OpenSession.Request,
                           withAPIKey apiKey: APIKey) throws -> OpenSession.Response {
    return try self.service(apiKey).sessionOpen(request)
  }

  private func openSession(_ request: OpenSession.Request,
                           withAPIKey apiKey: APIKey,
                           _ callback: @escaping OpenSessionCallback) throws -> OpenSessionCall {
    return try self.service(apiKey).sessionOpen(request) { (response, callResult) in
      // handle callback
      callback(callResult, response)
    }
  }

  // MARK: Public API

  /// Open a fresh point-of-sale session for an authorized user. A point-of-sale session is required to open and mutate
  /// purchase tickets, and is identified by a POS session ID. The user authorizes via the auth token they are given in
  /// the `authorize` step. POS sessions are innately bound to the device they are established on. A user may
  /// concurrently have as many sessions on as many devices as they want. This synchronous variant either provides a
  /// response via return value, or throws errors encountered client-side or server-side.
  ///
  /// - SeeAlso: Asynchronous variant of `openSession`.
  ///
  /// - Parameter sessionID: ID for the session that we wish to open. Provisioned & assigned by the `authorize` method.
  /// - Parameter authToken: Authorization token provided to the user after authorizing their session.
  /// - Parameter deviceKey: Key for the point-of-sale device upon which this user is opening a session.
  /// - Parameter openState: Opening state for the point-of-sale device, including the drawer float.
  /// - Returns: Response detailing the session that was opened, and any resulting state.
  /// - Throws: Client and server-side errors are thrown. This method is synchronous.
  public func openSession(_ sessionID: POSSessionID,
                          forAuthToken authToken: String,
                          onDevice deviceKey: PartnerDeviceKey,
                          withOpenState openState: PointOfSaleState.SessionOpen? = nil) throws -> OpenSession.Response {
    fatalError("not implemented")
  }

  /// Open a fresh point-of-sale session for an authorized user. A point-of-sale session is required to open and mutate
  /// purchase tickets, and is identified by a POS session ID. The user authorizes via the auth token they are given in
  /// the `authorize` step. POS sessions are innately bound to the device they are established on. A user may
  /// concurrently have as many sessions on as many devices as they want. This asynchronous variant dispatches its
  /// results via a callback, and throws errors experienced client-side.
  ///
  /// - SeeAlso: Synchronous variant of `openSession`.
  ///
  /// - Parameter sessionID: ID for the session that we wish to open. Provisioned & assigned by the `authorize` method.
  /// - Parameter authToken: Authorization token provided to the user after authorizing their session.
  /// - Parameter deviceKey: Key for the point-of-sale device upon which this user is opening a session.
  /// - Parameter openState: Opening state for the point-of-sale device, including the drawer float.
  /// - Parameter callback: Callable to dispatch once either a terminal error or response are available.
  /// - Returns: Response detailing the session that was opened, and any resulting state.
  /// - Throws: Client and server-side errors are thrown. This method is synchronous.
  @discardableResult
  public func openSession(_ sessionID: String,
                          forAuthToken authToken: String,
                          onDevice deviceKey: PartnerDeviceKey,
                          withOpenState openState: PointOfSaleState.SessionOpen? = nil,
                          _ callback: @escaping OpenSessionCallback) throws -> OpenSessionCall {
    fatalError("not implemented")
  }

}
