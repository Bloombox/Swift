//
//  EventCollection.swift
//  Client
//
//  Created by James Clark on 12/13/17.
//

import Foundation


/// Enumerates types of event collections that events may be relayed to. The simplest form of an event collection is
/// simply a string name, via the `.named(String)` enum.
public enum EventCollection {
  /// Specifies a named event collection, with a simple string name. Collection names are case-insensitive and are
  /// expected to be provided and referenced in lowercase (the value will be lowercased either way).
  case named(String)

  /// Specifies a commercial event collection, with a specific, enumerated kind of commercial event (i.e. an impression,
  /// conversion, or other purchase-flow event).
  case commercial(CommercialEvent)

  /// Specifies an "identity event," which includes becoming a member at a partner location, allowing or denying consent
  /// to user data, and so on.
  case identity(IdentityEvent)

  fileprivate static func encodeCollectionName(_ name: String) -> String? {
    return name.data(using: .utf8)?.base64EncodedString()
  }

  internal func export() -> AnalyticsCollection {
    return AnalyticsCollection.with { collection in
      switch self {
      case .named(let name):
        collection.name = EventCollection.encodeCollectionName(name) ?? name
        collection.type = .generic
        collection.internal = name.starts(with: internalCollectionPrefix)
        break

      case .commercial(let commercialEvent):
        collection.name = EventCollection.encodeCollectionName(commercialEvent.label) ?? commercialEvent.label
        collection.type = .commercial
        break

      case .identity(let identityEvent):
        collection.name = EventCollection.encodeCollectionName(identityEvent.label) ?? identityEvent.label
        collection.type = .identity
      }
    }
  }

}


/// Enumerates types of commercial events. Used to specify a commercial event collection with a known event type.
/// Commercial events are eligible for inclusion in marketing funnels, and specify specific purchase-flow events (i.e.
/// impressions, views, conversions/actions, and so on).
public enum CommercialEvent {
  /// Specifies a product or section impression, where a product item or product section was shown to the user, or
  /// otherwise presented as a selectable option.
  case impression

  /// Specifies a product or section view, where a user clicked or tapped on a product or product section, from a set of
  /// like-items displayed in a master-style section.
  case view

  /// Specifies an action taken in an application, which may be a conversion event, or some other product action.
  /// Actions include zooming on photos, modifying filters, adding or removing items from the cart or bag, and so on.
  case action

  /// Label to use for this commercial event type.
  var label: String {
    switch self {
    case .impression: return "IMPRESSION"
    case .view: return "VIEW"
    case .action: return "ACTION"
    }
  }
}


/// Enumerates types of identity events. Used to specify a user identity event collection with a known event type. The
/// sole event type defined is `action`, which covers situations where an identity was used to create a new membership,
/// or action was taken with regard to user data consent.
public enum IdentityEvent {
  /// Action taken by a user with regard to their identity. Covers consent actions ('allow', 'deny'), and becoming a
  /// member at a new partner location (`enroll`).
  case action

  /// Label to use for this identity event type.
  var label: String {
    switch self {
    case .action: return "ACTION"
    }
  }
}
