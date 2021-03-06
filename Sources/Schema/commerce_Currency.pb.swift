// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: commerce/Currency.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Currency-related enumerations and models that allow easy specification of cash amounts.

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

/// Specifies known or explicitly supported currency types.
public enum Opencannabis_Commerce_CurrencyType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Fiat-based currency, such as the US Dollar.
  case fiat // = 0

  /// Real currency, such as gold or other raw materials.
  case real // = 1

  /// Crypto-currency, based on unique cryptographic signatures or proof-of-work.
  case crypto // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .fiat
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .fiat
    case 1: self = .real
    case 2: self = .crypto
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .fiat: return 0
    case .real: return 1
    case .crypto: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Commerce_CurrencyType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Commerce_CurrencyType] = [
    .fiat,
    .real,
    .crypto,
  ]
}

#endif  // swift(>=4.2)

/// Specifies known or explicitly supported fiat currencies.
public enum Opencannabis_Commerce_FiatCurrency: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Specifies 'US Dollar' as a currency.
  case usd // = 0

  /// Specifies 'Canadian Dollar' as a currency.
  case cad // = 1

  /// Specifies 'Euro' as a currency.
  case eur // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .usd
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .usd
    case 1: self = .cad
    case 2: self = .eur
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .usd: return 0
    case .cad: return 1
    case .eur: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Commerce_FiatCurrency: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Commerce_FiatCurrency] = [
    .usd,
    .cad,
    .eur,
  ]
}

#endif  // swift(>=4.2)

/// Specifies a value, with a particular currency specification as the unit.
public struct Opencannabis_Commerce_CurrencyValue {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Numeric amount value to specify.
  public var value: Float = 0

  /// Categorical or general type for the specified currency.
  public var type: Opencannabis_Commerce_CurrencyType = .fiat

  /// Specification of the subject currency, by enumerated type, or custom name.
  public var spec: Opencannabis_Commerce_CurrencyValue.OneOf_Spec? = nil

  /// Fiat currency selection for a given currency value.
  public var fiat: Opencannabis_Commerce_FiatCurrency {
    get {
      if case .fiat(let v)? = spec {return v}
      return .usd
    }
    set {spec = .fiat(newValue)}
  }

  /// Custom currency, by name or symbol, for a given currency value.
  public var custom: String {
    get {
      if case .custom(let v)? = spec {return v}
      return String()
    }
    set {spec = .custom(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specification of the subject currency, by enumerated type, or custom name.
  public enum OneOf_Spec: Equatable {
    /// Fiat currency selection for a given currency value.
    case fiat(Opencannabis_Commerce_FiatCurrency)
    /// Custom currency, by name or symbol, for a given currency value.
    case custom(String)

  #if !swift(>=4.1)
    public static func ==(lhs: Opencannabis_Commerce_CurrencyValue.OneOf_Spec, rhs: Opencannabis_Commerce_CurrencyValue.OneOf_Spec) -> Bool {
      switch (lhs, rhs) {
      case (.fiat(let l), .fiat(let r)): return l == r
      case (.custom(let l), .custom(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.commerce"

extension Opencannabis_Commerce_CurrencyType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "FIAT"),
    1: .same(proto: "REAL"),
    2: .same(proto: "CRYPTO"),
  ]
}

extension Opencannabis_Commerce_FiatCurrency: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "USD"),
    1: .same(proto: "CAD"),
    2: .same(proto: "EUR"),
  ]
}

extension Opencannabis_Commerce_CurrencyValue: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CurrencyValue"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
    2: .same(proto: "type"),
    10: .same(proto: "fiat"),
    100: .same(proto: "custom"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularFloatField(value: &self.value)
      case 2: try decoder.decodeSingularEnumField(value: &self.type)
      case 10:
        if self.spec != nil {try decoder.handleConflictingOneOf()}
        var v: Opencannabis_Commerce_FiatCurrency?
        try decoder.decodeSingularEnumField(value: &v)
        if let v = v {self.spec = .fiat(v)}
      case 100:
        if self.spec != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.spec = .custom(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.value != 0 {
      try visitor.visitSingularFloatField(value: self.value, fieldNumber: 1)
    }
    if self.type != .fiat {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 2)
    }
    switch self.spec {
    case .fiat(let v)?:
      try visitor.visitSingularEnumField(value: v, fieldNumber: 10)
    case .custom(let v)?:
      try visitor.visitSingularStringField(value: v, fieldNumber: 100)
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Commerce_CurrencyValue, rhs: Opencannabis_Commerce_CurrencyValue) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.type != rhs.type {return false}
    if lhs.spec != rhs.spec {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
