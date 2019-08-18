// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: structs/pricing/SaleDescriptor.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Provides a structure and definitions for a "sale" (Discounted Purchase). Enumerates types of sales.

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

/// Enumerates the various types of "sales" I.E. a retail purchase made with a discount of some amount applied.
public enum Opencannabis_Structs_Pricing_SaleType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// A reduction of an item or the total by a percentage. I.E. "20% off".
  case percentageReduction // = 0

  /// The reduction of an item or total by a flat value. I.E. "$5 off".
  case valueReduction // = 1

  /// A buy-one-get-one discount. Some discounted amount, applicable to the second item bought.
  case bogo // = 2

  /// A discount for being a frequent or returning customer.
  case loyalty // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .percentageReduction
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .percentageReduction
    case 1: self = .valueReduction
    case 2: self = .bogo
    case 3: self = .loyalty
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .percentageReduction: return 0
    case .valueReduction: return 1
    case .bogo: return 2
    case .loyalty: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Structs_Pricing_SaleType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Structs_Pricing_SaleType] = [
    .percentageReduction,
    .valueReduction,
    .bogo,
    .loyalty,
  ]
}

#endif  // swift(>=4.2)

/// A discount of a percentage. I.E, "20% off".
public struct Opencannabis_Structs_Pricing_PercentageDiscount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Represents the discount percentage.
  public var discount: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// A buy-one-get-one discount. Some discounted amount, applicable to the second item bought. First item is usually full
/// price. Can be applied in various ways. I.E. a customer purchases two items for full price and the third is discounted
/// .
public struct Opencannabis_Structs_Pricing_BOGODiscount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The discount code used to trigger the discount.
  public var trigger: UInt32 = 0

  /// The value for the discount.
  public var reward: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// A discount for returning to a partner or partner location multiple times or for having been a member for a certain
/// amount of time or having displayed a certain amount of buying power at a partner or partner location.
public struct Opencannabis_Structs_Pricing_LoyaltyDiscount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The discount code used to trigger the discount.
  public var trigger: UInt32 = 0

  /// The value for the discount.
  public var reward: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// A description of the sale, the parameters to invoke the sale, its valid dates, and its type.
public struct Opencannabis_Structs_Pricing_SaleDescriptor {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Sale metadata.
  public var type: Opencannabis_Structs_Pricing_SaleType {
    get {return _storage._type}
    set {_uniqueStorage()._type = newValue}
  }

  /// Represents the date that the discount can be applied.
  public var effective: Opencannabis_Temporal_Instant {
    get {return _storage._effective ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._effective = newValue}
  }
  /// Returns true if `effective` has been explicitly set.
  public var hasEffective: Bool {return _storage._effective != nil}
  /// Clears the value of `effective`. Subsequent reads from it will return its default value.
  public mutating func clearEffective() {_uniqueStorage()._effective = nil}

  /// Represents the final date that the discount can be applied.
  public var expiration: Opencannabis_Temporal_Instant {
    get {return _storage._expiration ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._expiration = newValue}
  }
  /// Returns true if `expiration` has been explicitly set.
  public var hasExpiration: Bool {return _storage._expiration != nil}
  /// Clears the value of `expiration`. Subsequent reads from it will return its default value.
  public mutating func clearExpiration() {_uniqueStorage()._expiration = nil}

  /// Sale amount and trigger properties.
  public var sale: OneOf_Sale? {
    get {return _storage._sale}
    set {_uniqueStorage()._sale = newValue}
  }

  /// Represents the percentage value to be discounted.
  public var percentageOff: Opencannabis_Structs_Pricing_PercentageDiscount {
    get {
      if case .percentageOff(let v)? = _storage._sale {return v}
      return Opencannabis_Structs_Pricing_PercentageDiscount()
    }
    set {_uniqueStorage()._sale = .percentageOff(newValue)}
  }

  /// Represents that the discount is buy one get one.
  public var bogo: Opencannabis_Structs_Pricing_BOGODiscount {
    get {
      if case .bogo(let v)? = _storage._sale {return v}
      return Opencannabis_Structs_Pricing_BOGODiscount()
    }
    set {_uniqueStorage()._sale = .bogo(newValue)}
  }

