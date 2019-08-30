// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: partner/Partner.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies the structure of a Bloombox partner record, which represents an organizational customer. Partners are the
/// root container for user data. Locations are under partners, and menus, members, orders, and other datapoints are all
/// specified under partner locations.

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
public enum Bloombox_Partner_PartnerChannel: SwiftProtobuf.Enum {
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

#if swift(>=4.2)

extension Bloombox_Partner_PartnerChannel: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Partner_PartnerChannel] = [
    .direct,
  ]
}

#endif  // swift(>=4.2)

/// Describes subscription information for a given partner account, including their active billing tier, billing mode,
/// and any other state or configuration properties related to their billing setup.
public struct Bloombox_Partner_PartnerBillingAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Customer ID in billing systems.
  public var customerID: String = String()

  /// Tier at which this partner is billed for their locations.
  public var tier: Bloombox_Billing_BillingTier = .standard

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies information about a partner organization that has an account opened with Bloombox. A partner can own/manage
/// multiple `Location`s, and is identified uniquely by a short `code`, which is a lowercase string suitable for use in
/// a URL as a slug.
public struct Bloombox_Partner_Partner {
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
  public var flags: Bloombox_Partner_PartnerFlags {
    get {return _storage._flags ?? Bloombox_Partner_PartnerFlags()}
    set {_uniqueStorage()._flags = newValue}
  }
  /// Returns true if `flags` has been explicitly set.
  public var hasFlags: Bool {return _storage._flags != nil}
  /// Clears the value of `flags`. Subsequent reads from it will return its default value.
  public mutating func clearFlags() {_uniqueStorage()._flags = nil}

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
  public mutating func clearContact() {_uniqueStorage()._contact = nil}

  /// Branding information for this organization.
  public var branding: Opencannabis_Content_Brand {
    get {return _storage._branding ?? Opencannabis_Content_Brand()}
    set {_uniqueStorage()._branding = newValue}
  }
  /// Returns true if `branding` has been explicitly set.
  public var hasBranding: Bool {return _storage._branding != nil}
  /// Clears the value of `branding`. Subsequent reads from it will return its default value.
  public mutating func clearBranding() {_uniqueStorage()._branding = nil}

  /// Channel through which this partner organization interacts with Bloombox.
  public var channel: Bloombox_Partner_PartnerChannel {
    get {return _storage._channel}
    set {_uniqueStorage()._channel = newValue}
  }

  /// Settings for this partner.
  public var settings: Bloombox_Partner_Settings_PartnerSettings {
    get {return _storage._settings ?? Bloombox_Partner_Settings_PartnerSettings()}
    set {_uniqueStorage()._settings = newValue}
  }
  /// Returns true if `settings` has been explicitly set.
  public var hasSettings: Bool {return _storage._settings != nil}
  /// Clears the value of `settings`. Subsequent reads from it will return its default value.
  public mutating func clearSettings() {_uniqueStorage()._settings = nil}

  /// Location records attached to this partner.
  public var location: [Bloombox_Partner_PartnerLocation] {
    get {return _storage._location}
    set {_uniqueStorage()._location = newValue}
  }

  /// Access policy records attached to this partner.
  public var policy: [Bloombox_Security_Access_AccessPolicy] {
    get {return _storage._policy}
    set {_uniqueStorage()._policy = newValue}
  }

  /// Requests for access to a given partner scope.
  public var accessRequest: [Bloombox_Security_Access_AccessRequest] {
    get {return _storage._accessRequest}
    set {_uniqueStorage()._accessRequest = newValue}
  }

  /// Billing account configuration for this partner.
  public var billing: Bloombox_Partner_PartnerBillingAccount {
    get {return _storage._billing ?? Bloombox_Partner_PartnerBillingAccount()}
    set {_uniqueStorage()._billing = newValue}
  }
  /// Returns true if `billing` has been explicitly set.
  public var hasBilling: Bool {return _storage._billing != nil}
  /// Clears the value of `billing`. Subsequent reads from it will return its default value.
  public mutating func clearBilling() {_uniqueStorage()._billing = nil}

  /// Timestamp for when this record was created.
  public var created: Opencannabis_Temporal_Instant {
    get {return _storage._created ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._created = newValue}
  }
  /// Returns true if `created` has been explicitly set.
  public var hasCreated: Bool {return _storage._created != nil}
  /// Clears the value of `created`. Subsequent reads from it will return its default value.
  public mutating func clearCreated() {_uniqueStorage()._created = nil}

