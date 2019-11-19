/**
* Copyright 2019, Momentum Ideas, Co. All rights reserved.
* Source and object computer code contained herein is the private intellectual
* property of Momentum Ideas Co., a Delaware Corporation. Use of this
* code in source form requires permission in writing before use or the
* assembly, distribution, or publishing of derivative works, for commercial
* purposes or any other purpose, from a duly authorized officer of Momentum
* Ideas Co.
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

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

  /// Specifies a "search event," which includes submitting a search and receiving results, and selecting a result from
  /// that set of results, as applicable.
  case search(SearchEvent)

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
        collection.name = EventCollection.encodeCollectionName(commercialEvent.name!) ?? commercialEvent.name!
        collection.type = .commercial
        break

      case .identity(let identityEvent):
        collection.name = EventCollection.encodeCollectionName(identityEvent.label) ?? identityEvent.label
        collection.type = .identity

      case .search(let searchEvent):
        collection.name = EventCollection.encodeCollectionName(searchEvent.label) ?? searchEvent.label
        collection.type = .experience
      }
    }
  }

}


/// Enumerates types of commercial events. Used to specify a commercial event collection with a known event type.
/// Commercial events are eligible for inclusion in marketing funnels, and specify specific purchase-flow events (i.e.
/// impressions, views, conversions/actions, and so on).
public enum CommercialEvent: Labelled, Named {
  /// Enumerates the subject item types for a given commercial event. These are defined by API support, and some
  /// combinations may not be supported (i.e. order impressions and views aren't logical types).
  public enum CommercialEventSubject: Labelled, Named {
    /// The subject of the commercial event is a section of products.
    case section

    /// The subject of the commercial event is an individual product.
    case product

    /// The subject of the commercial event is a retail/commercial order.
    case order

    /// Label to use for this commercial event subject.
    public var label: String? {
      switch self {
      case .section: return "Section"
      case .product: return "Product"
      case .order: return "Order"
      }
    }

    /// Name to use for this commercial event subject.
    public var name: String? {
      switch self {
      case .section: return "SECTION"
      case .product: return "PRODUCT"
      case .order: return "ORDER"
      }
    }
  }

  /// Specifies a product or section impression, where a product item or product section was shown to the user, or
  /// otherwise presented as a selectable option.
  case impression(CommercialEventSubject)

  /// Specifies a product or section view, where a user clicked or tapped on a product or product section, from a set of
  /// like-items displayed in a master-style section.
  case view(CommercialEventSubject)

  /// Specifies an action taken in an application, which may be a conversion event, or some other product action.
  /// Actions include zooming on photos, modifying filters, adding or removing items from the cart or bag, and so on.
  case action(CommercialEventSubject)

  /// Label to use for this commercial event type.
  public var label: String? {
    switch self {
    case .impression(let subject): return "Impression (\(subject.label!))"
    case .view(let subject): return "View (\(subject.label!))"
    case .action(let subject): return "Action (\(subject.label!))"
    }
  }

  /// Name to use for this commercial event type.
  public var name: String? {
    switch self {
    case .impression(let subject): return "IMPRESSION::\(subject.name!)"
    case .view(let subject): return "VIEW::\(subject.name!)"
    case .action(let subject): return "ACTION::\(subject.name!)"
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


/// Enumerates types of search events. Used to specify an event where a user searched a catalog and received a
/// resultset, or selected an item from that resultset.
public enum SearchEvent {
  /// Search query was submitted by a user, and a result-set was received of some kind.
  case query

  /// Result was selected by a user from a search query result-set.
  case result

  /// Label to use for this search event type.
  var label: String {
    switch self {
    case .query: return "QUERY"
    case .result: return "RESULT"
    }
  }
}
