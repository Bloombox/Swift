// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: security/access/AccessRequest.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Defines the notion of a partner access request, which allows an end-user in a back-office context to request access
/// to a given partner or location policy subject (scope). This should generate a record in the database, whic notifies
/// current scope administrators via the UI in the application.

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

/// Enumerates the possible states an access request may be in, beginning with the `PENDING` state, which is the default
/// state and is assumed when the request is originally created. A duly-authorized user, responding to the request, may
/// move it into the `GRANTED` state, which converts the request into an access policy, or the `DECLINED` state, which
/// deletes the request and ignores it. Both are terminal states.
public enum Bloombox_Security_Access_AccessRequestStatus: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The access request described by this status is PENDING, meaning, administrators have been delivered the request,
  /// but have not yet responded to it. There is no way to see if administrators have *seen* the request.
  case pending // = 0

  /// The access request has been responded-to by a duly-authorized user, who has GRANTED the request. This status may
  /// not exist for an `AccessRequest` unless a corresponding access policy has been persisted, and is now reference-able
  /// via the `policy` reference property on the access request described by this status.
  case granted // = 1

  /// The access request has been responded-to by a duly-authorized user, who has DECLINED the request. This status is
  /// terminal. If a user still needs access to a given partner or location scope, they must submit a new access request,
  /// with the hopes the administrators will move it to `GRANTED`.
  case declined // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .pending
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .pending
    case 1: self = .granted
    case 2: self = .declined
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .pending: return 0
    case .granted: return 1
    case .declined: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Security_Access_AccessRequestStatus: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Security_Access_AccessRequestStatus] = [
    .pending,
    .granted,
    .declined,
  ]
}

#endif  // swift(>=4.2)

/// Represents a request, by an end-user, for access to a particular partner or location policy subject (scope). This
/// record becomes visible in the UI after being saved, so that users with rights to respond to it have an opportunity to
/// take action. If a request is granted, it is turned into a policy, and an email is generated to the user to notify
/// them of their new access. If a request is declined, no action is taken beyond marking the request status change.
public struct Bloombox_Security_Access_AccessRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Generated ID for this request, which eventually becomes the access policy ID, and follows the same rules. The ID is
  /// built by hashing the access subject scope path (either 'partner/{x}' or 'partner/{x}/location/{y}'), concatenated
  /// with the user's profile key, separated by a ':', using a single round of SHA1.
  public var requestID: String {
    get {return _storage._requestID}
    set {_uniqueStorage()._requestID = newValue}
  }

  /// Key for the user requesting access. This should be their profile key, *not* their user ID, otherwise the access
  /// granted won't be stable considering the potential for multiple user identities. This value is required.
  public var user: Bloombox_Identity_UserKey {
    get {return _storage._user ?? Bloombox_Identity_UserKey()}
    set {_uniqueStorage()._user = newValue}
  }
  /// Returns true if `user` has been explicitly set.
  public var hasUser: Bool {return _storage._user != nil}
  /// Clears the value of `user`. Subsequent reads from it will return its default value.
  public mutating func clearUser() {_uniqueStorage()._user = nil}

  /// Access subject, which the user is requesting access to. Describes either (1) a partner scope, in string form, in
  /// the pattern 'partner/{x}', or (2) a location scope, also in string form, like 'partner/{x}/location/{y}'. This is
  /// the scope at which notifications will be delivered for this request, and at which access will be granted if the
  /// responding user so chooses. Which role the user is granted is up to the granting/responding user.
  public var subject: Bloombox_Security_Access_AccessSubject {
    get {return _storage._subject ?? Bloombox_Security_Access_AccessSubject()}
    set {_uniqueStorage()._subject = newValue}
  }
  /// Returns true if `subject` has been explicitly set.
  public var hasSubject: Bool {return _storage._subject != nil}
  /// Clears the value of `subject`. Subsequent reads from it will return its default value.
  public mutating func clearSubject() {_uniqueStorage()._subject = nil}

  /// Describes the current status of this access request. Once the status has been responded to by an administrator, the
  /// status is either flipped to `GRANTED`, in which case an access policy is now ready and committed, or `DECLINED`, in
  /// which case no action takes place.
  public var status: Bloombox_Security_Access_AccessRequestStatus {
    get {return _storage._status}
    set {_uniqueStorage()._status = newValue}
  }

  /// Once an authorized user responds to an access request, their key is listed in this spot, along with their answer
  /// and an update to the relevant timestamps.
  public var responder: Bloombox_Identity_UserKey {
    get {return _storage._responder ?? Bloombox_Identity_UserKey()}
    set {_uniqueStorage()._responder = newValue}
  }
  /// Returns true if `responder` has been explicitly set.
  public var hasResponder: Bool {return _storage._responder != nil}
  /// Clears the value of `responder`. Subsequent reads from it will return its default value.
  public mutating func clearResponder() {_uniqueStorage()._responder = nil}

  /// Boolean flag indicating whether this request has been responded to, in a terminal way, by a duly-authorized user
  /// within the scope of the access request subject. Once this flag is set to true, the record is immutable.
  public var closed: Bool {
    get {return _storage._closed}
    set {_uniqueStorage()._closed = newValue}
  }

  /// Describes the precise timestamp at which this record was last modified. On any operation, including changing the
  /// request's status, this timestamp is updated. It is otherwise read-only.
  public var modified: Opencannabis_Temporal_Instant {
    get {return _storage._modified ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._modified = newValue}
  }
  /// Returns true if `modified` has been explicitly set.
  public var hasModified: Bool {return _storage._modified != nil}
  /// Clears the value of `modified`. Subsequent reads from it will return its default value.
  public mutating func clearModified() {_uniqueStorage()._modified = nil}

  /// Describes the precise timestamp at which this record was original created. After initial creation, when this field
  /// is set by the database adapter, it is read-only.
  public var created: Opencannabis_Temporal_Instant {
    get {return _storage._created ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._created = newValue}
  }
  /// Returns true if `created` has been explicitly set.
  public var hasCreated: Bool {return _storage._created != nil}
  /// Clears the value of `created`. Subsequent reads from it will return its default value.
  public mutating func clearCreated() {_uniqueStorage()._created = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.security.access"

extension Bloombox_Security_Access_AccessRequestStatus: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PENDING"),
    1: .same(proto: "GRANTED"),
    2: .same(proto: "DECLINED"),
  ]
}

