// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: partner/Partner.proto
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

/// Channel through which a partner interacts with Bloombox.
public enum Bloombox_Schema_Partner_PartnerChannel: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Direct customers of Bloombox.
  case direct // = 0
  case UNRECOGNIZED(Int)

  public init() {
    self = .direct
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .direct
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .direct: return 0
    case .UNRECOGNIZED(let i): return i
    }
  }

}

/// Specifies a key that references a partner organization, with an account opened at Bloombox.
public struct Bloombox_Schema_Partner_PartnerKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Short string that uniquely identifies a partner organization.
  public var code: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies information about a partner organization that has an account opened with Bloombox. A partner can own/manage
/// multiple `Location`s, and is identified uniquely by a short `code`, which is a lowercase string suitable for use in
/// a URL as a slug.
public struct Bloombox_Schema_Partner_Partner {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Short string that uniquely identifies this partner organization.
  public var code: String {
    get {return _storage._code}
    set {_uniqueStorage()._code = newValue}
  }

  /// Full human-readable label for this partner organization.
  public var name: String {
    get {return _storage._name}
    set {_uniqueStorage()._name = newValue}
  }

  /// Flags for various things about this partner account.
  public var flags: Bloombox_Schema_Partner_PartnerFlags {
    get {return _storage._flags ?? Bloombox_Schema_Partner_PartnerFlags()}
    set {_uniqueStorage()._flags = newValue}
  }
  /// Returns true if `flags` has been explicitly set.
  public var hasFlags: Bool {return _storage._flags != nil}
  /// Clears the value of `flags`. Subsequent reads from it will return its default value.
  public mutating func clearFlags() {_storage._flags = nil}

  /// Legal name of the partner organization.
  public var legalName: String {
    get {return _storage._legalName}
    set {_uniqueStorage()._legalName = newValue}
  }

  /// Contact information for this organization.
  public var contact: Opencannabis_Contact_ContactInfo {
    get {return _storage._contact ?? Opencannabis_Contact_ContactInfo()}
    set {_uniqueStorage()._contact = newValue}
  }
  /// Returns true if `contact` has been explicitly set.
  public var hasContact: Bool {return _storage._contact != nil}
  /// Clears the value of `contact`. Subsequent reads from it will return its default value.
  public mutating func clearContact() {_storage._contact = nil}

  /// Branding information for this organization.
  public var branding: Opencannabis_Media_MediaItem {
    get {return _storage._branding ?? Opencannabis_Media_MediaItem()}
    set {_uniqueStorage()._branding = newValue}
  }
  /// Returns true if `branding` has been explicitly set.
  public var hasBranding: Bool {return _storage._branding != nil}
  /// Clears the value of `branding`. Subsequent reads from it will return its default value.
  public mutating func clearBranding() {_storage._branding = nil}

  /// Channel through which this partner organization interacts with Bloombox.
  public var channel: Bloombox_Schema_Partner_PartnerChannel {
    get {return _storage._channel}
    set {_uniqueStorage()._channel = newValue}
  }

  /// Timestamp for when this record was created.
  public var created: Opencannabis_Temporal_Instant {
    get {return _storage._created ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._created = newValue}
  }
  /// Returns true if `created` has been explicitly set.
  public var hasCreated: Bool {return _storage._created != nil}
  /// Clears the value of `created`. Subsequent reads from it will return its default value.
  public mutating func clearCreated() {_storage._created = nil}

