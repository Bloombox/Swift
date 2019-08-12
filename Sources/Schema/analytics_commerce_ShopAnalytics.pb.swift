// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: analytics/commerce/ShopAnalytics.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Provides a structure for specifying various shop impression events. Enumerates actions that can be made in the shop.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Specifies actions that may be taken w.r.t. a physical or digital storefront. Stays in sync with `UserAction`.
public enum Bloombox_Analytics_Shop_ShopAction: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The storefront was viewed, or entered physically by a patron.
  case engage // = 0

  /// The storefront or digital property facilitated the user's enrollment with Bloombox.
  case enroll // = 10

  /// The user activated a dormant or previously-created shadow account for themselves at this digital storefront or
  /// physical storefront location.
  case activate // = 11

  /// The storefront or digital property facilitated the enrollment of an existing Bloombox user with the storefront's
  /// membership systems, either operated by Bloombox or another party.
  case join // = 12

  /// A physical storefront verified a user's cannabis recommendation, age eligibility, or in general, their eligibility
  /// to make purchases including legal cannabis.
  case verify // = 13

  /// A physical storefront checked a user in, or a digital storefront logged a user in.
  case checkin // = 14

  /// The user's preferences were adjusted in some manner, either online, after logging in as themselves; or by partner
  /// staff through back-office systems.
  case preferences // = 15

  /// The user made a purchase, either digitally, or at a brick-and-mortar location, facilitated by partner staff.
  case purchase // = 16

  /// The user submitted an order, digitally, via the online shop; or via other communication mediums (phone/email) and
  /// entered and facilitated by dispensary staff, via back-office systems.
  case order // = 17

  /// The user opted in to receive marketing content of some kind, or authorized communications from a partner, whether
  /// physically or digitally. This is distinguished from the corresponding `UserAction`, which is global, and therefore
  /// carries a different ID.
  case optIn // = 20

  /// The user opted out from receiving marketing content from a partner, whether physically or digitally. This is
  /// distinguished from the corresponding `UserAction`, which is global, and therefore carries a different ID.
  case optOut // = 21
  case UNRECOGNIZED(Int)

  public init() {
    self = .engage
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .engage
    case 10: self = .enroll
    case 11: self = .activate
    case 12: self = .join
    case 13: self = .verify
    case 14: self = .checkin
    case 15: self = .preferences
    case 16: self = .purchase
    case 17: self = .order
    case 20: self = .optIn
    case 21: self = .optOut
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .engage: return 0
    case .enroll: return 10
    case .activate: return 11
    case .join: return 12
    case .verify: return 13
    case .checkin: return 14
    case .preferences: return 15
    case .purchase: return 16
    case .order: return 17
    case .optIn: return 20
    case .optOut: return 21
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Analytics_Shop_ShopAction: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Analytics_Shop_ShopAction] = [
    .engage,
    .enroll,
    .activate,
    .join,
    .verify,
    .checkin,
    .preferences,
    .purchase,
    .order,
    .optIn,
    .optOut,
  ]
}

#endif  // swift(>=4.2)

/// Specifies a shop impression event, wherein a user, known or unknown, has witnessed a shop's existence or brand, and
/// was offered the decision to engage.
public struct Bloombox_Analytics_Shop_Impression {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Whether this was an event that occurred at a physical store location, or not. Defaults to no.
  public var physical: Bool {
    get {return _storage._physical}
    set {_uniqueStorage()._physical = newValue}
  }

