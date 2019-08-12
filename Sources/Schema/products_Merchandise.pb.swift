// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: products/Merchandise.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Provides structures relating to merchandise and enumerates various merchandise flags, and types.

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

/// Specifies types of generic merchandise that may be carried on a dispensary menu.
public enum Opencannabis_Products_MerchandiseType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Unknown, unrecognized, or otherwise unspecified merchandise subcategory.
  case unspecifiedMerchandise // = 0

  /// Clothing - i.e. shirts, pants, hoodies, and other wearable textiles.
  case clothing // = 1

  /// Cups, mugs, on up to pipes and bongs.
  case glassware // = 2

  /// Containers for cannabis.
  case container // = 3

  /// Tools to produce fire to consume cannabis.
  case lighter // = 4

  /// Specific clothing value for t-shirts.
  case tshirt // = 5

  /// Specific clothing value for sweatshirts.
  case hoodie // = 6

  /// Specific clothing value for hats.
  case hat // = 7
  case UNRECOGNIZED(Int)

  public init() {
    self = .unspecifiedMerchandise
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecifiedMerchandise
    case 1: self = .clothing
    case 2: self = .glassware
    case 3: self = .container
    case 4: self = .lighter
    case 5: self = .tshirt
    case 6: self = .hoodie
    case 7: self = .hat
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unspecifiedMerchandise: return 0
    case .clothing: return 1
    case .glassware: return 2
    case .container: return 3
    case .lighter: return 4
    case .tshirt: return 5
    case .hoodie: return 6
    case .hat: return 7
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Products_MerchandiseType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Products_MerchandiseType] = [
    .unspecifiedMerchandise,
    .clothing,
    .glassware,
    .container,
    .lighter,
    .tshirt,
    .hoodie,
    .hat,
  ]
}

#endif  // swift(>=4.2)

/// Flags that may be applied specifically to merchandise items.
public enum Opencannabis_Products_MerchandiseFlag: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// No flags specified.
  case noMerchandiseFlags // = 0

  /// This item requires that a user have a valid medical recommendation for cannabis.
  case medicalOnly // = 1

  /// This item is branded for the partner and should be promoted as such.
  case brandSwag // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .noMerchandiseFlags
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .noMerchandiseFlags
    case 1: self = .medicalOnly
    case 2: self = .brandSwag
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .noMerchandiseFlags: return 0
    case .medicalOnly: return 1
    case .brandSwag: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Products_MerchandiseFlag: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Products_MerchandiseFlag] = [
    .noMerchandiseFlags,
    .medicalOnly,
    .brandSwag,
  ]
}

#endif  // swift(>=4.2)

/// Specifies an item of merchandise, that does not contain cannabis, but is sold anyway by a dispensary, such as branded
/// clothing, containers, lighters, and other random stuff.
public struct Opencannabis_Products_Merchandise {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Product key uniquely identifying this merchandise item.
  public var key: Opencannabis_Base_ProductKey {
    get {return _storage._key ?? Opencannabis_Base_ProductKey()}
    set {_uniqueStorage()._key = newValue}
  }
  /// Returns true if `key` has been explicitly set.
  public var hasKey: Bool {return _storage._key != nil}
  /// Clears the value of `key`. Subsequent reads from it will return its default value.
  public mutating func clearKey() {_uniqueStorage()._key = nil}

  /// Sub-category for this merchandise item, if known.
  public var type: Opencannabis_Products_MerchandiseType {
    get {return _storage._type}
    set {_uniqueStorage()._type = newValue}
  }

  /// Flags for this merchandise item.
  public var flags: [Opencannabis_Products_MerchandiseFlag] {
    get {return _storage._flags}
    set {_uniqueStorage()._flags = newValue}
  }

  /// Content about this merchandise item.
  public var product: Opencannabis_Content_ProductContent {
    get {return _storage._product ?? Opencannabis_Content_ProductContent()}
    set {_uniqueStorage()._product = newValue}
  }
  /// Returns true if `product` has been explicitly set.
  public var hasProduct: Bool {return _storage._product != nil}
  /// Clears the value of `product`. Subsequent reads from it will return its default value.
  public mutating func clearProduct() {_uniqueStorage()._product = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.products"

extension Opencannabis_Products_MerchandiseType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNSPECIFIED_MERCHANDISE"),
    1: .same(proto: "CLOTHING"),
    2: .same(proto: "GLASSWARE"),
    3: .same(proto: "CONTAINER"),
    4: .same(proto: "LIGHTER"),
    5: .same(proto: "TSHIRT"),
    6: .same(proto: "HOODIE"),
    7: .same(proto: "HAT"),
  ]
}

extension Opencannabis_Products_MerchandiseFlag: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NO_MERCHANDISE_FLAGS"),
    1: .same(proto: "MEDICAL_ONLY"),
    2: .same(proto: "BRAND_SWAG"),
  ]
}

extension Opencannabis_Products_Merchandise: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Merchandise"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "type"),
    3: .same(proto: "flags"),
    4: .same(proto: "product"),
  ]

  fileprivate class _StorageClass {
    var _key: Opencannabis_Base_ProductKey? = nil
    var _type: Opencannabis_Products_MerchandiseType = .unspecifiedMerchandise
    var _flags: [Opencannabis_Products_MerchandiseFlag] = []
    var _product: Opencannabis_Content_ProductContent? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _key = source._key
      _type = source._type
      _flags = source._flags
      _product = source._product
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._key)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._type)
        case 3: try decoder.decodeRepeatedEnumField(value: &_storage._flags)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._product)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._key {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if _storage._type != .unspecifiedMerchandise {
        try visitor.visitSingularEnumField(value: _storage._type, fieldNumber: 2)
      }
      if !_storage._flags.isEmpty {
        try visitor.visitPackedEnumField(value: _storage._flags, fieldNumber: 3)
      }
      if let v = _storage._product {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Products_Merchandise, rhs: Opencannabis_Products_Merchandise) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._key != rhs_storage._key {return false}
        if _storage._type != rhs_storage._type {return false}
        if _storage._flags != rhs_storage._flags {return false}
        if _storage._product != rhs_storage._product {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
