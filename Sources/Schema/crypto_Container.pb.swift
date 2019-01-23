// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: crypto/Container.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies container structures for use in cryptographic algorithms and design patterns.

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

/// Carries a payload of arbitrary data, that is supposedly encrypted in some manner.
public struct Opencannabis_Crypto_EncryptedData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Ciphertext, i.e., data contained in the encrypted container.
  public var data: Data {
    get {return _storage._data}
    set {_uniqueStorage()._data = newValue}
  }

  /// Content encoding for the raw ciphertext data specified.
  public var encoding: Opencannabis_Content_Encoding {
    get {return _storage._encoding}
    set {_uniqueStorage()._encoding = newValue}
  }

  /// Compression applied to the cleartext, if applicable and specified.
  public var compression: Opencannabis_Base_Compression {
    get {return _storage._compression ?? Opencannabis_Base_Compression()}
    set {_uniqueStorage()._compression = newValue}
  }
  /// Returns true if `compression` has been explicitly set.
  public var hasCompression: Bool {return _storage._compression != nil}
  /// Clears the value of `compression`. Subsequent reads from it will return its default value.
  public mutating func clearCompression() {_uniqueStorage()._compression = nil}

  /// Cryptographic fingerprint of the ciphertext data. If compression is active, this is applied beforehand.
  public var fingerprint: Opencannabis_Crypto_Hash {
    get {return _storage._fingerprint ?? Opencannabis_Crypto_Hash()}
    set {_uniqueStorage()._fingerprint = newValue}
  }
  /// Returns true if `fingerprint` has been explicitly set.
  public var hasFingerprint: Bool {return _storage._fingerprint != nil}
  /// Clears the value of `fingerprint`. Subsequent reads from it will return its default value.
  public mutating func clearFingerprint() {_uniqueStorage()._fingerprint = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Container that carries an encrypted data payload, and maintains metadata describing it.
public struct Opencannabis_Crypto_EncryptedContainer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the encrypted data payload, or, the content inside this encrypted container.
  public var payload: Opencannabis_Crypto_EncryptedData {
    get {return _storage._payload ?? Opencannabis_Crypto_EncryptedData()}
    set {_uniqueStorage()._payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  public var hasPayload: Bool {return _storage._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  public mutating func clearPayload() {_uniqueStorage()._payload = nil}

  /// Type of keying used to encrypt/decrypt this payload.
  public var keying: Opencannabis_Crypto_KeyType {
    get {return _storage._keying}
    set {_uniqueStorage()._keying = newValue}
  }

  /// Initialization vector value for this container, if applicable according to the algorithm in use.
  public var vector: Opencannabis_Crypto_InitializationVector {
    get {return _storage._vector ?? Opencannabis_Crypto_InitializationVector()}
    set {_uniqueStorage()._vector = newValue}
  }
  /// Returns true if `vector` has been explicitly set.
  public var hasVector: Bool {return _storage._vector != nil}
  /// Clears the value of `vector`. Subsequent reads from it will return its default value.
  public mutating func clearVector() {_uniqueStorage()._vector = nil}

  public var parameters: OneOf_Parameters? {
    get {return _storage._parameters}
    set {_uniqueStorage()._parameters = newValue}
  }

  /// Specifies information regarding the key used to encrypt this container.
  public var key: Opencannabis_Crypto_SymmetricKeyParameters {
    get {
      if case .key(let v)? = _storage._parameters {return v}
      return Opencannabis_Crypto_SymmetricKeyParameters()
    }
    set {_uniqueStorage()._parameters = .key(newValue)}
  }

  /// Specifies information regarding the key pair used to encrypt this container.
  public var keypair: Opencannabis_Crypto_AsymmetricKeypairParameters {
    get {
      if case .keypair(let v)? = _storage._parameters {return v}
      return Opencannabis_Crypto_AsymmetricKeypairParameters()
    }
    set {_uniqueStorage()._parameters = .keypair(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Parameters: Equatable {
    /// Specifies information regarding the key used to encrypt this container.
    case key(Opencannabis_Crypto_SymmetricKeyParameters)
    /// Specifies information regarding the key pair used to encrypt this container.
    case keypair(Opencannabis_Crypto_AsymmetricKeypairParameters)

  #if !swift(>=4.1)
    public static func ==(lhs: Opencannabis_Crypto_EncryptedContainer.OneOf_Parameters, rhs: Opencannabis_Crypto_EncryptedContainer.OneOf_Parameters) -> Bool {
      switch (lhs, rhs) {
      case (.key(let l), .key(let r)): return l == r
      case (.keypair(let l), .keypair(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.crypto"

extension Opencannabis_Crypto_EncryptedData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EncryptedData"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "data"),
    2: .same(proto: "encoding"),
    3: .same(proto: "compression"),
    4: .same(proto: "fingerprint"),
  ]

  fileprivate class _StorageClass {
    var _data: Data = SwiftProtobuf.Internal.emptyData
    var _encoding: Opencannabis_Content_Encoding = .utf8
    var _compression: Opencannabis_Base_Compression? = nil
    var _fingerprint: Opencannabis_Crypto_Hash? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _data = source._data
      _encoding = source._encoding
      _compression = source._compression
      _fingerprint = source._fingerprint
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
        case 1: try decoder.decodeSingularBytesField(value: &_storage._data)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._encoding)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._compression)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._fingerprint)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._data.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._data, fieldNumber: 1)
      }
      if _storage._encoding != .utf8 {
        try visitor.visitSingularEnumField(value: _storage._encoding, fieldNumber: 2)
      }
      if let v = _storage._compression {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._fingerprint {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Crypto_EncryptedData, rhs: Opencannabis_Crypto_EncryptedData) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._data != rhs_storage._data {return false}
        if _storage._encoding != rhs_storage._encoding {return false}
        if _storage._compression != rhs_storage._compression {return false}
        if _storage._fingerprint != rhs_storage._fingerprint {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Crypto_EncryptedContainer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".EncryptedContainer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "payload"),
    2: .same(proto: "keying"),
    3: .same(proto: "vector"),
    4: .same(proto: "key"),
    5: .same(proto: "keypair"),
  ]

  fileprivate class _StorageClass {
    var _payload: Opencannabis_Crypto_EncryptedData? = nil
    var _keying: Opencannabis_Crypto_KeyType = .symmetric
    var _vector: Opencannabis_Crypto_InitializationVector? = nil
    var _parameters: Opencannabis_Crypto_EncryptedContainer.OneOf_Parameters?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _payload = source._payload
      _keying = source._keying
      _vector = source._vector
      _parameters = source._parameters
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._payload)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._keying)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._vector)
        case 4:
          var v: Opencannabis_Crypto_SymmetricKeyParameters?
          if let current = _storage._parameters {
            try decoder.handleConflictingOneOf()
            if case .key(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._parameters = .key(v)}
        case 5:
          var v: Opencannabis_Crypto_AsymmetricKeypairParameters?
          if let current = _storage._parameters {
            try decoder.handleConflictingOneOf()
            if case .keypair(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._parameters = .keypair(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._payload {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if _storage._keying != .symmetric {
        try visitor.visitSingularEnumField(value: _storage._keying, fieldNumber: 2)
      }
      if let v = _storage._vector {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      switch _storage._parameters {
      case .key(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      case .keypair(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Crypto_EncryptedContainer, rhs: Opencannabis_Crypto_EncryptedContainer) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._payload != rhs_storage._payload {return false}
        if _storage._keying != rhs_storage._keying {return false}
        if _storage._vector != rhs_storage._vector {return false}
        if _storage._parameters != rhs_storage._parameters {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}