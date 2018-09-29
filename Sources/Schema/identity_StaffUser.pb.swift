// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: identity/StaffUser.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies the notion of a user who is also an employee or qualified member of staff.

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

/// Specifies a staff user, logged in via POS authorization.
public struct Bloombox_Schema_Identity_StaffUser: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".StaffUser"

  /// Display name for the logged-in user.
  public var name: Opencannabis_Person_Name {
    get {return _storage._name ?? Opencannabis_Person_Name()}
    set {_uniqueStorage()._name = newValue}
  }
  /// Returns true if `name` has been explicitly set.
  public var hasName: Bool {return _storage._name != nil}
  /// Clears the value of `name`. Subsequent reads from it will return its default value.
  public mutating func clearName() {_storage._name = nil}

  /// Avatar/portrait for the logged-in user.
  public var portrait: Opencannabis_Media_MediaKey {
    get {return _storage._portrait ?? Opencannabis_Media_MediaKey()}
    set {_uniqueStorage()._portrait = newValue}
  }
  /// Returns true if `portrait` has been explicitly set.
  public var hasPortrait: Bool {return _storage._portrait != nil}
  /// Clears the value of `portrait`. Subsequent reads from it will return its default value.
  public mutating func clearPortrait() {_storage._portrait = nil}

  /// Identity account used to authorize access to the point-of-sale.
  public var identity: Bloombox_Schema_Identity_UserIdentity {
    get {return _storage._identity ?? Bloombox_Schema_Identity_UserIdentity()}
    set {_uniqueStorage()._identity = newValue}
  }
  /// Returns true if `identity` has been explicitly set.
  public var hasIdentity: Bool {return _storage._identity != nil}
  /// Clears the value of `identity`. Subsequent reads from it will return its default value.
  public mutating func clearIdentity() {_storage._identity = nil}

  /// Flag to indicate whether the user needs to setup their POS profile.
  public var setup: Bool {
    get {return _storage._setup}
    set {_uniqueStorage()._setup = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 2: try decoder.decodeSingularMessageField(value: &_storage._name)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._portrait)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._identity)
        case 5: try decoder.decodeSingularBoolField(value: &_storage._setup)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._name {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._portrait {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._identity {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if _storage._setup != false {
        try visitor.visitSingularBoolField(value: _storage._setup, fieldNumber: 5)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.identity"

extension Bloombox_Schema_Identity_StaffUser: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .same(proto: "name"),
    3: .same(proto: "portrait"),
    4: .same(proto: "identity"),
    5: .same(proto: "setup"),
  ]

  fileprivate class _StorageClass {
    var _name: Opencannabis_Person_Name? = nil
    var _portrait: Opencannabis_Media_MediaKey? = nil
    var _identity: Bloombox_Schema_Identity_UserIdentity? = nil
    var _setup: Bool = false

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _name = source._name
      _portrait = source._portrait
      _identity = source._identity
      _setup = source._setup
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Identity_StaffUser) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._name != other_storage._name {return false}
        if _storage._portrait != other_storage._portrait {return false}
        if _storage._identity != other_storage._identity {return false}
        if _storage._setup != other_storage._setup {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}