// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: products/SKU.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Provides records related to stock-keeping-units (SKUs), including managing them, mapping them, and understanding
/// where they fit into this and other data-models.

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

/// Enumerates types of SKUs that can be mapped to products. SKUs either occur at the "product" level, or the "item"
/// level, which addresses each variant of a product.
public enum Opencannabis_Products_Sku_SKUType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// SKUs occurring at the item-level.
  case item // = 0

  /// SKUs occurring at the product-level.
  case product // = 1
  case UNRECOGNIZED(Int)

  public init() {
    self = .item
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .item
    case 1: self = .product
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .item: return 0
    case .product: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Products_Sku_SKUType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Products_Sku_SKUType] = [
    .item,
    .product,
  ]
}

#endif  // swift(>=4.2)

/// Describes the concept of a Stock-Keeping-Unit (SKU), or stock-keeping-ID, that has been mapped to a given product
/// within some system. SKUs mapped in this manner may specify the product variance which they address. This allows
/// grouping of SKUs under relevant product IDs.
public struct Opencannabis_Products_Sku_MappedSKU {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// SKU value for this item.
  public var sku: String {
    get {return _storage._sku}
    set {_uniqueStorage()._sku = newValue}
  }

  /// Foreign record ID that holds this SKU in the 3rd-party system.
  public var foreign: String {
    get {return _storage._foreign}
    set {_uniqueStorage()._foreign = newValue}
  }

  /// Type of SKU this value represents.
  public var type: Opencannabis_Products_Sku_SKUType {
    get {return _storage._type}
    set {_uniqueStorage()._type = newValue}
  }

  /// Integrating system, from which we are referencing a record with this SKU.
  public var system: Bloombox_Partner_Integrations_IntegrationPartner {
    get {return _storage._system}
    set {_uniqueStorage()._system = newValue}
  }

  /// Specifies the individual items/product variants targeted by this SKU.
  public var target: OneOf_Target? {
    get {return _storage._target}
    set {_uniqueStorage()._target = newValue}
  }

  /// Specifies that this target has no variance.
  public var unit: Bool {
    get {
      if case .unit(let v)? = _storage._target {return v}
      return false
    }
    set {_uniqueStorage()._target = .unit(newValue)}
  }

  /// Specifies the product variant targeted by this SKU.
  public var variant: Opencannabis_Commerce_VariantSpec {
    get {
      if case .variant(let v)? = _storage._target {return v}
      return Opencannabis_Commerce_VariantSpec()
    }
    set {_uniqueStorage()._target = .variant(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies the individual items/product variants targeted by this SKU.
  public enum OneOf_Target: Equatable {
    /// Specifies that this target has no variance.
    case unit(Bool)
    /// Specifies the product variant targeted by this SKU.
    case variant(Opencannabis_Commerce_VariantSpec)

  #if !swift(>=4.1)
    public static func ==(lhs: Opencannabis_Products_Sku_MappedSKU.OneOf_Target, rhs: Opencannabis_Products_Sku_MappedSKU.OneOf_Target) -> Bool {
      switch (lhs, rhs) {
      case (.unit(let l), .unit(let r)): return l == r
      case (.variant(let l), .variant(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.products.sku"

extension Opencannabis_Products_Sku_SKUType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ITEM"),
    1: .same(proto: "PRODUCT"),
  ]
}

extension Opencannabis_Products_Sku_MappedSKU: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MappedSKU"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sku"),
    2: .same(proto: "foreign"),
    3: .same(proto: "type"),
    4: .same(proto: "system"),
    10: .same(proto: "unit"),
    11: .same(proto: "variant"),
  ]

  fileprivate class _StorageClass {
    var _sku: String = String()
    var _foreign: String = String()
    var _type: Opencannabis_Products_Sku_SKUType = .item
    var _system: Bloombox_Partner_Integrations_IntegrationPartner = .internal
    var _target: Opencannabis_Products_Sku_MappedSKU.OneOf_Target?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _sku = source._sku
      _foreign = source._foreign
      _type = source._type
      _system = source._system
      _target = source._target
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._sku)
        case 2: try decoder.decodeSingularStringField(value: &_storage._foreign)
        case 3: try decoder.decodeSingularEnumField(value: &_storage._type)
        case 4: try decoder.decodeSingularEnumField(value: &_storage._system)
        case 10:
          if _storage._target != nil {try decoder.handleConflictingOneOf()}
          var v: Bool?
          try decoder.decodeSingularBoolField(value: &v)
          if let v = v {_storage._target = .unit(v)}
        case 11:
          var v: Opencannabis_Commerce_VariantSpec?
          if let current = _storage._target {
            try decoder.handleConflictingOneOf()
            if case .variant(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._target = .variant(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._sku.isEmpty {
        try visitor.visitSingularStringField(value: _storage._sku, fieldNumber: 1)
      }
      if !_storage._foreign.isEmpty {
        try visitor.visitSingularStringField(value: _storage._foreign, fieldNumber: 2)
      }
      if _storage._type != .item {
        try visitor.visitSingularEnumField(value: _storage._type, fieldNumber: 3)
      }
      if _storage._system != .internal {
        try visitor.visitSingularEnumField(value: _storage._system, fieldNumber: 4)
      }
      switch _storage._target {
      case .unit(let v)?:
        try visitor.visitSingularBoolField(value: v, fieldNumber: 10)
      case .variant(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Products_Sku_MappedSKU, rhs: Opencannabis_Products_Sku_MappedSKU) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._sku != rhs_storage._sku {return false}
        if _storage._foreign != rhs_storage._foreign {return false}
        if _storage._type != rhs_storage._type {return false}
        if _storage._system != rhs_storage._system {return false}
        if _storage._target != rhs_storage._target {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}