  /// Specifies when this impression event occurred.
  public var occurred: Opencannabis_Temporal_Instant {
    get {return _storage._occurred ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._occurred = newValue}
  }
  /// Returns true if `occurred` has been explicitly set.
  public var hasOccurred: Bool {return _storage._occurred != nil}
  /// Clears the value of `occurred`. Subsequent reads from it will return its default value.
  public mutating func clearOccurred() {_uniqueStorage()._occurred = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies a shop view event, wherein a user has navigated to a page on a digital web store, entered a physical
/// brick-and-mortar location, or otherwise chosen to engage in a non-commercial way.
public struct Bloombox_Analytics_Shop_View {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Whether this was an event that occurred at a physical store location, or not. Defaults to no.
  public var physical: Bool {
    get {return _storage._physical}
    set {_uniqueStorage()._physical = newValue}
  }

  /// Whether this was a user-initiated view, or a default view action of some kind.
  public var interactive: Bool {
    get {return _storage._interactive}
    set {_uniqueStorage()._interactive = newValue}
  }

  /// Specifies when this view event occurred.
  public var occurred: Opencannabis_Temporal_Instant {
    get {return _storage._occurred ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._occurred = newValue}
  }
  /// Returns true if `occurred` has been explicitly set.
  public var hasOccurred: Bool {return _storage._occurred != nil}
  /// Clears the value of `occurred`. Subsequent reads from it will return its default value.
  public mutating func clearOccurred() {_uniqueStorage()._occurred = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies a shop action event, wherein a user has affirmatively elected to take some action while engaged in an
/// interactive session with a digital or physical commercial storefront.
public struct Bloombox_Analytics_Shop_Action {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Whether this was an event that occurred at a physical store location, or not. Defaults to no.
  public var physical: Bool {
    get {return _storage._physical}
    set {_uniqueStorage()._physical = newValue}
  }

  /// Action that was taken at or within the digital or physical shop.
  public var verb: Bloombox_Analytics_Shop_ShopAction {
    get {return _storage._verb}
    set {_uniqueStorage()._verb = newValue}
  }

  /// Specifies when this action event occurred.
  public var occurred: Opencannabis_Temporal_Instant {
    get {return _storage._occurred ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._occurred = newValue}
  }
  /// Returns true if `occurred` has been explicitly set.
  public var hasOccurred: Bool {return _storage._occurred != nil}
  /// Clears the value of `occurred`. Subsequent reads from it will return its default value.
  public mutating func clearOccurred() {_uniqueStorage()._occurred = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.analytics.shop"

extension Bloombox_Analytics_Shop_ShopAction: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ENGAGE"),
    10: .same(proto: "ENROLL"),
    11: .same(proto: "ACTIVATE"),
    12: .same(proto: "JOIN"),
    13: .same(proto: "VERIFY"),
    14: .same(proto: "CHECKIN"),
    15: .same(proto: "PREFERENCES"),
    16: .same(proto: "PURCHASE"),
    17: .same(proto: "ORDER"),
    20: .same(proto: "OPT_IN"),
    21: .same(proto: "OPT_OUT"),
  ]
}

extension Bloombox_Analytics_Shop_Impression: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Impression"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "physical"),
    2: .same(proto: "occurred"),
  ]

  fileprivate class _StorageClass {
    var _physical: Bool = false
    var _occurred: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _physical = source._physical
      _occurred = source._occurred
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularBoolField(value: &_storage._physical)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._occurred)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._physical != false {
        try visitor.visitSingularBoolField(value: _storage._physical, fieldNumber: 1)
      }
      if let v = _storage._occurred {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Analytics_Shop_Impression, rhs: Bloombox_Analytics_Shop_Impression) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._physical != rhs_storage._physical {return false}
        if _storage._occurred != rhs_storage._occurred {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Analytics_Shop_View: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".View"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "physical"),
    2: .same(proto: "interactive"),
    3: .same(proto: "occurred"),
  ]

  fileprivate class _StorageClass {
    var _physical: Bool = false
    var _interactive: Bool = false
    var _occurred: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _physical = source._physical
      _interactive = source._interactive
      _occurred = source._occurred
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularBoolField(value: &_storage._physical)
        case 2: try decoder.decodeSingularBoolField(value: &_storage._interactive)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._occurred)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._physical != false {
        try visitor.visitSingularBoolField(value: _storage._physical, fieldNumber: 1)
      }
      if _storage._interactive != false {
        try visitor.visitSingularBoolField(value: _storage._interactive, fieldNumber: 2)
      }
      if let v = _storage._occurred {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Analytics_Shop_View, rhs: Bloombox_Analytics_Shop_View) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._physical != rhs_storage._physical {return false}
        if _storage._interactive != rhs_storage._interactive {return false}
        if _storage._occurred != rhs_storage._occurred {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Analytics_Shop_Action: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Action"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "physical"),
    2: .same(proto: "verb"),
    4: .same(proto: "occurred"),
  ]

  fileprivate class _StorageClass {
    var _physical: Bool = false
    var _verb: Bloombox_Analytics_Shop_ShopAction = .engage
    var _occurred: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _physical = source._physical
      _verb = source._verb
      _occurred = source._occurred
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularBoolField(value: &_storage._physical)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._verb)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._occurred)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._physical != false {
        try visitor.visitSingularBoolField(value: _storage._physical, fieldNumber: 1)
      }
      if _storage._verb != .engage {
        try visitor.visitSingularEnumField(value: _storage._verb, fieldNumber: 2)
      }
      if let v = _storage._occurred {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Analytics_Shop_Action, rhs: Bloombox_Analytics_Shop_Action) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._physical != rhs_storage._physical {return false}
        if _storage._verb != rhs_storage._verb {return false}
        if _storage._occurred != rhs_storage._occurred {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
