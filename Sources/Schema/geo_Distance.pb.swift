// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: geo/Distance.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Describes geography-related models, specifically with regard to distances between two points.

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

/// Enumeration of recognized units of distance.
public enum Opencannabis_Geo_DistanceUnit: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Distance in meters.
  case meters // = 0

  /// Distance in inches.
  case inches // = 1

  /// Distance in feet.
  case feet // = 2

  /// Distance in millimeters.
  case millimeters // = 3

  /// Distance in centimeters.
  case centimeters // = 4

  /// Distance in kilometers.
  case kilometers // = 5

  /// Distance in miles.
  case miles // = 6
  case UNRECOGNIZED(Int)

  public init() {
    self = .meters
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .meters
    case 1: self = .inches
    case 2: self = .feet
    case 3: self = .millimeters
    case 4: self = .centimeters
    case 5: self = .kilometers
    case 6: self = .miles
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .meters: return 0
    case .inches: return 1
    case .feet: return 2
    case .millimeters: return 3
    case .centimeters: return 4
    case .kilometers: return 5
    case .miles: return 6
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Geo_DistanceUnit: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Geo_DistanceUnit] = [
    .meters,
    .inches,
    .feet,
    .millimeters,
    .centimeters,
    .kilometers,
    .miles,
  ]
}

#endif  // swift(>=4.2)

/// Represents an estimate of location accuracy.
public struct Opencannabis_Geo_LocationAccuracy {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies whether this accuracy rating is an estimate.
  public var estimate: Bool {
    get {return _storage._estimate}
    set {_uniqueStorage()._estimate = newValue}
  }

  /// Distance value for the accuracy specified.
  public var value: Opencannabis_Geo_DistanceValue {
    get {return _storage._value ?? Opencannabis_Geo_DistanceValue()}
    set {_uniqueStorage()._value = newValue}
  }
  /// Returns true if `value` has been explicitly set.
  public var hasValue: Bool {return _storage._value != nil}
  /// Clears the value of `value`. Subsequent reads from it will return its default value.
  public mutating func clearValue() {_uniqueStorage()._value = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies a single distance value.
public struct Opencannabis_Geo_DistanceValue {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the unit of measurement employed for this distance.
  public var unit: Opencannabis_Geo_DistanceUnit = .meters

  /// Actual value.
  public var value: Double = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies a distance between two locations.
public struct Opencannabis_Geo_Distance {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies whether this distance is an estimate.
  public var estimate: Bool {
    get {return _storage._estimate}
    set {_uniqueStorage()._estimate = newValue}
  }

  /// Specifies the accuracy estimate for the distance values, if known.
  public var accuracy: Opencannabis_Geo_LocationAccuracy {
    get {return _storage._accuracy ?? Opencannabis_Geo_LocationAccuracy()}
    set {_uniqueStorage()._accuracy = newValue}
  }
  /// Returns true if `accuracy` has been explicitly set.
  public var hasAccuracy: Bool {return _storage._accuracy != nil}
  /// Clears the value of `accuracy`. Subsequent reads from it will return its default value.
  public mutating func clearAccuracy() {_uniqueStorage()._accuracy = nil}

  /// Specifies the unit of measurement for a location accuracy estimate.
  public var unit: Opencannabis_Geo_DistanceUnit {
    get {return _storage._unit}
    set {_uniqueStorage()._unit = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.geo"

extension Opencannabis_Geo_DistanceUnit: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "METERS"),
    1: .same(proto: "INCHES"),
    2: .same(proto: "FEET"),
    3: .same(proto: "MILLIMETERS"),
    4: .same(proto: "CENTIMETERS"),
    5: .same(proto: "KILOMETERS"),
    6: .same(proto: "MILES"),
  ]
}

extension Opencannabis_Geo_LocationAccuracy: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".LocationAccuracy"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "estimate"),
    2: .same(proto: "value"),
  ]

  fileprivate class _StorageClass {
    var _estimate: Bool = false
    var _value: Opencannabis_Geo_DistanceValue? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _estimate = source._estimate
      _value = source._value
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
        case 1: try decoder.decodeSingularBoolField(value: &_storage._estimate)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._value)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._estimate != false {
        try visitor.visitSingularBoolField(value: _storage._estimate, fieldNumber: 1)
      }
      if let v = _storage._value {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Geo_LocationAccuracy, rhs: Opencannabis_Geo_LocationAccuracy) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._estimate != rhs_storage._estimate {return false}
        if _storage._value != rhs_storage._value {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Geo_DistanceValue: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".DistanceValue"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "unit"),
    3: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.unit)
      case 3: try decoder.decodeSingularDoubleField(value: &self.value)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.unit != .meters {
      try visitor.visitSingularEnumField(value: self.unit, fieldNumber: 1)
    }
    if self.value != 0 {
      try visitor.visitSingularDoubleField(value: self.value, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Geo_DistanceValue, rhs: Opencannabis_Geo_DistanceValue) -> Bool {
    if lhs.unit != rhs.unit {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Geo_Distance: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Distance"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "estimate"),
    2: .same(proto: "accuracy"),
    3: .same(proto: "unit"),
  ]

  fileprivate class _StorageClass {
    var _estimate: Bool = false
    var _accuracy: Opencannabis_Geo_LocationAccuracy? = nil
    var _unit: Opencannabis_Geo_DistanceUnit = .meters

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _estimate = source._estimate
      _accuracy = source._accuracy
      _unit = source._unit
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
        case 1: try decoder.decodeSingularBoolField(value: &_storage._estimate)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._accuracy)
        case 3: try decoder.decodeSingularEnumField(value: &_storage._unit)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._estimate != false {
        try visitor.visitSingularBoolField(value: _storage._estimate, fieldNumber: 1)
      }
      if let v = _storage._accuracy {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if _storage._unit != .meters {
        try visitor.visitSingularEnumField(value: _storage._unit, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Geo_Distance, rhs: Opencannabis_Geo_Distance) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._estimate != rhs_storage._estimate {return false}
        if _storage._accuracy != rhs_storage._accuracy {return false}
        if _storage._unit != rhs_storage._unit {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
