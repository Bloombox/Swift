// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proximity/BluetoothBeacon.proto
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

/// Specifies a Blutooth beacon signal, detected or emitted by a BLE device.
public struct Opencannabis_Proximity_BluetoothBeacon {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// UUID for the device, as observed or broadcasted.
  public var uuid: String {
    get {return _storage._uuid}
    set {_uniqueStorage()._uuid = newValue}
  }

  /// 'Major' value in the BLE signal.
  public var major: UInt32 {
    get {return _storage._major}
    set {_uniqueStorage()._major = newValue}
  }

  /// 'Minor' value in the BLE signal.
  public var minor: UInt32 {
    get {return _storage._minor}
    set {_uniqueStorage()._minor = newValue}
  }

  /// Timestamp for when this beacon was witnessed.
  public var seen: Opencannabis_Temporal_Instant {
    get {return _storage._seen ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._seen = newValue}
  }
  /// Returns true if `seen` has been explicitly set.
  public var hasSeen: Bool {return _storage._seen != nil}
  /// Clears the value of `seen`. Subsequent reads from it will return its default value.
  public mutating func clearSeen() {_storage._seen = nil}

  /// Location of the emitting or reporting (receiving) beacon.
  public var location: Opencannabis_Geo_Location {
    get {return _storage._location ?? Opencannabis_Geo_Location()}
    set {_uniqueStorage()._location = newValue}
  }
  /// Returns true if `location` has been explicitly set.
  public var hasLocation: Bool {return _storage._location != nil}
  /// Clears the value of `location`. Subsequent reads from it will return its default value.
  public mutating func clearLocation() {_storage._location = nil}

  /// Estimate as to the distance accuracy of this beacon.
  public var accuracy: Opencannabis_Geo_LocationAccuracy {
    get {return _storage._accuracy ?? Opencannabis_Geo_LocationAccuracy()}
    set {_uniqueStorage()._accuracy = newValue}
  }
  /// Returns true if `accuracy` has been explicitly set.
  public var hasAccuracy: Bool {return _storage._accuracy != nil}
  /// Clears the value of `accuracy`. Subsequent reads from it will return its default value.
  public mutating func clearAccuracy() {_storage._accuracy = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.proximity"

extension Opencannabis_Proximity_BluetoothBeacon: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BluetoothBeacon"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uuid"),
    2: .same(proto: "major"),
    3: .same(proto: "minor"),
    4: .same(proto: "seen"),
    5: .same(proto: "location"),
    6: .same(proto: "accuracy"),
  ]

  fileprivate class _StorageClass {
    var _uuid: String = String()
    var _major: UInt32 = 0
    var _minor: UInt32 = 0
    var _seen: Opencannabis_Temporal_Instant? = nil
    var _location: Opencannabis_Geo_Location? = nil
    var _accuracy: Opencannabis_Geo_LocationAccuracy? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _uuid = source._uuid
      _major = source._major
      _minor = source._minor
      _seen = source._seen
      _location = source._location
      _accuracy = source._accuracy
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
        case 2: try decoder.decodeSingularUInt32Field(value: &_storage._major)
        case 3: try decoder.decodeSingularUInt32Field(value: &_storage._minor)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._seen)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._location)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._accuracy)
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
      if _storage._major != 0 {
        try visitor.visitSingularUInt32Field(value: _storage._major, fieldNumber: 2)
      }
      if _storage._minor != 0 {
        try visitor.visitSingularUInt32Field(value: _storage._minor, fieldNumber: 3)
      }
      if let v = _storage._seen {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._location {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._accuracy {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Opencannabis_Proximity_BluetoothBeacon) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._uuid != other_storage._uuid {return false}
        if _storage._major != other_storage._major {return false}
        if _storage._minor != other_storage._minor {return false}
        if _storage._seen != other_storage._seen {return false}
        if _storage._location != other_storage._location {return false}
        if _storage._accuracy != other_storage._accuracy {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
