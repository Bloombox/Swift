// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: menu/v1beta1/MenuStreaming_Beta1.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies streaming features/methods for menu catalog data. Provided as an independent API to facilitate dispatch or
/// code gen separately from unary menu operations.

import Foundation
import OpenCannabis
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

/// Describes an RPC operation to establish a full real-time interactive menu stream. This allows a supporting device to
/// request data, search the menu, and more, while receiving pushed notifications for menu changes. Bi-directional stream
/// RPCs aren't supported in all circumstances.
public struct Bloombox_Services_Menu_V1beta1_RealtimeMenu {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Describes a request submitted via a real-time event stream. Specifies info like the client-assigned ID, which is
  /// used to correlate requests and responses over a multiplex stream. Requests over a realtime menu stream range from
  /// operations to ping/pong the server, fetch menus, search for products, and so on.
  public struct Request {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Client-assigned sequence ID for this message. Any response that correlates with this message will carry the same
    /// ID when sent from the server.
    public var id: UInt32 {
      get {return _storage._id}
      set {_uniqueStorage()._id = newValue}
    }

    /// Specifies the partnership scope for this realtime session. The scope is defined by a URI-like path, that begins
    /// with the segment `partner`, and then specifies the partner, with the location following in the same format.
    public var scope: String {
      get {return _storage._scope}
      set {_uniqueStorage()._scope = newValue}
    }

    /// Whether this request should be considered "critical." At the server's option, this request may preempt others if
    /// this flag is set by the client.
    public var critical: Bool {
      get {return _storage._critical}
      set {_uniqueStorage()._critical = newValue}
    }

    /// ID for the session to which this request belongs. Assigned as of the first response payload, and required to
    /// resume a previous realtime session.
    public var session: String {
      get {return _storage._session}
      set {_uniqueStorage()._session = newValue}
    }

    /// Fingerprint for a menu, as the client holds it currently in memory. If the server detects no difference between
    /// a requested menu and the current fingerprint, an empty menu payload response is provided.
    public var fingerprint: Opencannabis_Crypto_Hash {
      get {return _storage._fingerprint ?? Opencannabis_Crypto_Hash()}
      set {_uniqueStorage()._fingerprint = newValue}
    }
    /// Returns true if `fingerprint` has been explicitly set.
    public var hasFingerprint: Bool {return _storage._fingerprint != nil}
    /// Clears the value of `fingerprint`. Subsequent reads from it will return its default value.
    public mutating func clearFingerprint() {_uniqueStorage()._fingerprint = nil}

    /// Encoded bloom filter of product keys described in the current menu payload. This can be used to determine quickly
    /// whether a given menu key is present or not on the client-side. If a key matches against this filter, it can be
    /// reasonably determined that the client has an updated copy of that key (so long as both machines calculate the
    /// filter along with the product's timestamp on each change).
    public var snapshot: Opencannabis_Crypto_Hash {
      get {return _storage._snapshot ?? Opencannabis_Crypto_Hash()}
      set {_uniqueStorage()._snapshot = newValue}
    }
    /// Returns true if `snapshot` has been explicitly set.
    public var hasSnapshot: Bool {return _storage._snapshot != nil}
    /// Clears the value of `snapshot`. Subsequent reads from it will return its default value.
    public mutating func clearSnapshot() {_uniqueStorage()._snapshot = nil}

    /// Packaged request to submit to the server as part of a given realtime menu stream. These requests are responded to
    /// with a payload that contains a matching ID value, which is required.
    public var request: OneOf_Request? {
      get {return _storage._request}
      set {_uniqueStorage()._request = newValue}
    }

    /// Request to ping the server and receive a response.
    public var ping: Bloombox_Services_Menu_V1beta1_Ping.Request {
      get {
        if case .ping(let v)? = _storage._request {return v}
        return Bloombox_Services_Menu_V1beta1_Ping.Request()
      }
      set {_uniqueStorage()._request = .ping(newValue)}
    }

    /// Request for a set of featured products in a given circumstance.
    public var featured: Bloombox_Services_Menu_V1beta1_GetFeatured.Request {
      get {
        if case .featured(let v)? = _storage._request {return v}
        return Bloombox_Services_Menu_V1beta1_GetFeatured.Request()
      }
      set {_uniqueStorage()._request = .featured(newValue)}
    }

