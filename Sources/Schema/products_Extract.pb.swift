// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: products/Extract.proto
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

/// Enumerates types of extracted oleoresin cannabis products that have known/specified subcategories.
public enum Opencannabis_Products_ExtractType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Uknown, unrecognized, or otherwise unspecified extract type.
  case unspecifiedExtract // = 0

  /// Cannabis oil, usually in liquid form.
  case oil // = 1

  /// Cannabis wax - viscous semisolid forms of cannabis oil.
  case wax // = 2

  /// Clear, amber solid cannabis wax.
  case shatter // = 3

  /// Particulate discharge from cannabis flowers that contains THC or other cannabinoids.
  case kief // = 4

  /// Fully extracted and concentrated cannabis resin.
  case hash // = 5

  /// Extracted cannabis that is kept at freezing temperatures, rather than dried.
  case liveResin // = 6

  /// Heated and terpene-vaporized live resin.
  case rosin // = 7

  /// Similar process to shatter, but with higher-terpene output and a softer, cheese-like consistency.
  case crumble // = 8

  /// THC distillate, often with extracted terpene content added.
  case sauce // = 9

  /// Raw THC or terpene distillate, in dust or powder form.
  case sugar // = 10
  case UNRECOGNIZED(Int)

  public init() {
    self = .unspecifiedExtract
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecifiedExtract
    case 1: self = .oil
    case 2: self = .wax
    case 3: self = .shatter
    case 4: self = .kief
    case 5: self = .hash
    case 6: self = .liveResin
    case 7: self = .rosin
    case 8: self = .crumble
    case 9: self = .sauce
    case 10: self = .sugar
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unspecifiedExtract: return 0
    case .oil: return 1
    case .wax: return 2
    case .shatter: return 3
    case .kief: return 4
    case .hash: return 5
    case .liveResin: return 6
    case .rosin: return 7
    case .crumble: return 8
    case .sauce: return 9
    case .sugar: return 10
    case .UNRECOGNIZED(let i): return i
    }
  }

}

/// Specifies flags that may specifically be applied to an extracted cannabis product.
public enum Opencannabis_Products_ExtractFlag: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Specifies that no flags are set.
  case noExtractFlags // = 0

  /// Specifies that this extract was made with a solventless process.
  case solventless // = 1
  case UNRECOGNIZED(Int)

  public init() {
    self = .noExtractFlags
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .noExtractFlags
    case 1: self = .solventless
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .noExtractFlags: return 0
    case .solventless: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

/// Specifies an extracted cannabis product, whereby cannabis plant material has been reduced to a more potent and
/// concentrated form by some process.
public struct Opencannabis_Products_Extract {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Product key that uniquely identifies this cannabis extract item.
  public var key: Opencannabis_Base_ProductKey {
    get {return _storage._key ?? Opencannabis_Base_ProductKey()}
    set {_uniqueStorage()._key = newValue}
  }
  /// Returns true if `key` has been explicitly set.
  public var hasKey: Bool {return _storage._key != nil}
  /// Clears the value of `key`. Subsequent reads from it will return its default value.
  public mutating func clearKey() {_storage._key = nil}

  /// Specific type of extract being described.
  public var type: Opencannabis_Products_ExtractType {
    get {return _storage._type}
    set {_uniqueStorage()._type = newValue}
  }

  /// Specifies flags that may specifically be applied to this extracted cannabis item.
  public var flag: [Opencannabis_Products_ExtractFlag] {
    get {return _storage._flag}
    set {_uniqueStorage()._flag = newValue}
  }

  /// Flower that was used to produce this extract.
  public var flower: Opencannabis_Base_ProductReference {
    get {return _storage._flower ?? Opencannabis_Base_ProductReference()}
    set {_uniqueStorage()._flower = newValue}
  }
  /// Returns true if `flower` has been explicitly set.
  public var hasFlower: Bool {return _storage._flower != nil}
  /// Clears the value of `flower`. Subsequent reads from it will return its default value.
  public mutating func clearFlower() {_storage._flower = nil}

  /// Product content about this extracted cannabis item.
  public var product: Opencannabis_Content_ProductContent {
    get {return _storage._product ?? Opencannabis_Content_ProductContent()}
    set {_uniqueStorage()._product = newValue}
  }
  /// Returns true if `product` has been explicitly set.
  public var hasProduct: Bool {return _storage._product != nil}
  /// Clears the value of `product`. Subsequent reads from it will return its default value.
  public mutating func clearProduct() {_storage._product = nil}

  /// Materials and handling data attached to this extracted cannabis item.
  public var material: Opencannabis_Content_MaterialsData {
    get {return _storage._material ?? Opencannabis_Content_MaterialsData()}
    set {_uniqueStorage()._material = newValue}
  }
  /// Returns true if `material` has been explicitly set.
  public var hasMaterial: Bool {return _storage._material != nil}
  /// Clears the value of `material`. Subsequent reads from it will return its default value.
  public mutating func clearMaterial() {_storage._material = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.products"

extension Opencannabis_Products_ExtractType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNSPECIFIED_EXTRACT"),
    1: .same(proto: "OIL"),
    2: .same(proto: "WAX"),
    3: .same(proto: "SHATTER"),
    4: .same(proto: "KIEF"),
    5: .same(proto: "HASH"),
    6: .same(proto: "LIVE_RESIN"),
    7: .same(proto: "ROSIN"),
    8: .same(proto: "CRUMBLE"),
    9: .same(proto: "SAUCE"),
    10: .same(proto: "SUGAR"),
  ]
}

extension Opencannabis_Products_ExtractFlag: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NO_EXTRACT_FLAGS"),
    1: .same(proto: "SOLVENTLESS"),
  ]
}

extension Opencannabis_Products_Extract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Extract"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "type"),
    3: .same(proto: "flag"),
    4: .same(proto: "flower"),
    5: .same(proto: "product"),
    6: .same(proto: "material"),
  ]

  fileprivate class _StorageClass {
    var _key: Opencannabis_Base_ProductKey? = nil
    var _type: Opencannabis_Products_ExtractType = .unspecifiedExtract
    var _flag: [Opencannabis_Products_ExtractFlag] = []
    var _flower: Opencannabis_Base_ProductReference? = nil
    var _product: Opencannabis_Content_ProductContent? = nil
    var _material: Opencannabis_Content_MaterialsData? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _key = source._key
      _type = source._type
      _flag = source._flag
      _flower = source._flower
      _product = source._product
      _material = source._material
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
        case 3: try decoder.decodeRepeatedEnumField(value: &_storage._flag)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._flower)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._product)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._material)
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
      if _storage._type != .unspecifiedExtract {
        try visitor.visitSingularEnumField(value: _storage._type, fieldNumber: 2)
      }
      if !_storage._flag.isEmpty {
        try visitor.visitPackedEnumField(value: _storage._flag, fieldNumber: 3)
      }
      if let v = _storage._flower {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._product {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._material {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Opencannabis_Products_Extract) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._key != other_storage._key {return false}
        if _storage._type != other_storage._type {return false}
        if _storage._flag != other_storage._flag {return false}
        if _storage._flower != other_storage._flower {return false}
        if _storage._product != other_storage._product {return false}
        if _storage._material != other_storage._material {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
