//
//  EventContext.swift
//  Client
//
//  Created by James Clark on 12/13/17.
//

import Foundation
import Schema


/**
 * Specifies context for a specific telemetry event of some kind. "Event context" is defined as
 * the state of various actors and elements during transmission of an event. This would include,
 * but is not limited to, the active user account, active order, menu section, item, etc.
 *
 * Context is also used to specify native and browser device context. In this setting, i.e.
 * native Swift, we use native context to describe the device sending the event.
 *
 * The library calculates global context statically and holds it as a singleton. To specify your
 * own context, pass an explicit `EventContext` object into the relevant telemetry event
 * tramission method you're interacting with.
 *
 * Global context and local invocation context are merged before sending to the server, with
 * standard protobuf merge semantics applying.
 */
public protocol EventContextData {
  /**
   * Specifies the active partner code for a given event.
   */
  var partner: String? { get }

  /**
   * Specifies the active partner location code for a given event.
   */
  var location: String? { get }

  /**
   * Specifies a persistent device UUID, if known, for a given event.
   */
  var deviceUUID: String? { get }

  /**
   * Specifies an event collection for a particular event.
   */
  var collection: EventCollection? { get }
}


/**
 * Internal protocol for protobuf-related tools.
 */
internal protocol EventContextProto: EventContextData {
  /**
   * Merge two objects specifying event context.
   */
  func merge(other: EventContextProto) -> Analytics_Context

  /**
   * Merge two objects specifying event context.
   */
  func export() -> Analytics_Context
}


extension EventContextProto {
  /**
   * Merge `other` event context and this one, with properties from `other` overriding in the
   * newly-created event context (it is copied, not merged in-place).
   */
  public func merge(other: EventContextProto) throws -> Analytics_Context {
    var exported = self.export()

    // @TODO: better merging here (i.e. without serializing)
    try exported.merge(serializedData: try other.export().serializedData())
    return exported
  }

  /**
   * Export an `EventContext` object to its proto counterpart.
   */
  public func export() -> Analytics_Context {
    var context = Analytics_Context()

    // @TODO: export context

    return context
  }
}


/**
 * Context for an individual event. This struct can be passed in when invoking an event
 * transmission method, and overrides any default context set on the main API client via client
 * settings, specified in `BloomboxClient.settings`.
 */
public struct EventContext: EventContextData {
  /**
   * Partner code for this individual event context object.
   */
  public let partner: String? = nil

  /**
   * Location code for this individual event context object.
   */
  public let location: String? = nil

  /**
   * Device UUID, if known, for this individual event context object.
   */
  public let deviceUUID: String? = nil

  /**
   * Collection specified for this individual event context object.
   */
  public let collection: EventCollection? = nil
}