  /// Timestamp for when this record was last modified.
  public var modified: Opencannabis_Temporal_Instant {
    get {return _storage._modified ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._modified = newValue}
  }
  /// Returns true if `modified` has been explicitly set.
  public var hasModified: Bool {return _storage._modified != nil}
  /// Clears the value of `modified`. Subsequent reads from it will return its default value.
  public mutating func clearModified() {_uniqueStorage()._modified = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.partner"

extension Bloombox_Partner_PartnerChannel: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DIRECT"),
  ]
}

extension Bloombox_Partner_PartnerBillingAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerBillingAccount"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "customer_id"),
    2: .same(proto: "tier"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.customerID)
      case 2: try decoder.decodeSingularEnumField(value: &self.tier)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.customerID.isEmpty {
      try visitor.visitSingularStringField(value: self.customerID, fieldNumber: 1)
    }
    if self.tier != .standard {
      try visitor.visitSingularEnumField(value: self.tier, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Partner_PartnerBillingAccount, rhs: Bloombox_Partner_PartnerBillingAccount) -> Bool {
    if lhs.customerID != rhs.customerID {return false}
    if lhs.tier != rhs.tier {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Partner_Partner: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Partner"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "code"),
    2: .same(proto: "name"),
    3: .same(proto: "flags"),
    4: .standard(proto: "legal_name"),
    5: .same(proto: "contact"),
    6: .same(proto: "branding"),
    7: .same(proto: "channel"),
    8: .same(proto: "settings"),
    9: .same(proto: "location"),
    10: .same(proto: "policy"),
    11: .standard(proto: "access_request"),
    12: .same(proto: "billing"),
    100: .same(proto: "created"),
    101: .same(proto: "modified"),
  ]

  fileprivate class _StorageClass {
    var _code: String = String()
    var _name: String = String()
    var _flags: Bloombox_Partner_PartnerFlags? = nil
    var _legalName: String = String()
    var _contact: Opencannabis_Contact_ContactInfo? = nil
    var _branding: Opencannabis_Content_Brand? = nil
    var _channel: Bloombox_Partner_PartnerChannel = .direct
    var _settings: Bloombox_Partner_Settings_PartnerSettings? = nil
    var _location: [Bloombox_Partner_PartnerLocation] = []
    var _policy: [Bloombox_Security_Access_AccessPolicy] = []
    var _accessRequest: [Bloombox_Security_Access_AccessRequest] = []
    var _billing: Bloombox_Partner_PartnerBillingAccount? = nil
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
      _settings = source._settings
      _location = source._location
      _policy = source._policy
      _accessRequest = source._accessRequest
      _billing = source._billing
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
        case 8: try decoder.decodeSingularMessageField(value: &_storage._settings)
        case 9: try decoder.decodeRepeatedMessageField(value: &_storage._location)
        case 10: try decoder.decodeRepeatedMessageField(value: &_storage._policy)
        case 11: try decoder.decodeRepeatedMessageField(value: &_storage._accessRequest)
        case 12: try decoder.decodeSingularMessageField(value: &_storage._billing)
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
      if let v = _storage._settings {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
      }
      if !_storage._location.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._location, fieldNumber: 9)
      }
      if !_storage._policy.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._policy, fieldNumber: 10)
      }
      if !_storage._accessRequest.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._accessRequest, fieldNumber: 11)
      }
      if let v = _storage._billing {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
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

  public static func ==(lhs: Bloombox_Partner_Partner, rhs: Bloombox_Partner_Partner) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._code != rhs_storage._code {return false}
        if _storage._name != rhs_storage._name {return false}
        if _storage._flags != rhs_storage._flags {return false}
        if _storage._legalName != rhs_storage._legalName {return false}
        if _storage._contact != rhs_storage._contact {return false}
        if _storage._branding != rhs_storage._branding {return false}
        if _storage._channel != rhs_storage._channel {return false}
        if _storage._settings != rhs_storage._settings {return false}
        if _storage._location != rhs_storage._location {return false}
        if _storage._policy != rhs_storage._policy {return false}
        if _storage._accessRequest != rhs_storage._accessRequest {return false}
        if _storage._billing != rhs_storage._billing {return false}
        if _storage._created != rhs_storage._created {return false}
        if _storage._modified != rhs_storage._modified {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
