// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: identity/industry/POSStaffSettings.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies point-of-sale settings personal to a user, regardless of partner/location assignment for the device or
/// access rights for the authorized user.

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

/// Settings for point-of-sale devices, when this user is the active authorized user and establishes a valid, authorized
/// point-of-sale session.
public struct Bloombox_Identity_Industry_POSStaffSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Point-of-sale authentication challenge. Stores a hashed and salted pre-image with which to compute a match or
  /// rejection of the user's point-of-sale passcode.
  public var challenge: Opencannabis_Crypto_Hash {
    get {return _storage._challenge ?? Opencannabis_Crypto_Hash()}
    set {_uniqueStorage()._challenge = newValue}
  }
  /// Returns true if `challenge` has been explicitly set.
  public var hasChallenge: Bool {return _storage._challenge != nil}
  /// Clears the value of `challenge`. Subsequent reads from it will return its default value.
  public mutating func clearChallenge() {_uniqueStorage()._challenge = nil}

  /// Point-of-sale keycard challenge hash. Stores a hashed and salted pre-image with which to compute a match or
  /// rejection of a keycard scan operation designed to log the user in quickly.
  public var keycard: Opencannabis_Crypto_Hash {
    get {return _storage._keycard ?? Opencannabis_Crypto_Hash()}
    set {_uniqueStorage()._keycard = newValue}
  }
  /// Returns true if `keycard` has been explicitly set.
  public var hasKeycard: Bool {return _storage._keycard != nil}
  /// Clears the value of `keycard`. Subsequent reads from it will return its default value.
  public mutating func clearKeycard() {_uniqueStorage()._keycard = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.identity.industry"

extension Bloombox_Identity_Industry_POSStaffSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".POSStaffSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "challenge"),
    2: .same(proto: "keycard"),
  ]

  fileprivate class _StorageClass {
    var _challenge: Opencannabis_Crypto_Hash? = nil
    var _keycard: Opencannabis_Crypto_Hash? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _challenge = source._challenge
      _keycard = source._keycard
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._challenge)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._keycard)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._challenge {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._keycard {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Identity_Industry_POSStaffSettings, rhs: Bloombox_Identity_Industry_POSStaffSettings) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._challenge != rhs_storage._challenge {return false}
        if _storage._keycard != rhs_storage._keycard {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
