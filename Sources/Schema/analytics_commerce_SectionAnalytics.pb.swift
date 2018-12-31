// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: analytics/commerce/SectionAnalytics.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

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

/// Specifies actions that may be taken within a menu section.
public enum Bloombox_Analytics_Section_SectionAction: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The section was viewed. Section views are implemented under-the-hood as actions of type VIEW.
  case view // = 0

  /// The section was sorted on some product property, presumably reordering the visible products.
  case sort // = 1

  /// The section was filtered on some product property, presumably mutating the set of visible products.
  case filter // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .view
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .view
    case 1: self = .sort
    case 2: self = .filter
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .view: return 0
    case .sort: return 1
    case .filter: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Analytics_Section_SectionAction: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Analytics_Section_SectionAction] = [
    .view,
    .sort,
    .filter,
  ]
}

#endif  // swift(>=4.2)

/// Specifies a section impression event, wherein a user has been presented a particular menu section.
public struct Bloombox_Analytics_Section_Impression {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Section that was presented.
  public var spec: Opencannabis_Products_Menu_Section_SectionSpec {
    get {return _storage._spec ?? Opencannabis_Products_Menu_Section_SectionSpec()}
    set {_uniqueStorage()._spec = newValue}
  }
  /// Returns true if `spec` has been explicitly set.
  public var hasSpec: Bool {return _storage._spec != nil}
  /// Clears the value of `spec`. Subsequent reads from it will return its default value.
  public mutating func clearSpec() {_uniqueStorage()._spec = nil}

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

/// Specifies a section view event, wherein a user has navigated to a particular menu section.
public struct Bloombox_Analytics_Section_View {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Section that was viewed.
  public var spec: Opencannabis_Products_Menu_Section_SectionSpec {
    get {return _storage._spec ?? Opencannabis_Products_Menu_Section_SectionSpec()}
    set {_uniqueStorage()._spec = newValue}
  }
  /// Returns true if `spec` has been explicitly set.
  public var hasSpec: Bool {return _storage._spec != nil}
  /// Clears the value of `spec`. Subsequent reads from it will return its default value.
  public mutating func clearSpec() {_uniqueStorage()._spec = nil}

  /// Whether this was a user-initiated view, or a default view.
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

/// Specifies a section action event, wherein a user has affirmatively elected to take some action while within a master
/// view of a particular menu section.
public struct Bloombox_Analytics_Section_Action {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Section that was viewed.
  public var spec: Opencannabis_Products_Menu_Section_SectionSpec {
    get {return _storage._spec ?? Opencannabis_Products_Menu_Section_SectionSpec()}
    set {_uniqueStorage()._spec = newValue}
  }
  /// Returns true if `spec` has been explicitly set.
  public var hasSpec: Bool {return _storage._spec != nil}
  /// Clears the value of `spec`. Subsequent reads from it will return its default value.
  public mutating func clearSpec() {_uniqueStorage()._spec = nil}

  /// Action that was taken within the section.
  public var verb: Bloombox_Analytics_Section_SectionAction {
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

fileprivate let _protobuf_package = "bloombox.analytics.section"

extension Bloombox_Analytics_Section_SectionAction: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "VIEW"),
    1: .same(proto: "SORT"),
    2: .same(proto: "FILTER"),
  ]
}

extension Bloombox_Analytics_Section_Impression: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Impression"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "spec"),
    2: .same(proto: "occurred"),
  ]

  fileprivate class _StorageClass {
    var _spec: Opencannabis_Products_Menu_Section_SectionSpec? = nil
    var _occurred: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _spec = source._spec
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._spec)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._occurred)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._spec {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._occurred {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Analytics_Section_Impression, rhs: Bloombox_Analytics_Section_Impression) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._spec != rhs_storage._spec {return false}
        if _storage._occurred != rhs_storage._occurred {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Analytics_Section_View: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".View"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "spec"),
    2: .same(proto: "interactive"),
    3: .same(proto: "occurred"),
  ]

  fileprivate class _StorageClass {
    var _spec: Opencannabis_Products_Menu_Section_SectionSpec? = nil
    var _interactive: Bool = false
    var _occurred: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _spec = source._spec
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._spec)
        case 2: try decoder.decodeSingularBoolField(value: &_storage._interactive)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._occurred)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._spec {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
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

  public static func ==(lhs: Bloombox_Analytics_Section_View, rhs: Bloombox_Analytics_Section_View) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._spec != rhs_storage._spec {return false}
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

extension Bloombox_Analytics_Section_Action: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Action"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "spec"),
    2: .same(proto: "verb"),
    3: .same(proto: "occurred"),
  ]

  fileprivate class _StorageClass {
    var _spec: Opencannabis_Products_Menu_Section_SectionSpec? = nil
    var _verb: Bloombox_Analytics_Section_SectionAction = .view
    var _occurred: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _spec = source._spec
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._spec)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._verb)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._occurred)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._spec {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if _storage._verb != .view {
        try visitor.visitSingularEnumField(value: _storage._verb, fieldNumber: 2)
      }
      if let v = _storage._occurred {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Analytics_Section_Action, rhs: Bloombox_Analytics_Section_Action) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._spec != rhs_storage._spec {return false}
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
