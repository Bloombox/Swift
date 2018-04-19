// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: oauth/Client.proto
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

/// Enumerates OAuth2 response types supportable by clients.
public enum Opencannabis_Oauth_ResponseType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Unspecified, or unresolved, response type.
  case unspecifiedResponseType // = 0

  /// 'token' response type.
  case token // = 1

  /// 'code' response type.
  case code // = 2

  /// 'id_token' response type.
  case idToken // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .unspecifiedResponseType
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecifiedResponseType
    case 1: self = .token
    case 2: self = .code
    case 3: self = .idToken
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unspecifiedResponseType: return 0
    case .token: return 1
    case .code: return 2
    case .idToken: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

/// Enumerates OAuth2 grant types supportable by clients.
public enum Opencannabis_Oauth_GrantType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Unspecified, or unresolved, grant type.
  case unspecifiedGrantType // = 0

  /// 'authorzation_code' grant type.
  case authorizationCode // = 1

  /// 'refresh_token' grant type.
  case refreshToken // = 2

  /// 'client_credentials' grant type.
  case clientCredentials // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .unspecifiedGrantType
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecifiedGrantType
    case 1: self = .authorizationCode
    case 2: self = .refreshToken
    case 3: self = .clientCredentials
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unspecifiedGrantType: return 0
    case .authorizationCode: return 1
    case .refreshToken: return 2
    case .clientCredentials: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

/// Specifies an OAuth2-client that can perform authorization operations in certain circumstances.
public struct Opencannabis_Oauth_Client {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// ID for this OAuth2 client.
  public var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  /// Secret (password) for this OAuth2 client.
  public var secret: String {
    get {return _storage._secret}
    set {_uniqueStorage()._secret = newValue}
  }

  /// Name of the client.
  public var name: String {
    get {return _storage._name}
    set {_uniqueStorage()._name = newValue}
  }

  /// Contact information for the client.
  public var contact: [String] {
    get {return _storage._contact}
    set {_uniqueStorage()._contact = newValue}
  }

  /// Grant types supported by this client.
  public var grantTypes: [Opencannabis_Oauth_GrantType] {
    get {return _storage._grantTypes}
    set {_uniqueStorage()._grantTypes = newValue}
  }

  /// Attached media item for branding.
  public var branding: Opencannabis_Media_MediaItem {
    get {return _storage._branding ?? Opencannabis_Media_MediaItem()}
    set {_uniqueStorage()._branding = newValue}
  }
  /// Returns true if `branding` has been explicitly set.
  public var hasBranding: Bool {return _storage._branding != nil}
  /// Clears the value of `branding`. Subsequent reads from it will return its default value.
  public mutating func clearBranding() {_storage._branding = nil}

  /// Owner information for this client.
  public var owner: String {
    get {return _storage._owner}
    set {_uniqueStorage()._owner = newValue}
  }

  /// Privacy policy URI.
  public var policy: Opencannabis_Media_MediaItem {
    get {return _storage._policy ?? Opencannabis_Media_MediaItem()}
    set {_uniqueStorage()._policy = newValue}
  }
  /// Returns true if `policy` has been explicitly set.
  public var hasPolicy: Bool {return _storage._policy != nil}
  /// Clears the value of `policy`. Subsequent reads from it will return its default value.
  public mutating func clearPolicy() {_storage._policy = nil}

  /// Terms of Service URI.
  public var terms: Opencannabis_Media_MediaItem {
    get {return _storage._terms ?? Opencannabis_Media_MediaItem()}
    set {_uniqueStorage()._terms = newValue}
  }
  /// Returns true if `terms` has been explicitly set.
  public var hasTerms: Bool {return _storage._terms != nil}
  /// Clears the value of `terms`. Subsequent reads from it will return its default value.
  public mutating func clearTerms() {_storage._terms = nil}

  /// Whether this client is public or not.
  public var `public`: Bool {
    get {return _storage._public}
    set {_uniqueStorage()._public = newValue}
  }

  /// Supported/allowed redirect URIs for this client.
  public var redirectUri: [String] {
    get {return _storage._redirectUri}
    set {_uniqueStorage()._redirectUri = newValue}
  }

  /// Supported OAuth2 response types for this client.
  public var responseType: [Opencannabis_Oauth_ResponseType] {
    get {return _storage._responseType}
    set {_uniqueStorage()._responseType = newValue}
  }

