// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: partner/PartnerLocation.proto
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

/// Specifies a key that references a location owned by a partner organization that has an active account with Bloombox.
public struct Bloombox_Schema_Partner_PartnerLocationKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the partner that owns this location.
  public var partner: Bloombox_Schema_Partner_PartnerKey {
    get {return _storage._partner ?? Bloombox_Schema_Partner_PartnerKey()}
    set {_uniqueStorage()._partner = newValue}
  }
  /// Returns true if `partner` has been explicitly set.
  public var hasPartner: Bool {return _storage._partner != nil}
  /// Clears the value of `partner`. Subsequent reads from it will return its default value.
  public mutating func clearPartner() {_storage._partner = nil}

  /// Short string that uniquely identifies this location, under a given partner account.
  public var code: String {
    get {return _storage._code}
    set {_uniqueStorage()._code = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies information about a brick-and-mortar location owned by a partner organization that has an active account
/// with Bloombox.
public struct Bloombox_Schema_Partner_PartnerLocation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Short, unique string that identifies this location, scoped to the parent organization.
  public var code: String {
    get {return _storage._code}
    set {_uniqueStorage()._code = newValue}
  }

  /// Partner record that owns this location.
  public var partner: Bloombox_Schema_Partner_Partner {
    get {return _storage._partner ?? Bloombox_Schema_Partner_Partner()}
    set {_uniqueStorage()._partner = newValue}
  }
  /// Returns true if `partner` has been explicitly set.
  public var hasPartner: Bool {return _storage._partner != nil}
  /// Clears the value of `partner`. Subsequent reads from it will return its default value.
  public mutating func clearPartner() {_storage._partner = nil}

  /// Name of this location, in human-readable verbose form.
  public var name: String {
    get {return _storage._name}
    set {_uniqueStorage()._name = newValue}
  }

  /// Label for this location in the administrative dashboard. If this is not specified, `name` is shown.
  public var label: String {
    get {return _storage._label}
    set {_uniqueStorage()._label = newValue}
  }

  /// Flags that specify conditions applied to this partner location.
  public var flags: Bloombox_Schema_Partner_PartnerFlags {
    get {return _storage._flags ?? Bloombox_Schema_Partner_PartnerFlags()}
    set {_uniqueStorage()._flags = newValue}
  }
  /// Returns true if `flags` has been explicitly set.
  public var hasFlags: Bool {return _storage._flags != nil}
  /// Clears the value of `flags`. Subsequent reads from it will return its default value.
  public mutating func clearFlags() {_storage._flags = nil}

  /// Contact information for this location.
  public var contact: Opencannabis_Contact_ContactInfo {
    get {return _storage._contact ?? Opencannabis_Contact_ContactInfo()}
    set {_uniqueStorage()._contact = newValue}
  }
  /// Returns true if `contact` has been explicitly set.
  public var hasContact: Bool {return _storage._contact != nil}
  /// Clears the value of `contact`. Subsequent reads from it will return its default value.
  public mutating func clearContact() {_storage._contact = nil}

  /// Branding specific to this location. Partner-level branding is used if this is left unspecified.
  public var branding: Opencannabis_Media_MediaItem {
    get {return _storage._branding ?? Opencannabis_Media_MediaItem()}
    set {_uniqueStorage()._branding = newValue}
  }
  /// Returns true if `branding` has been explicitly set.
  public var hasBranding: Bool {return _storage._branding != nil}
  /// Clears the value of `branding`. Subsequent reads from it will return its default value.
  public mutating func clearBranding() {_storage._branding = nil}

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

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.partner"

extension Bloombox_Schema_Partner_PartnerLocationKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerLocationKey"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "partner"),
    2: .same(proto: "code"),
  ]

  fileprivate class _StorageClass {
    var _partner: Bloombox_Schema_Partner_PartnerKey? = nil
    var _code: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _partner = source._partner
      _code = source._code
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._partner)
        case 2: try decoder.decodeSingularStringField(value: &_storage._code)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._partner {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._code.isEmpty {
        try visitor.visitSingularStringField(value: _storage._code, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_PartnerLocationKey) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._partner != other_storage._partner {return false}
        if _storage._code != other_storage._code {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_PartnerLocation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerLocation"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "code"),
    2: .same(proto: "partner"),
    3: .same(proto: "name"),
    4: .same(proto: "label"),
    5: .same(proto: "flags"),
    7: .same(proto: "contact"),
    6: .same(proto: "branding"),
    8: .same(proto: "created"),
    9: .same(proto: "modified"),
  ]

  fileprivate class _StorageClass {
    var _code: String = String()
    var _partner: Bloombox_Schema_Partner_Partner? = nil
    var _name: String = String()
    var _label: String = String()
    var _flags: Bloombox_Schema_Partner_PartnerFlags? = nil
    var _contact: Opencannabis_Contact_ContactInfo? = nil
    var _branding: Opencannabis_Media_MediaItem? = nil
    var _created: Opencannabis_Temporal_Instant? = nil
    var _modified: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _code = source._code
      _partner = source._partner
      _name = source._name
      _label = source._label
      _flags = source._flags
      _contact = source._contact
      _branding = source._branding
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
        case 2: try decoder.decodeSingularMessageField(value: &_storage._partner)
        case 3: try decoder.decodeSingularStringField(value: &_storage._name)
        case 4: try decoder.decodeSingularStringField(value: &_storage._label)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._flags)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._branding)
        case 7: try decoder.decodeSingularMessageField(value: &_storage._contact)
        case 8: try decoder.decodeSingularMessageField(value: &_storage._created)
        case 9: try decoder.decodeSingularMessageField(value: &_storage._modified)
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
      if let v = _storage._partner {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 3)
      }
      if !_storage._label.isEmpty {
        try visitor.visitSingularStringField(value: _storage._label, fieldNumber: 4)
      }
      if let v = _storage._flags {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._branding {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if let v = _storage._contact {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
      }
      if let v = _storage._created {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
      }
      if let v = _storage._modified {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_PartnerLocation) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._code != other_storage._code {return false}
        if _storage._partner != other_storage._partner {return false}
        if _storage._name != other_storage._name {return false}
        if _storage._label != other_storage._label {return false}
        if _storage._flags != other_storage._flags {return false}
        if _storage._contact != other_storage._contact {return false}
        if _storage._branding != other_storage._branding {return false}
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
