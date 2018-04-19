// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: security/Token.proto
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

/// Specifies a parsed ID token payload structure.
public struct Bloombox_Schema_Security_IDTokenPayload {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Access token.
  public var token: String = String()

  /// Expiration timestamp for the token.
  public var expiration: UInt64 = 0

  /// Issuance timestamp for the token.
  public var issuance: UInt64 = 0

  /// Subject of the authentication operation.
  public var subject: String = String()

  /// Allowable audience of the authentication operation.
  public var audience: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies an ID token, usually structured as a JWT.
public struct Bloombox_Schema_Security_IDToken {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var payload: OneOf_Payload? {
    get {return _storage._payload}
    set {_uniqueStorage()._payload = newValue}
  }

  /// Encoded ID token.
  public var encoded: String {
    get {
      if case .encoded(let v)? = _storage._payload {return v}
      return String()
    }
    set {_uniqueStorage()._payload = .encoded(newValue)}
  }

  /// Parsed identity JWT payload.
  public var data: Bloombox_Schema_Security_IDTokenPayload {
    get {
      if case .data(let v)? = _storage._payload {return v}
      return Bloombox_Schema_Security_IDTokenPayload()
    }
    set {_uniqueStorage()._payload = .data(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Payload: Equatable {
    /// Encoded ID token.
    case encoded(String)
    /// Parsed identity JWT payload.
    case data(Bloombox_Schema_Security_IDTokenPayload)

    public static func ==(lhs: Bloombox_Schema_Security_IDToken.OneOf_Payload, rhs: Bloombox_Schema_Security_IDToken.OneOf_Payload) -> Bool {
      switch (lhs, rhs) {
      case (.encoded(let l), .encoded(let r)): return l == r
      case (.data(let l), .data(let r)): return l == r
      default: return false
      }
    }
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies a parsed access token structure.
public struct Bloombox_Schema_Security_TokenPayload {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Access token.
  public var token: String = String()

  /// Expiration timestamp for the token.
  public var expiration: UInt64 = 0

  /// Issuance timestamp for the token.
  public var issuance: UInt64 = 0

  /// Scopes being requested, or included in this token.
  public var scope: [Opencannabis_Oauth_AuthorizationScope] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies an authorization token, in the OAuth2 access_token format.
public struct Bloombox_Schema_Security_AuthToken {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var payload: OneOf_Payload? {
    get {return _storage._payload}
    set {_uniqueStorage()._payload = newValue}
  }

  /// Encoded access token.
  public var encoded: String {
    get {
      if case .encoded(let v)? = _storage._payload {return v}
      return String()
    }
    set {_uniqueStorage()._payload = .encoded(newValue)}
  }

  /// Parsed and structured authorization ticket.
  public var ticket: Bloombox_Schema_Security_TokenPayload {
    get {
      if case .ticket(let v)? = _storage._payload {return v}
      return Bloombox_Schema_Security_TokenPayload()
    }
    set {_uniqueStorage()._payload = .ticket(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Payload: Equatable {
    /// Encoded access token.
    case encoded(String)
    /// Parsed and structured authorization ticket.
    case ticket(Bloombox_Schema_Security_TokenPayload)

    public static func ==(lhs: Bloombox_Schema_Security_AuthToken.OneOf_Payload, rhs: Bloombox_Schema_Security_AuthToken.OneOf_Payload) -> Bool {
      switch (lhs, rhs) {
      case (.encoded(let l), .encoded(let r)): return l == r
      case (.ticket(let l), .ticket(let r)): return l == r
      default: return false
      }
    }
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies a full auth flow payload, representing a completed or in-progress identity and authorization/consent flow,
/// performed by a machine on behalf of an end user.
public struct Bloombox_Schema_Security_AuthPayload {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Identity token, asserting the user's identity.
  public var id: Bloombox_Schema_Security_IDToken {
    get {return _storage._id ?? Bloombox_Schema_Security_IDToken()}
    set {_uniqueStorage()._id = newValue}
  }
  /// Returns true if `id` has been explicitly set.
  public var hasID: Bool {return _storage._id != nil}
  /// Clears the value of `id`. Subsequent reads from it will return its default value.
  public mutating func clearID() {_storage._id = nil}

  /// Authorization token, asserting completed consent and authorization status.
  public var auth: Bloombox_Schema_Security_AuthToken {
    get {return _storage._auth ?? Bloombox_Schema_Security_AuthToken()}
    set {_uniqueStorage()._auth = newValue}
  }
  /// Returns true if `auth` has been explicitly set.
  public var hasAuth: Bool {return _storage._auth != nil}
  /// Clears the value of `auth`. Subsequent reads from it will return its default value.
  public mutating func clearAuth() {_storage._auth = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.security"

extension Bloombox_Schema_Security_IDTokenPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".IDTokenPayload"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "token"),
    2: .same(proto: "expiration"),
    3: .same(proto: "issuance"),
    4: .same(proto: "subject"),
    5: .same(proto: "audience"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.token)
      case 2: try decoder.decodeSingularUInt64Field(value: &self.expiration)
      case 3: try decoder.decodeSingularUInt64Field(value: &self.issuance)
      case 4: try decoder.decodeSingularStringField(value: &self.subject)
      case 5: try decoder.decodeSingularStringField(value: &self.audience)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.token.isEmpty {
      try visitor.visitSingularStringField(value: self.token, fieldNumber: 1)
    }
    if self.expiration != 0 {
      try visitor.visitSingularUInt64Field(value: self.expiration, fieldNumber: 2)
    }
    if self.issuance != 0 {
      try visitor.visitSingularUInt64Field(value: self.issuance, fieldNumber: 3)
    }
    if !self.subject.isEmpty {
      try visitor.visitSingularStringField(value: self.subject, fieldNumber: 4)
    }
    if !self.audience.isEmpty {
      try visitor.visitSingularStringField(value: self.audience, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Security_IDTokenPayload) -> Bool {
    if self.token != other.token {return false}
    if self.expiration != other.expiration {return false}
    if self.issuance != other.issuance {return false}
    if self.subject != other.subject {return false}
    if self.audience != other.audience {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Security_IDToken: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".IDToken"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "encoded"),
    2: .same(proto: "data"),
  ]

  fileprivate class _StorageClass {
    var _payload: Bloombox_Schema_Security_IDToken.OneOf_Payload?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _payload = source._payload
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
        case 1:
          if _storage._payload != nil {try decoder.handleConflictingOneOf()}
          var v: String?
          try decoder.decodeSingularStringField(value: &v)
          if let v = v {_storage._payload = .encoded(v)}
        case 2:
          var v: Bloombox_Schema_Security_IDTokenPayload?
          if let current = _storage._payload {
            try decoder.handleConflictingOneOf()
            if case .data(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._payload = .data(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      switch _storage._payload {
      case .encoded(let v)?:
        try visitor.visitSingularStringField(value: v, fieldNumber: 1)
      case .data(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Security_IDToken) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._payload != other_storage._payload {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Security_TokenPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TokenPayload"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "token"),
    2: .same(proto: "expiration"),
    3: .same(proto: "issuance"),
    4: .same(proto: "scope"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.token)
      case 2: try decoder.decodeSingularUInt64Field(value: &self.expiration)
      case 3: try decoder.decodeSingularUInt64Field(value: &self.issuance)
      case 4: try decoder.decodeRepeatedMessageField(value: &self.scope)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.token.isEmpty {
      try visitor.visitSingularStringField(value: self.token, fieldNumber: 1)
    }
    if self.expiration != 0 {
      try visitor.visitSingularUInt64Field(value: self.expiration, fieldNumber: 2)
    }
    if self.issuance != 0 {
      try visitor.visitSingularUInt64Field(value: self.issuance, fieldNumber: 3)
    }
    if !self.scope.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.scope, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Security_TokenPayload) -> Bool {
    if self.token != other.token {return false}
    if self.expiration != other.expiration {return false}
    if self.issuance != other.issuance {return false}
    if self.scope != other.scope {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Security_AuthToken: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AuthToken"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "encoded"),
    2: .same(proto: "ticket"),
  ]

  fileprivate class _StorageClass {
    var _payload: Bloombox_Schema_Security_AuthToken.OneOf_Payload?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _payload = source._payload
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
        case 1:
          if _storage._payload != nil {try decoder.handleConflictingOneOf()}
          var v: String?
          try decoder.decodeSingularStringField(value: &v)
          if let v = v {_storage._payload = .encoded(v)}
        case 2:
          var v: Bloombox_Schema_Security_TokenPayload?
          if let current = _storage._payload {
            try decoder.handleConflictingOneOf()
            if case .ticket(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._payload = .ticket(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      switch _storage._payload {
      case .encoded(let v)?:
        try visitor.visitSingularStringField(value: v, fieldNumber: 1)
      case .ticket(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Security_AuthToken) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._payload != other_storage._payload {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Security_AuthPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AuthPayload"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "auth"),
  ]

  fileprivate class _StorageClass {
    var _id: Bloombox_Schema_Security_IDToken? = nil
    var _auth: Bloombox_Schema_Security_AuthToken? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _auth = source._auth
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._id)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._auth)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._id {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._auth {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Security_AuthPayload) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._id != other_storage._id {return false}
        if _storage._auth != other_storage._auth {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