  /// Allowed authorization scopes for this client.
  public var scope: [Opencannabis_Oauth_AuthorizationScope] {
    get {return _storage._scope}
    set {_uniqueStorage()._scope = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Client/auth information regarding the consent application.
public struct Opencannabis_Oauth_Consent {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// ID value of THIS indvidual request.
  public var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  /// Client ID value.
  public var clientID: String {
    get {return _storage._clientID}
    set {_uniqueStorage()._clientID = newValue}
  }

  /// Expires-at value.
  public var expiresAt: Opencannabis_Temporal_Instant {
    get {return _storage._expiresAt ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._expiresAt = newValue}
  }
  /// Returns true if `expiresAt` has been explicitly set.
  public var hasExpiresAt: Bool {return _storage._expiresAt != nil}
  /// Clears the value of `expiresAt`. Subsequent reads from it will return its default value.
  public mutating func clearExpiresAt() {_storage._expiresAt = nil}

  /// Redirect URI.
  public var redirectUri: String {
    get {return _storage._redirectUri}
    set {_uniqueStorage()._redirectUri = newValue}
  }

  /// Requested scopes.
  public var requestedScope: [String] {
    get {return _storage._requestedScope}
    set {_uniqueStorage()._requestedScope = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies a ticket responding to a consent flow.
public struct Opencannabis_Oauth_ConsentTicket {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies client information for this flow.
  public var client: Opencannabis_Oauth_Client {
    get {return _storage._client ?? Opencannabis_Oauth_Client()}
    set {_uniqueStorage()._client = newValue}
  }
  /// Returns true if `client` has been explicitly set.
  public var hasClient: Bool {return _storage._client != nil}
  /// Clears the value of `client`. Subsequent reads from it will return its default value.
  public mutating func clearClient() {_storage._client = nil}

  /// Specifies consent information for this flow.
  public var consent: Opencannabis_Oauth_Consent {
    get {return _storage._consent ?? Opencannabis_Oauth_Consent()}
    set {_uniqueStorage()._consent = newValue}
  }
  /// Returns true if `consent` has been explicitly set.
  public var hasConsent: Bool {return _storage._consent != nil}
  /// Clears the value of `consent`. Subsequent reads from it will return its default value.
  public mutating func clearConsent() {_storage._consent = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.oauth"

extension Opencannabis_Oauth_ResponseType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNSPECIFIED_RESPONSE_TYPE"),
    1: .same(proto: "TOKEN"),
    2: .same(proto: "CODE"),
    3: .same(proto: "ID_TOKEN"),
  ]
}

extension Opencannabis_Oauth_GrantType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNSPECIFIED_GRANT_TYPE"),
    1: .same(proto: "AUTHORIZATION_CODE"),
    2: .same(proto: "REFRESH_TOKEN"),
    3: .same(proto: "CLIENT_CREDENTIALS"),
  ]
}

extension Opencannabis_Oauth_Client: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Client"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "secret"),
    3: .same(proto: "name"),
    4: .same(proto: "contact"),
    5: .standard(proto: "grant_types"),
    6: .same(proto: "branding"),
    7: .same(proto: "owner"),
    8: .same(proto: "policy"),
    9: .same(proto: "terms"),
    10: .same(proto: "public"),
    11: .standard(proto: "redirect_uri"),
    12: .standard(proto: "response_type"),
    13: .same(proto: "scope"),
  ]

  fileprivate class _StorageClass {
    var _id: String = String()
    var _secret: String = String()
    var _name: String = String()
    var _contact: [String] = []
    var _grantTypes: [Opencannabis_Oauth_GrantType] = []
    var _branding: Opencannabis_Media_MediaItem? = nil
    var _owner: String = String()
    var _policy: Opencannabis_Media_MediaItem? = nil
    var _terms: Opencannabis_Media_MediaItem? = nil
    var _public: Bool = false
    var _redirectUri: [String] = []
    var _responseType: [Opencannabis_Oauth_ResponseType] = []
    var _scope: [Opencannabis_Oauth_AuthorizationScope] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _secret = source._secret
      _name = source._name
      _contact = source._contact
      _grantTypes = source._grantTypes
      _branding = source._branding
      _owner = source._owner
      _policy = source._policy
      _terms = source._terms
      _public = source._public
      _redirectUri = source._redirectUri
      _responseType = source._responseType
      _scope = source._scope
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._id)
        case 2: try decoder.decodeSingularStringField(value: &_storage._secret)
        case 3: try decoder.decodeSingularStringField(value: &_storage._name)
        case 4: try decoder.decodeRepeatedStringField(value: &_storage._contact)
        case 5: try decoder.decodeRepeatedEnumField(value: &_storage._grantTypes)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._branding)
        case 7: try decoder.decodeSingularStringField(value: &_storage._owner)
        case 8: try decoder.decodeSingularMessageField(value: &_storage._policy)
        case 9: try decoder.decodeSingularMessageField(value: &_storage._terms)
        case 10: try decoder.decodeSingularBoolField(value: &_storage._public)
        case 11: try decoder.decodeRepeatedStringField(value: &_storage._redirectUri)
        case 12: try decoder.decodeRepeatedEnumField(value: &_storage._responseType)
        case 13: try decoder.decodeRepeatedMessageField(value: &_storage._scope)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._id.isEmpty {
        try visitor.visitSingularStringField(value: _storage._id, fieldNumber: 1)
      }
      if !_storage._secret.isEmpty {
        try visitor.visitSingularStringField(value: _storage._secret, fieldNumber: 2)
      }
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 3)
      }
      if !_storage._contact.isEmpty {
        try visitor.visitRepeatedStringField(value: _storage._contact, fieldNumber: 4)
      }
      if !_storage._grantTypes.isEmpty {
        try visitor.visitPackedEnumField(value: _storage._grantTypes, fieldNumber: 5)
      }
      if let v = _storage._branding {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if !_storage._owner.isEmpty {
        try visitor.visitSingularStringField(value: _storage._owner, fieldNumber: 7)
      }
      if let v = _storage._policy {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
      }
      if let v = _storage._terms {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
      }
      if _storage._public != false {
        try visitor.visitSingularBoolField(value: _storage._public, fieldNumber: 10)
      }
      if !_storage._redirectUri.isEmpty {
        try visitor.visitRepeatedStringField(value: _storage._redirectUri, fieldNumber: 11)
      }
      if !_storage._responseType.isEmpty {
        try visitor.visitPackedEnumField(value: _storage._responseType, fieldNumber: 12)
      }
      if !_storage._scope.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._scope, fieldNumber: 13)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Opencannabis_Oauth_Client) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._id != other_storage._id {return false}
        if _storage._secret != other_storage._secret {return false}
        if _storage._name != other_storage._name {return false}
        if _storage._contact != other_storage._contact {return false}
        if _storage._grantTypes != other_storage._grantTypes {return false}
        if _storage._branding != other_storage._branding {return false}
        if _storage._owner != other_storage._owner {return false}
        if _storage._policy != other_storage._policy {return false}
        if _storage._terms != other_storage._terms {return false}
        if _storage._public != other_storage._public {return false}
        if _storage._redirectUri != other_storage._redirectUri {return false}
        if _storage._responseType != other_storage._responseType {return false}
        if _storage._scope != other_storage._scope {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Oauth_Consent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Consent"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "client_id"),
    3: .standard(proto: "expires_at"),
    4: .standard(proto: "redirect_uri"),
    5: .standard(proto: "requested_scope"),
  ]

  fileprivate class _StorageClass {
    var _id: String = String()
    var _clientID: String = String()
    var _expiresAt: Opencannabis_Temporal_Instant? = nil
    var _redirectUri: String = String()
    var _requestedScope: [String] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _clientID = source._clientID
      _expiresAt = source._expiresAt
      _redirectUri = source._redirectUri
      _requestedScope = source._requestedScope
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._id)
        case 2: try decoder.decodeSingularStringField(value: &_storage._clientID)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._expiresAt)
        case 4: try decoder.decodeSingularStringField(value: &_storage._redirectUri)
        case 5: try decoder.decodeRepeatedStringField(value: &_storage._requestedScope)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._id.isEmpty {
        try visitor.visitSingularStringField(value: _storage._id, fieldNumber: 1)
      }
      if !_storage._clientID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._clientID, fieldNumber: 2)
      }
      if let v = _storage._expiresAt {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if !_storage._redirectUri.isEmpty {
        try visitor.visitSingularStringField(value: _storage._redirectUri, fieldNumber: 4)
      }
      if !_storage._requestedScope.isEmpty {
        try visitor.visitRepeatedStringField(value: _storage._requestedScope, fieldNumber: 5)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Opencannabis_Oauth_Consent) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._id != other_storage._id {return false}
        if _storage._clientID != other_storage._clientID {return false}
        if _storage._expiresAt != other_storage._expiresAt {return false}
        if _storage._redirectUri != other_storage._redirectUri {return false}
        if _storage._requestedScope != other_storage._requestedScope {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Oauth_ConsentTicket: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ConsentTicket"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "client"),
    2: .same(proto: "consent"),
  ]

  fileprivate class _StorageClass {
    var _client: Opencannabis_Oauth_Client? = nil
    var _consent: Opencannabis_Oauth_Consent? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _client = source._client
      _consent = source._consent
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._client)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._consent)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._client {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._consent {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Opencannabis_Oauth_ConsentTicket) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._client != other_storage._client {return false}
        if _storage._consent != other_storage._consent {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
