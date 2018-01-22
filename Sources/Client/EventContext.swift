//
//  EventContext.swift
//  Client
//
//  Created by James Clark on 12/13/17.
//

import Foundation
import Schema


// Typealiases
public typealias UserID = String
public typealias ItemID = String
public typealias APIKey = String
public typealias GroupID = String
public typealias OrderID = String
public typealias DeviceUUID = String
public typealias PartnerCode = String
public typealias LocationCode = String


// Constants
internal let internalCollectionPrefix = "_bloom_"
internal let deviceFingerprint = UUID.init().uuidString.uppercased()


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
  var partner: PartnerCode? { get }

  /**
   * Specifies the active partner location code for a given event.
   */
  var location: LocationCode? { get }

  /**
   * Specifies a persistent device UUID, if known, for a given event.
   */
  var deviceUUID: DeviceUUID? { get }

  /**
   * Specifies an event collection for a particular event.
   */
  var collection: EventCollection? { get }

  /**
   * Specifies an active order ID.
   */
  var order: OrderID? { get }

  /**
   * Specifies an active user ID.
   */
  var user: UserID? { get }

  /**
   * Specifies an active commercial menu section.
   */
  var section: MenuSection? { get }

  /**
   * Specifies a related or otherwise active commercial item.
   */
  var item: ItemID? { get }

  /**
   * Specifies a related or otherwise active commercial item.
   */
  var group: GroupID? { get }

  /**
   * Specifies the iOS application sending events.
   */
  var bundleId: String? { get }

  /**
   * Merge two objects specifying event context.
   */
  func export() -> AnalyticsContext
}


extension EventContextData {
  /**
   * Export an `EventContext` object to its proto counterpart.
   */
  public func export() -> AnalyticsContext {
    return AnalyticsContext.with { context in
      // handle device fingerprint
      context.fingerprint = deviceFingerprint

      // handle group/session ID
      if let groupId = self.group {
        context.group = groupId
      }

      // library context
      context.library = LibraryContext.with { library in
        library.client = .swift
        library.variant = __BLOOMBOX_VARIANT__
        library.version = VersionSpec.with { version in
          version.name = __BLOOMBOX_VERSION__
        }
      }

      if let bundleId = self.bundleId {
        context.app = ApplicationContext.with { builder in
          builder.bundleID = bundleId
        }
      }

      // handle collection
      if let eventCollection: EventCollection = self.collection {
        context.collection = eventCollection.export()
      }

      // handle scope
      context.scope = AnalyticsScope.with { scope in
        // first: partner scope
        if let partnerCode = self.partner {
          if let locationCode = self.location {
            if let deviceID = self.deviceUUID {
              scope.partner = "partner/\(partnerCode)/location/\(locationCode)/device/\(deviceID)"
            } else {
              // partner + location but no device
              scope.partner = "partner/\(partnerCode)/location/\(locationCode)"
            }
          } else {
            // partner but no location or device
            scope.partner = "partner/\(partnerCode)"
          }
        }

        // second: order key
        if let orderId = self.order {
          scope.order = orderId
        }

        // third: commercial scope
        if let section = self.section {
          if let item = self.item {
            scope.commercial = "section/\(section)/item/\(item)"
          } else {
            // no item, but we have a section
            scope.commercial = "section/\(section)"
          }
        }
      }
    }
  }
}


/**
 * Internal protocol for protobuf-related tools.
 */
internal protocol EventContextProto: EventContextData {
  /**
   * Merge two objects specifying event context.
   */
  func merge(other: EventContextProto) -> Analytics_Context
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
}


/**
 * Context for an individual event. This struct can be passed in when invoking an event
 * transmission method, and overrides any default context set on the main API client via client
 * settings, specified in `Bloombox.settings`.
 */
public struct EventContext: EventContextData {
  /**
   * Partner code for this individual event context object.
   */
  public let partner: PartnerCode? = nil

  /**
   * Location code for this individual event context object.
   */
  public let location: LocationCode? = nil

  /**
   * Device UUID, if known, for this individual event context object.
   */
  public let deviceUUID: DeviceUUID? = nil

  /**
   * Collection specified for this individual event context object.
   */
  public let collection: EventCollection? = nil

  /**
   * Specifies an active order ID.
   */
  public let order: OrderID? = nil

  /**
   * Specifies an active user ID.
   */
  public let user: UserID? = nil

  /**
   * Specifies an active commercial menu section.
   */
  public let section: MenuSection? = nil

  /**
   * Specifies a related or otherwise active commercial item.
   */
  public let item: ItemID? = nil

  /**
   * Specifies a related or otherwise active commercial item.
   */
  public let group: GroupID? = nil

  /**
   * Specifies the iOS application sending events.
   */
  public let bundleId: String? = nil
}
