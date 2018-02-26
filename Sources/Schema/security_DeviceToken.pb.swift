// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: security/DeviceToken.proto
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

/// Specifies an auth token issued to a device, or some other machine-based actor.
public struct Bloombox_Schema_Security_DeviceToken {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Authentication token, usable by this device to authenticate to the API, etc.
  public var token: Bloombox_Schema_Security_AuthToken {
    get {return _storage._token ?? Bloombox_Schema_Security_AuthToken()}
    set {_uniqueStorage()._token = newValue}
  }
  /// Returns true if `token` has been explicitly set.
  public var hasToken: Bool {return _storage._token != nil}
  /// Clears the value of `token`. Subsequent reads from it will return its default value.
  public mutating func clearToken() {_storage._token = nil}

  /// Information passed from the server to this device, including credentials, stateful flags, and so on.
  public var device: Opencannabis_Device_Device {
    get {return _storage._device ?? Opencannabis_Device_Device()}
    set {_uniqueStorage()._device = newValue}
  }
  /// Returns true if `device` has been explicitly set.
  public var hasDevice: Bool {return _storage._device != nil}
  /// Clears the value of `device`. Subsequent reads from it will return its default value.
  public mutating func clearDevice() {_storage._device = nil}

  /// Issuance timestamp for this device token.
  public var issued: Opencannabis_Temporal_Instant {
    get {return _storage._issued ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._issued = newValue}
  }
  /// Returns true if `issued` has been explicitly set.
  public var hasIssued: Bool {return _storage._issued != nil}
  /// Clears the value of `issued`. Subsequent reads from it will return its default value.
  public mutating func clearIssued() {_storage._issued = nil}

  /// Expiry timestamp for this device token.
  public var expires: Opencannabis_Temporal_Instant {
    get {return _storage._expires ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._expires = newValue}
  }
  /// Returns true if `expires` has been explicitly set.
  public var hasExpires: Bool {return _storage._expires != nil}
  /// Clears the value of `expires`. Subsequent reads from it will return its default value.
  public mutating func clearExpires() {_storage._expires = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.security"

extension Bloombox_Schema_Security_DeviceToken: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".DeviceToken"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "token"),
    2: .same(proto: "device"),
    3: .same(proto: "issued"),
    4: .same(proto: "expires"),
  ]

  fileprivate class _StorageClass {
    var _token: Bloombox_Schema_Security_AuthToken? = nil
    var _device: Opencannabis_Device_Device? = nil
    var _issued: Opencannabis_Temporal_Instant? = nil
    var _expires: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _token = source._token
      _device = source._device
      _issued = source._issued
      _expires = source._expires
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._token)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._device)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._issued)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._expires)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._token {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._device {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._issued {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._expires {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Security_DeviceToken) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._token != other_storage._token {return false}
        if _storage._device != other_storage._device {return false}
        if _storage._issued != other_storage._issued {return false}
        if _storage._expires != other_storage._expires {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
