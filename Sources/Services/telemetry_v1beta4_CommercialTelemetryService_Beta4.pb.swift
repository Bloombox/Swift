// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: telemetry/v1beta4/CommercialTelemetryService_Beta4.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

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
*/

///*
/// Provides telemetry services focused on commercially-oriented data-sets and funnels. In this paradigm, events like
/// impressions for products and sections are registered, then views on those properties/content, then actions on them,
/// which may potentially represent conversions.

import Foundation
import SwiftProtobuf
import OpenCannabis

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Specifies an event related to commercial services. This includes product events, section events, and order events.
public struct Bloombox_Services_Telemetry_V1beta4_CommercialEvent {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies an impression-type event.
  public struct Impression {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Explicit event UUID.
    public var uuid: String {
      get {return _storage._uuid}
      set {_uniqueStorage()._uuid = newValue}
    }

    /// Event context to specify for this event.
    public var context: Bloombox_Analytics_Context {
      get {return _storage._context ?? Bloombox_Analytics_Context()}
      set {_uniqueStorage()._context = newValue}
    }
    /// Returns true if `context` has been explicitly set.
    public var hasContext: Bool {return _storage._context != nil}
    /// Clears the value of `context`. Subsequent reads from it will return its default value.
    public mutating func clearContext() {_uniqueStorage()._context = nil}

    /// Event being reported in this transaction.
    public var event: OneOf_Event? {
      get {return _storage._event}
      set {_uniqueStorage()._event = newValue}
    }