extension Bloombox_Security_Access_AccessRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".AccessRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "request_id"),
    2: .same(proto: "user"),
    3: .same(proto: "subject"),
    4: .same(proto: "status"),
    5: .same(proto: "responder"),
    6: .same(proto: "closed"),
    98: .same(proto: "modified"),
    99: .same(proto: "created"),
  ]

  fileprivate class _StorageClass {
    var _requestID: String = String()
    var _user: Bloombox_Identity_UserKey? = nil
    var _subject: Bloombox_Security_Access_AccessSubject? = nil
    var _status: Bloombox_Security_Access_AccessRequestStatus = .pending
    var _responder: Bloombox_Identity_UserKey? = nil
    var _closed: Bool = false
    var _modified: Opencannabis_Temporal_Instant? = nil
    var _created: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _requestID = source._requestID
      _user = source._user
      _subject = source._subject
      _status = source._status
      _responder = source._responder
      _closed = source._closed
      _modified = source._modified
      _created = source._created
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._requestID)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._user)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._subject)
        case 4: try decoder.decodeSingularEnumField(value: &_storage._status)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._responder)
        case 6: try decoder.decodeSingularBoolField(value: &_storage._closed)
        case 98: try decoder.decodeSingularMessageField(value: &_storage._modified)
        case 99: try decoder.decodeSingularMessageField(value: &_storage._created)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._requestID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._requestID, fieldNumber: 1)
      }
      if let v = _storage._user {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._subject {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if _storage._status != .pending {
        try visitor.visitSingularEnumField(value: _storage._status, fieldNumber: 4)
      }
      if let v = _storage._responder {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if _storage._closed != false {
        try visitor.visitSingularBoolField(value: _storage._closed, fieldNumber: 6)
      }
      if let v = _storage._modified {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 98)
      }
      if let v = _storage._created {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 99)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Security_Access_AccessRequest, rhs: Bloombox_Security_Access_AccessRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._requestID != rhs_storage._requestID {return false}
        if _storage._user != rhs_storage._user {return false}
        if _storage._subject != rhs_storage._subject {return false}
        if _storage._status != rhs_storage._status {return false}
        if _storage._responder != rhs_storage._responder {return false}
        if _storage._closed != rhs_storage._closed {return false}
        if _storage._modified != rhs_storage._modified {return false}
        if _storage._created != rhs_storage._created {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