    /// Request for a menu catalog payload, consisting of one or more sections worth of product data.
    public var menu: Bloombox_Services_Menu_V1beta1_GetMenu.Request {
      get {
        if case .menu(let v)? = _storage._request {return v}
        return Bloombox_Services_Menu_V1beta1_GetMenu.Request()
      }
      set {_uniqueStorage()._request = .menu(newValue)}
    }

    /// Request for one or more product records, addressed by their product keys.
    public var product: Bloombox_Services_Menu_V1beta1_GetProduct.Request {
      get {
        if case .product(let v)? = _storage._request {return v}
        return Bloombox_Services_Menu_V1beta1_GetProduct.Request()
      }
      set {_uniqueStorage()._request = .product(newValue)}
    }

    /// Request to perform a search across product data for a given catalog.
    public var search: Bloombox_Services_Menu_V1beta1_SearchMenu.Request {
      get {
        if case .search(let v)? = _storage._request {return v}
        return Bloombox_Services_Menu_V1beta1_SearchMenu.Request()
      }
      set {_uniqueStorage()._request = .search(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    /// Packaged request to submit to the server as part of a given realtime menu stream. These requests are responded to
    /// with a payload that contains a matching ID value, which is required.
    public enum OneOf_Request: Equatable {
      /// Request to ping the server and receive a response.
      case ping(Bloombox_Services_Menu_V1beta1_Ping.Request)
      /// Request for a set of featured products in a given circumstance.
      case featured(Bloombox_Services_Menu_V1beta1_GetFeatured.Request)
      /// Request for a menu catalog payload, consisting of one or more sections worth of product data.
      case menu(Bloombox_Services_Menu_V1beta1_GetMenu.Request)
      /// Request for one or more product records, addressed by their product keys.
      case product(Bloombox_Services_Menu_V1beta1_GetProduct.Request)
      /// Request to perform a search across product data for a given catalog.
      case search(Bloombox_Services_Menu_V1beta1_SearchMenu.Request)

    #if !swift(>=4.1)
      public static func ==(lhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu.Request.OneOf_Request, rhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu.Request.OneOf_Request) -> Bool {
        switch (lhs, rhs) {
        case (.ping(let l), .ping(let r)): return l == r
        case (.featured(let l), .featured(let r)): return l == r
        case (.menu(let l), .menu(let r)): return l == r
        case (.product(let l), .product(let r)): return l == r
        case (.search(let l), .search(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  /// Describes a pushed event, or response event, emitted as part of a realtime menu stream. These events are either
  /// synthesized on the server, to describe menu changes or other changes in state, or sent in response to requests
  /// submitted by the client, as defined above in `RealtimeMenu.Request`. If the response corresponds to a request
  /// rather than server-sent event, it will have an ID value corresponding to the client-assigned ID value.
  public struct StreamEvent {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Client-assigned sequence ID for this message, if it is being sent in response to a request received from the
    /// client. If this value is less than `1` or not present, the payload can be determined to be a server-sent event.
    public var id: UInt32 {
      get {return _storage._id}
      set {_uniqueStorage()._id = newValue}
    }

    /// Describes any error that occurred within the circumstance of this request cycle. This is generally only set when
    /// the message is a response to a client-submitted request, with some non-terminal error as the response.
    public var err: Bloombox_Services_Menu_V1beta1_MenuError {
      get {return _storage._err}
      set {_uniqueStorage()._err = newValue}
    }

    /// ID for the session to which this request belongs. For the first server-sent event, this will be an ID value for
    /// the client to persist and send with each request, provisioned by the server. Once it has been provisioned, the
    /// session ID should be affixed to RPCs in the stream as a header or trailer. It is again submitted when the client
    /// needs to resume a previous session, in which case, the server issues it back to confirm session resumption. In
    /// all other cases the field should be empty.
    public var session: String {
      get {return _storage._session}
      set {_uniqueStorage()._session = newValue}
    }

    /// Fingerprint value to update the menu to on the client side. This value is set when the server provides a full
    /// catalog payload, to allow for client-side use as an opaque token.
    public var fingerprint: Opencannabis_Crypto_Hash {
      get {return _storage._fingerprint ?? Opencannabis_Crypto_Hash()}
      set {_uniqueStorage()._fingerprint = newValue}
    }
    /// Returns true if `fingerprint` has been explicitly set.
    public var hasFingerprint: Bool {return _storage._fingerprint != nil}
    /// Clears the value of `fingerprint`. Subsequent reads from it will return its default value.
    public mutating func clearFingerprint() {_uniqueStorage()._fingerprint = nil}

    /// Pre-calculated and encoded bloom filter, with which the client can check against for keys contained in this
    /// payload. Clients may also use this to update their own internal filter state. This value is set with each
    /// response that specifies a menu payload or product payload, based on the enclosed constituent keys.
    public var snapshot: Opencannabis_Crypto_Hash {
      get {return _storage._snapshot ?? Opencannabis_Crypto_Hash()}
      set {_uniqueStorage()._snapshot = newValue}
    }
    /// Returns true if `snapshot` has been explicitly set.
    public var hasSnapshot: Bool {return _storage._snapshot != nil}
    /// Clears the value of `snapshot`. Subsequent reads from it will return its default value.
    public mutating func clearSnapshot() {_uniqueStorage()._snapshot = nil}

    /// Response or event payload provided as part of this stream event. Based on the genesis of this event, this is
    /// either a response payload for a request submitted by the client, or an event synthesized on the server to
    /// describe some change in state.
    public var payload: OneOf_Payload? {
      get {return _storage._payload}
      set {_uniqueStorage()._payload = newValue}
    }

    /// Pong response to a ping request submitted by the client.
    public var pong: Bloombox_Services_Menu_V1beta1_Ping.Response {
      get {
        if case .pong(let v)? = _storage._payload {return v}
        return Bloombox_Services_Menu_V1beta1_Ping.Response()
      }
      set {_uniqueStorage()._payload = .pong(newValue)}
    }

    /// Server-sent stream event notifying the client of some state change.
    public var event: Bloombox_Services_Menu_V1beta1_GetMenu.StreamEvent {
      get {
        if case .event(let v)? = _storage._payload {return v}
        return Bloombox_Services_Menu_V1beta1_GetMenu.StreamEvent()
      }
      set {_uniqueStorage()._payload = .event(newValue)}
    }

    /// Menu catalog payload, in response to a client request. If the first request to establish a stream contains no
    /// fingerprint for an existing menu, or no matching fingerprint, this is populated with a full keys-only menu
    /// payload that the client can use as a starting base.
    public var menu: Bloombox_Services_Menu_V1beta1_GetMenu.Response {
      get {
        if case .menu(let v)? = _storage._payload {return v}
        return Bloombox_Services_Menu_V1beta1_GetMenu.Response()
      }
      set {_uniqueStorage()._payload = .menu(newValue)}
    }

    /// Product payload, issued in response to a request from a client.
    public var product: Bloombox_Services_Menu_V1beta1_GetProduct.Response {
      get {
        if case .product(let v)? = _storage._payload {return v}
        return Bloombox_Services_Menu_V1beta1_GetProduct.Response()
      }
      set {_uniqueStorage()._payload = .product(newValue)}
    }

    /// Search response, issued in response to a request from a client.
    public var search: Bloombox_Services_Menu_V1beta1_SearchMenu.Response {
      get {
        if case .search(let v)? = _storage._payload {return v}
        return Bloombox_Services_Menu_V1beta1_SearchMenu.Response()
      }
      set {_uniqueStorage()._payload = .search(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    /// Response or event payload provided as part of this stream event. Based on the genesis of this event, this is
    /// either a response payload for a request submitted by the client, or an event synthesized on the server to
    /// describe some change in state.
    public enum OneOf_Payload: Equatable {
      /// Pong response to a ping request submitted by the client.
      case pong(Bloombox_Services_Menu_V1beta1_Ping.Response)
      /// Server-sent stream event notifying the client of some state change.
      case event(Bloombox_Services_Menu_V1beta1_GetMenu.StreamEvent)
      /// Menu catalog payload, in response to a client request. If the first request to establish a stream contains no
      /// fingerprint for an existing menu, or no matching fingerprint, this is populated with a full keys-only menu
      /// payload that the client can use as a starting base.
      case menu(Bloombox_Services_Menu_V1beta1_GetMenu.Response)
      /// Product payload, issued in response to a request from a client.
      case product(Bloombox_Services_Menu_V1beta1_GetProduct.Response)
      /// Search response, issued in response to a request from a client.
      case search(Bloombox_Services_Menu_V1beta1_SearchMenu.Response)

    #if !swift(>=4.1)
      public static func ==(lhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu.StreamEvent.OneOf_Payload, rhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu.StreamEvent.OneOf_Payload) -> Bool {
        switch (lhs, rhs) {
        case (.pong(let l), .pong(let r)): return l == r
        case (.event(let l), .event(let r)): return l == r
        case (.menu(let l), .menu(let r)): return l == r
        case (.product(let l), .product(let r)): return l == r
        case (.search(let l), .search(let r)): return l == r
        default: return false
        }
      }
    #endif
    }

    public init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.services.menu.v1beta1"

extension Bloombox_Services_Menu_V1beta1_RealtimeMenu: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RealtimeMenu"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu, rhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Menu_V1beta1_RealtimeMenu.Request: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Menu_V1beta1_RealtimeMenu.protoMessageName + ".Request"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "scope"),
    3: .same(proto: "critical"),
    4: .same(proto: "session"),
    5: .same(proto: "fingerprint"),
    6: .same(proto: "snapshot"),
    10: .same(proto: "ping"),
    11: .same(proto: "featured"),
    12: .same(proto: "menu"),
    13: .same(proto: "product"),
    14: .same(proto: "search"),
  ]

  fileprivate class _StorageClass {
    var _id: UInt32 = 0
    var _scope: String = String()
    var _critical: Bool = false
    var _session: String = String()
    var _fingerprint: Opencannabis_Crypto_Hash? = nil
    var _snapshot: Opencannabis_Crypto_Hash? = nil
    var _request: Bloombox_Services_Menu_V1beta1_RealtimeMenu.Request.OneOf_Request?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _scope = source._scope
      _critical = source._critical
      _session = source._session
      _fingerprint = source._fingerprint
      _snapshot = source._snapshot
      _request = source._request
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
        case 1: try decoder.decodeSingularUInt32Field(value: &_storage._id)
        case 2: try decoder.decodeSingularStringField(value: &_storage._scope)
        case 3: try decoder.decodeSingularBoolField(value: &_storage._critical)
        case 4: try decoder.decodeSingularStringField(value: &_storage._session)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._fingerprint)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._snapshot)
        case 10:
          var v: Bloombox_Services_Menu_V1beta1_Ping.Request?
          if let current = _storage._request {
            try decoder.handleConflictingOneOf()
            if case .ping(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._request = .ping(v)}
        case 11:
          var v: Bloombox_Services_Menu_V1beta1_GetFeatured.Request?
          if let current = _storage._request {
            try decoder.handleConflictingOneOf()
            if case .featured(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._request = .featured(v)}
        case 12:
          var v: Bloombox_Services_Menu_V1beta1_GetMenu.Request?
          if let current = _storage._request {
            try decoder.handleConflictingOneOf()
            if case .menu(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._request = .menu(v)}
        case 13:
          var v: Bloombox_Services_Menu_V1beta1_GetProduct.Request?
          if let current = _storage._request {
            try decoder.handleConflictingOneOf()
            if case .product(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._request = .product(v)}
        case 14:
          var v: Bloombox_Services_Menu_V1beta1_SearchMenu.Request?
          if let current = _storage._request {
            try decoder.handleConflictingOneOf()
            if case .search(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._request = .search(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._id != 0 {
        try visitor.visitSingularUInt32Field(value: _storage._id, fieldNumber: 1)
      }
      if !_storage._scope.isEmpty {
        try visitor.visitSingularStringField(value: _storage._scope, fieldNumber: 2)
      }
      if _storage._critical != false {
        try visitor.visitSingularBoolField(value: _storage._critical, fieldNumber: 3)
      }
      if !_storage._session.isEmpty {
        try visitor.visitSingularStringField(value: _storage._session, fieldNumber: 4)
      }
      if let v = _storage._fingerprint {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._snapshot {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      switch _storage._request {
      case .ping(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .featured(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case .menu(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      case .product(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 13)
      case .search(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 14)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu.Request, rhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu.Request) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._id != rhs_storage._id {return false}
        if _storage._scope != rhs_storage._scope {return false}
        if _storage._critical != rhs_storage._critical {return false}
        if _storage._session != rhs_storage._session {return false}
        if _storage._fingerprint != rhs_storage._fingerprint {return false}
        if _storage._snapshot != rhs_storage._snapshot {return false}
        if _storage._request != rhs_storage._request {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Menu_V1beta1_RealtimeMenu.StreamEvent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Menu_V1beta1_RealtimeMenu.protoMessageName + ".StreamEvent"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "err"),
    3: .same(proto: "session"),
    4: .same(proto: "fingerprint"),
    5: .same(proto: "snapshot"),
    10: .same(proto: "pong"),
    11: .same(proto: "event"),
    12: .same(proto: "menu"),
    13: .same(proto: "product"),
    14: .same(proto: "search"),
  ]

  fileprivate class _StorageClass {
    var _id: UInt32 = 0
    var _err: Bloombox_Services_Menu_V1beta1_MenuError = .noError
    var _session: String = String()
    var _fingerprint: Opencannabis_Crypto_Hash? = nil
    var _snapshot: Opencannabis_Crypto_Hash? = nil
    var _payload: Bloombox_Services_Menu_V1beta1_RealtimeMenu.StreamEvent.OneOf_Payload?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _err = source._err
      _session = source._session
      _fingerprint = source._fingerprint
      _snapshot = source._snapshot
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
        case 1: try decoder.decodeSingularUInt32Field(value: &_storage._id)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._err)
        case 3: try decoder.decodeSingularStringField(value: &_storage._session)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._fingerprint)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._snapshot)
        case 10:
          var v: Bloombox_Services_Menu_V1beta1_Ping.Response?
          if let current = _storage._payload {
            try decoder.handleConflictingOneOf()
            if case .pong(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._payload = .pong(v)}
        case 11:
          var v: Bloombox_Services_Menu_V1beta1_GetMenu.StreamEvent?
          if let current = _storage._payload {
            try decoder.handleConflictingOneOf()
            if case .event(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._payload = .event(v)}
        case 12:
          var v: Bloombox_Services_Menu_V1beta1_GetMenu.Response?
          if let current = _storage._payload {
            try decoder.handleConflictingOneOf()
            if case .menu(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._payload = .menu(v)}
        case 13:
          var v: Bloombox_Services_Menu_V1beta1_GetProduct.Response?
          if let current = _storage._payload {
            try decoder.handleConflictingOneOf()
            if case .product(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._payload = .product(v)}
        case 14:
          var v: Bloombox_Services_Menu_V1beta1_SearchMenu.Response?
          if let current = _storage._payload {
            try decoder.handleConflictingOneOf()
            if case .search(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._payload = .search(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._id != 0 {
        try visitor.visitSingularUInt32Field(value: _storage._id, fieldNumber: 1)
      }
      if _storage._err != .noError {
        try visitor.visitSingularEnumField(value: _storage._err, fieldNumber: 2)
      }
      if !_storage._session.isEmpty {
        try visitor.visitSingularStringField(value: _storage._session, fieldNumber: 3)
      }
      if let v = _storage._fingerprint {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._snapshot {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      switch _storage._payload {
      case .pong(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .event(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case .menu(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      case .product(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 13)
      case .search(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 14)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu.StreamEvent, rhs: Bloombox_Services_Menu_V1beta1_RealtimeMenu.StreamEvent) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._id != rhs_storage._id {return false}
        if _storage._err != rhs_storage._err {return false}
        if _storage._session != rhs_storage._session {return false}
        if _storage._fingerprint != rhs_storage._fingerprint {return false}
        if _storage._snapshot != rhs_storage._snapshot {return false}
        if _storage._payload != rhs_storage._payload {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