    /// Impression event on a menu section.
    public var section: Bloombox_Analytics_Section_Impression {
      get {
        if case .section(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Section_Impression()
      }
      set {_uniqueStorage()._event = .section(newValue)}
    }

    /// Impression event on a menu product.
    public var product: Bloombox_Analytics_Product_Impression {
      get {
        if case .product(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Product_Impression()
      }
      set {_uniqueStorage()._event = .product(newValue)}
    }

    /// Impression event for a commercial shop.
    public var shop: Bloombox_Analytics_Shop_Impression {
      get {
        if case .shop(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Shop_Impression()
      }
      set {_uniqueStorage()._event = .shop(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    /// Event being reported in this transaction.
    public enum OneOf_Event: Equatable {
      /// Impression event on a menu section.
      case section(Bloombox_Analytics_Section_Impression)
      /// Impression event on a menu product.
      case product(Bloombox_Analytics_Product_Impression)
      /// Impression event for a commercial shop.
      case shop(Bloombox_Analytics_Shop_Impression)

    #if !swift(>=4.1)
      public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression.OneOf_Event, rhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression.OneOf_Event) -> Bool {
        switch (lhs, rhs) {
        case (.section(let l), .section(let r)): return l == r
        case (.product(let l), .product(let r)): return l == r
        case (.shop(let l), .shop(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  /// Specifies a view-type event.
  public struct View {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Explicit event UUID.
    public var uuid: String {
      get {return _storage._uuid}
      set {_uniqueStorage()._uuid = newValue}
    }

    /// Event context to specify for this event.
    public var context: Bloombox_Analytics_Context {
      get {return _storage._context ?? Bloombox_Analytics_Context()}
      set {_uniqueStorage()._context = newValue}
    }
    /// Returns true if `context` has been explicitly set.
    public var hasContext: Bool {return _storage._context != nil}
    /// Clears the value of `context`. Subsequent reads from it will return its default value.
    public mutating func clearContext() {_uniqueStorage()._context = nil}

    /// Event being reported in this transaction.
    public var event: OneOf_Event? {
      get {return _storage._event}
      set {_uniqueStorage()._event = newValue}
    }

    /// View event on a menu section.
    public var section: Bloombox_Analytics_Section_View {
      get {
        if case .section(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Section_View()
      }
      set {_uniqueStorage()._event = .section(newValue)}
    }

    /// View event on a menu product.
    public var product: Bloombox_Analytics_Product_View {
      get {
        if case .product(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Product_View()
      }
      set {_uniqueStorage()._event = .product(newValue)}
    }

    /// View event for a commercial shop.
    public var shop: Bloombox_Analytics_Shop_View {
      get {
        if case .shop(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Shop_View()
      }
      set {_uniqueStorage()._event = .shop(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    /// Event being reported in this transaction.
    public enum OneOf_Event: Equatable {
      /// View event on a menu section.
      case section(Bloombox_Analytics_Section_View)
      /// View event on a menu product.
      case product(Bloombox_Analytics_Product_View)
      /// View event for a commercial shop.
      case shop(Bloombox_Analytics_Shop_View)

    #if !swift(>=4.1)
      public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View.OneOf_Event, rhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View.OneOf_Event) -> Bool {
        switch (lhs, rhs) {
        case (.section(let l), .section(let r)): return l == r
        case (.product(let l), .product(let r)): return l == r
        case (.shop(let l), .shop(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  /// Specifies an action-type event.
  public struct Action {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Explicit event UUID.
    public var uuid: String {
      get {return _storage._uuid}
      set {_uniqueStorage()._uuid = newValue}
    }

    /// Name for the action being transmitted. This is the string enum name for whatever event type is in use.
    public var name: String {
      get {return _storage._name}
      set {_uniqueStorage()._name = newValue}
    }

    /// Event context to specify for this event.
    public var context: Bloombox_Analytics_Context {
      get {return _storage._context ?? Bloombox_Analytics_Context()}
      set {_uniqueStorage()._context = newValue}
    }
    /// Returns true if `context` has been explicitly set.
    public var hasContext: Bool {return _storage._context != nil}
    /// Clears the value of `context`. Subsequent reads from it will return its default value.
    public mutating func clearContext() {_uniqueStorage()._context = nil}

    /// Event being reported in this transaction.
    public var event: OneOf_Event? {
      get {return _storage._event}
      set {_uniqueStorage()._event = newValue}
    }

    /// Action event on a menu section.
    public var section: Bloombox_Analytics_Section_Action {
      get {
        if case .section(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Section_Action()
      }
      set {_uniqueStorage()._event = .section(newValue)}
    }

    /// Action event on a menu product.
    public var product: Bloombox_Analytics_Product_Action {
      get {
        if case .product(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Product_Action()
      }
      set {_uniqueStorage()._event = .product(newValue)}
    }

    /// Action event for a commercial shop.
    public var shop: Bloombox_Analytics_Shop_Action {
      get {
        if case .shop(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Shop_Action()
      }
      set {_uniqueStorage()._event = .shop(newValue)}
    }

    /// Action event on a user order.
    public var order: Bloombox_Analytics_Order_Action {
      get {
        if case .order(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Order_Action()
      }
      set {_uniqueStorage()._event = .order(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    /// Event being reported in this transaction.
    public enum OneOf_Event: Equatable {
      /// Action event on a menu section.
      case section(Bloombox_Analytics_Section_Action)
      /// Action event on a menu product.
      case product(Bloombox_Analytics_Product_Action)
      /// Action event for a commercial shop.
      case shop(Bloombox_Analytics_Shop_Action)
      /// Action event on a user order.
      case order(Bloombox_Analytics_Order_Action)

    #if !swift(>=4.1)
      public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action.OneOf_Event, rhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action.OneOf_Event) -> Bool {
        switch (lhs, rhs) {
        case (.section(let l), .section(let r)): return l == r
        case (.product(let l), .product(let r)): return l == r
        case (.shop(let l), .shop(let r)): return l == r
        case (.order(let l), .order(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.services.telemetry.v1beta4"

extension Bloombox_Services_Telemetry_V1beta4_CommercialEvent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CommercialEvent"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent, rhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Telemetry_V1beta4_CommercialEvent.protoMessageName + ".Impression"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uuid"),
    2: .same(proto: "context"),
    10: .same(proto: "section"),
    11: .same(proto: "product"),
    12: .same(proto: "shop"),
  ]

  fileprivate class _StorageClass {
    var _uuid: String = String()
    var _context: Bloombox_Analytics_Context? = nil
    var _event: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression.OneOf_Event?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _uuid = source._uuid
      _context = source._context
      _event = source._event
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._uuid)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._context)
        case 10:
          var v: Bloombox_Analytics_Section_Impression?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .section(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .section(v)}
        case 11:
          var v: Bloombox_Analytics_Product_Impression?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .product(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .product(v)}
        case 12:
          var v: Bloombox_Analytics_Shop_Impression?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .shop(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .shop(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._uuid.isEmpty {
        try visitor.visitSingularStringField(value: _storage._uuid, fieldNumber: 1)
      }
      if let v = _storage._context {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      switch _storage._event {
      case .section(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .product(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case .shop(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression, rhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._uuid != rhs_storage._uuid {return false}
        if _storage._context != rhs_storage._context {return false}
        if _storage._event != rhs_storage._event {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Telemetry_V1beta4_CommercialEvent.protoMessageName + ".View"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uuid"),
    2: .same(proto: "context"),
    10: .same(proto: "section"),
    11: .same(proto: "product"),
    12: .same(proto: "shop"),
  ]

  fileprivate class _StorageClass {
    var _uuid: String = String()
    var _context: Bloombox_Analytics_Context? = nil
    var _event: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View.OneOf_Event?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _uuid = source._uuid
      _context = source._context
      _event = source._event
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._uuid)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._context)
        case 10:
          var v: Bloombox_Analytics_Section_View?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .section(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .section(v)}
        case 11:
          var v: Bloombox_Analytics_Product_View?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .product(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .product(v)}
        case 12:
          var v: Bloombox_Analytics_Shop_View?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .shop(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .shop(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._uuid.isEmpty {
        try visitor.visitSingularStringField(value: _storage._uuid, fieldNumber: 1)
      }
      if let v = _storage._context {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      switch _storage._event {
      case .section(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .product(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case .shop(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View, rhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._uuid != rhs_storage._uuid {return false}
        if _storage._context != rhs_storage._context {return false}
        if _storage._event != rhs_storage._event {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Telemetry_V1beta4_CommercialEvent.protoMessageName + ".Action"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uuid"),
    2: .same(proto: "name"),
    3: .same(proto: "context"),
    10: .same(proto: "section"),
    11: .same(proto: "product"),
    12: .same(proto: "shop"),
    13: .same(proto: "order"),
  ]

  fileprivate class _StorageClass {
    var _uuid: String = String()
    var _name: String = String()
    var _context: Bloombox_Analytics_Context? = nil
    var _event: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action.OneOf_Event?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _uuid = source._uuid
      _name = source._name
      _context = source._context
      _event = source._event
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._uuid)
        case 2: try decoder.decodeSingularStringField(value: &_storage._name)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._context)
        case 10:
          var v: Bloombox_Analytics_Section_Action?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .section(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .section(v)}
        case 11:
          var v: Bloombox_Analytics_Product_Action?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .product(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .product(v)}
        case 12:
          var v: Bloombox_Analytics_Shop_Action?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .shop(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .shop(v)}
        case 13:
          var v: Bloombox_Analytics_Order_Action?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .order(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .order(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._uuid.isEmpty {
        try visitor.visitSingularStringField(value: _storage._uuid, fieldNumber: 1)
      }
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 2)
      }
      if let v = _storage._context {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      switch _storage._event {
      case .section(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .product(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case .shop(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      case .order(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 13)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action, rhs: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._uuid != rhs_storage._uuid {return false}
        if _storage._name != rhs_storage._name {return false}
        if _storage._context != rhs_storage._context {return false}
        if _storage._event != rhs_storage._event {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