  /// Timestamp for when this record was last modified.
  public var modified: Opencannabis_Temporal_Instant {
    get {return _storage._modified ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._modified = newValue}
  }
  /// Returns true if `modified` has been explicitly set.
  public var hasModified: Bool {return _storage._modified != nil}
  /// Clears the value of `modified`. Subsequent reads from it will return its default value.
  public mutating func clearModified() {_storage._modified = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies flags that may be set on a partner organization account.
public struct Bloombox_Schema_Partner_PartnerFlags {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies that the subject partner organization is currently suspended, organization wide, and has had access
  /// revoked to Bloombox systems.
  public var suspended: Bool = false

  /// Specifies that the subject partner organiztaion is currently in a past-due state, where their organization and
  /// related access has been heavily restricted.
  public var pastdue: Bool = false

  /// Specifies that the subject partner organization has access to beta features, clusters, and systems.
  public var beta: Bool = false

  /// Specifies that the subject partner organization has internal sandbox access.
  public var sandbox: Bool = false

  /// Specifies that the subject partner organization is a testing account held and managed internally by Bloombox, or
  /// by selected partners.
  public var `internal`: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.partner"

extension Bloombox_Schema_Partner_PartnerChannel: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DIRECT"),
  ]
}

extension Bloombox_Schema_Partner_PartnerKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerKey"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "code"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.code)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.code.isEmpty {
      try visitor.visitSingularStringField(value: self.code, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_PartnerKey) -> Bool {
    if self.code != other.code {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_Partner: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Partner"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "code"),
    2: .same(proto: "name"),
    3: .same(proto: "flags"),
    4: .standard(proto: "legal_name"),
    5: .same(proto: "contact"),
    6: .same(proto: "branding"),
    7: .same(proto: "channel"),
    100: .same(proto: "created"),
    101: .same(proto: "modified"),
  ]

  fileprivate class _StorageClass {
    var _code: String = String()
    var _name: String = String()
    var _flags: Bloombox_Schema_Partner_PartnerFlags? = nil
    var _legalName: String = String()
    var _contact: Opencannabis_Contact_ContactInfo? = nil
    var _branding: Opencannabis_Media_MediaItem? = nil
    var _channel: Bloombox_Schema_Partner_PartnerChannel = .direct
    var _created: Opencannabis_Temporal_Instant? = nil
    var _modified: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _code = source._code
      _name = source._name
      _flags = source._flags
      _legalName = source._legalName
      _contact = source._contact
      _branding = source._branding
      _channel = source._channel
      _created = source._created
      _modified = source._modified
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._code)
        case 2: try decoder.decodeSingularStringField(value: &_storage._name)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._flags)
        case 4: try decoder.decodeSingularStringField(value: &_storage._legalName)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._contact)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._branding)
        case 7: try decoder.decodeSingularEnumField(value: &_storage._channel)
        case 100: try decoder.decodeSingularMessageField(value: &_storage._created)
        case 101: try decoder.decodeSingularMessageField(value: &_storage._modified)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._code.isEmpty {
        try visitor.visitSingularStringField(value: _storage._code, fieldNumber: 1)
      }
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 2)
      }
      if let v = _storage._flags {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if !_storage._legalName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._legalName, fieldNumber: 4)
      }
      if let v = _storage._contact {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._branding {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if _storage._channel != .direct {
        try visitor.visitSingularEnumField(value: _storage._channel, fieldNumber: 7)
      }
      if let v = _storage._created {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 100)
      }
      if let v = _storage._modified {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 101)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Partner) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._code != other_storage._code {return false}
        if _storage._name != other_storage._name {return false}
        if _storage._flags != other_storage._flags {return false}
        if _storage._legalName != other_storage._legalName {return false}
        if _storage._contact != other_storage._contact {return false}
        if _storage._branding != other_storage._branding {return false}
        if _storage._channel != other_storage._channel {return false}
        if _storage._created != other_storage._created {return false}
        if _storage._modified != other_storage._modified {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_PartnerFlags: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerFlags"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "suspended"),
    2: .same(proto: "pastdue"),
    3: .same(proto: "beta"),
    4: .same(proto: "sandbox"),
    5: .same(proto: "internal"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.suspended)
      case 2: try decoder.decodeSingularBoolField(value: &self.pastdue)
      case 3: try decoder.decodeSingularBoolField(value: &self.beta)
      case 4: try decoder.decodeSingularBoolField(value: &self.sandbox)
      case 5: try decoder.decodeSingularBoolField(value: &self.`internal`)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.suspended != false {
      try visitor.visitSingularBoolField(value: self.suspended, fieldNumber: 1)
    }
    if self.pastdue != false {
      try visitor.visitSingularBoolField(value: self.pastdue, fieldNumber: 2)
    }
    if self.beta != false {
      try visitor.visitSingularBoolField(value: self.beta, fieldNumber: 3)
    }
    if self.sandbox != false {
      try visitor.visitSingularBoolField(value: self.sandbox, fieldNumber: 4)
    }
    if self.`internal` != false {
      try visitor.visitSingularBoolField(value: self.`internal`, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_PartnerFlags) -> Bool {
    if self.suspended != other.suspended {return false}
    if self.pastdue != other.pastdue {return false}
    if self.beta != other.beta {return false}
    if self.sandbox != other.sandbox {return false}
    if self.`internal` != other.`internal` {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