  /// Represents that the discount is using accrued loyalty rewards.
  public var loyalty: Opencannabis_Structs_Pricing_LoyaltyDiscount {
    get {
      if case .loyalty(let v)? = _storage._sale {return v}
      return Opencannabis_Structs_Pricing_LoyaltyDiscount()
    }
    set {_uniqueStorage()._sale = .loyalty(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Sale amount and trigger properties.
  public enum OneOf_Sale: Equatable {
    /// Represents the percentage value to be discounted.
    case percentageOff(Opencannabis_Structs_Pricing_PercentageDiscount)
    /// Represents that the discount is buy one get one.
    case bogo(Opencannabis_Structs_Pricing_BOGODiscount)
    /// Represents that the discount is using accrued loyalty rewards.
    case loyalty(Opencannabis_Structs_Pricing_LoyaltyDiscount)

  #if !swift(>=4.1)
    public static func ==(lhs: Opencannabis_Structs_Pricing_SaleDescriptor.OneOf_Sale, rhs: Opencannabis_Structs_Pricing_SaleDescriptor.OneOf_Sale) -> Bool {
      switch (lhs, rhs) {
      case (.percentageOff(let l), .percentageOff(let r)): return l == r
      case (.bogo(let l), .bogo(let r)): return l == r
      case (.loyalty(let l), .loyalty(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.structs.pricing"

extension Opencannabis_Structs_Pricing_SaleType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PERCENTAGE_REDUCTION"),
    1: .same(proto: "VALUE_REDUCTION"),
    2: .same(proto: "BOGO"),
    3: .same(proto: "LOYALTY"),
  ]
}

extension Opencannabis_Structs_Pricing_PercentageDiscount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PercentageDiscount"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    20: .same(proto: "discount"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 20: try decoder.decodeSingularUInt32Field(value: &self.discount)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.discount != 0 {
      try visitor.visitSingularUInt32Field(value: self.discount, fieldNumber: 20)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Structs_Pricing_PercentageDiscount, rhs: Opencannabis_Structs_Pricing_PercentageDiscount) -> Bool {
    if lhs.discount != rhs.discount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Structs_Pricing_BOGODiscount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BOGODiscount"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    21: .same(proto: "trigger"),
    22: .same(proto: "reward"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 21: try decoder.decodeSingularUInt32Field(value: &self.trigger)
      case 22: try decoder.decodeSingularUInt32Field(value: &self.reward)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.trigger != 0 {
      try visitor.visitSingularUInt32Field(value: self.trigger, fieldNumber: 21)
    }
    if self.reward != 0 {
      try visitor.visitSingularUInt32Field(value: self.reward, fieldNumber: 22)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Structs_Pricing_BOGODiscount, rhs: Opencannabis_Structs_Pricing_BOGODiscount) -> Bool {
    if lhs.trigger != rhs.trigger {return false}
    if lhs.reward != rhs.reward {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Structs_Pricing_LoyaltyDiscount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".LoyaltyDiscount"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    23: .same(proto: "trigger"),
    24: .same(proto: "reward"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 23: try decoder.decodeSingularUInt32Field(value: &self.trigger)
      case 24: try decoder.decodeSingularUInt32Field(value: &self.reward)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.trigger != 0 {
      try visitor.visitSingularUInt32Field(value: self.trigger, fieldNumber: 23)
    }
    if self.reward != 0 {
      try visitor.visitSingularUInt32Field(value: self.reward, fieldNumber: 24)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Structs_Pricing_LoyaltyDiscount, rhs: Opencannabis_Structs_Pricing_LoyaltyDiscount) -> Bool {
    if lhs.trigger != rhs.trigger {return false}
    if lhs.reward != rhs.reward {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Structs_Pricing_SaleDescriptor: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SaleDescriptor"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "effective"),
    3: .same(proto: "expiration"),
    4: .standard(proto: "percentage_off"),
    5: .same(proto: "bogo"),
    6: .same(proto: "loyalty"),
  ]

  fileprivate class _StorageClass {
    var _type: Opencannabis_Structs_Pricing_SaleType = .percentageReduction
    var _effective: Opencannabis_Temporal_Instant? = nil
    var _expiration: Opencannabis_Temporal_Instant? = nil
    var _sale: Opencannabis_Structs_Pricing_SaleDescriptor.OneOf_Sale?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _type = source._type
      _effective = source._effective
      _expiration = source._expiration
      _sale = source._sale
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
        case 1: try decoder.decodeSingularEnumField(value: &_storage._type)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._effective)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._expiration)
        case 4:
          var v: Opencannabis_Structs_Pricing_PercentageDiscount?
          if let current = _storage._sale {
            try decoder.handleConflictingOneOf()
            if case .percentageOff(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._sale = .percentageOff(v)}
        case 5:
          var v: Opencannabis_Structs_Pricing_BOGODiscount?
          if let current = _storage._sale {
            try decoder.handleConflictingOneOf()
            if case .bogo(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._sale = .bogo(v)}
        case 6:
          var v: Opencannabis_Structs_Pricing_LoyaltyDiscount?
          if let current = _storage._sale {
            try decoder.handleConflictingOneOf()
            if case .loyalty(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._sale = .loyalty(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._type != .percentageReduction {
        try visitor.visitSingularEnumField(value: _storage._type, fieldNumber: 1)
      }
      if let v = _storage._effective {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._expiration {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      switch _storage._sale {
      case .percentageOff(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      case .bogo(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      case .loyalty(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Structs_Pricing_SaleDescriptor, rhs: Opencannabis_Structs_Pricing_SaleDescriptor) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._type != rhs_storage._type {return false}
        if _storage._effective != rhs_storage._effective {return false}
        if _storage._expiration != rhs_storage._expiration {return false}
        if _storage._sale != rhs_storage._sale {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
