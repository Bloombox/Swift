// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: partner/integrations/IntegrationSettings.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies top-level or shared settings structures.

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

/// Enumerates all known Bloombox integration partners.
public enum Bloombox_Partner_Integrations_IntegrationPartner: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Internal applications and integrations.
  case `internal` // = 0

  /// Salsify - https://www.salsify.com/
  case salsify // = 1

  /// Keen IO - https://keen.io/
  case keen // = 2

  /// Greenbits - https://www.greenbits.com/
  case greenbits // = 3

  /// MailChimp - https://www.mailchimp.com/
  case mailchimp // = 4

  /// SendGrid - https://www.sendgrid.com/
  case sendgrid // = 5

  /// Twilio - https://www.twilio.com/
  case twilio // = 6

  /// OnFleet - https://www.onfleet.com/
  case onfleet // = 7

  /// Google GSuite - https://admin.google.com/
  case gsuite // = 8

  /// Treez IO - https://www.treez.io
  case treez // = 9
  case UNRECOGNIZED(Int)

  public init() {
    self = .internal
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .internal
    case 1: self = .salsify
    case 2: self = .keen
    case 3: self = .greenbits
    case 4: self = .mailchimp
    case 5: self = .sendgrid
    case 6: self = .twilio
    case 7: self = .onfleet
    case 8: self = .gsuite
    case 9: self = .treez
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .internal: return 0
    case .salsify: return 1
    case .keen: return 2
    case .greenbits: return 3
    case .mailchimp: return 4
    case .sendgrid: return 5
    case .twilio: return 6
    case .onfleet: return 7
    case .gsuite: return 8
    case .treez: return 9
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Partner_Integrations_IntegrationPartner: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Partner_Integrations_IntegrationPartner] = [
    .internal,
    .salsify,
    .keen,
    .greenbits,
    .mailchimp,
    .sendgrid,
    .twilio,
    .onfleet,
    .gsuite,
    .treez,
  ]
}

#endif  // swift(>=4.2)

/// Specifies a generic set of settings for a given integration.
public struct Bloombox_Partner_Integrations_GenericIntegrationSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the integration partner to which these settings apply for a given location.
  public var partner: Bloombox_Partner_Integrations_IntegrationPartner {
    get {return _storage._partner}
    set {_uniqueStorage()._partner = newValue}
  }

  /// Whether this integration is currently enabled.
  public var enabled: Bool {
    get {return _storage._enabled}
    set {_uniqueStorage()._enabled = newValue}
  }

  /// Whether this integration has been fully setup.
  public var fullySetup: Bool {
    get {return _storage._fullySetup}
    set {_uniqueStorage()._fullySetup = newValue}
  }

  /// Timestamp for when this integration was last tested.
  public var lastTested: Opencannabis_Temporal_Instant {
    get {return _storage._lastTested ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._lastTested = newValue}
  }
  /// Returns true if `lastTested` has been explicitly set.
  public var hasLastTested: Bool {return _storage._lastTested != nil}
  /// Clears the value of `lastTested`. Subsequent reads from it will return its default value.
  public mutating func clearLastTested() {_uniqueStorage()._lastTested = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Location-level integration settings.
public struct Bloombox_Partner_Integrations_LocationIntegrationSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies integrations that a specific location has setup.
  public var integrations: [Bloombox_Partner_Integrations_IntegrationPartner] {
    get {return _storage._integrations}
    set {_uniqueStorage()._integrations = newValue}
  }

  /// Generic settings, specified for each integration.
  public var generic: Dictionary<String,Bloombox_Partner_Integrations_GenericIntegrationSettings> {
    get {return _storage._generic}
    set {_uniqueStorage()._generic = newValue}
  }

  /// Specifies location-specific integration settings with Greenbits.
  public var greenbits: Bloombox_Partner_Integrations_Greenbits_GreenbitsSettings {
    get {return _storage._greenbits ?? Bloombox_Partner_Integrations_Greenbits_GreenbitsSettings()}
    set {_uniqueStorage()._greenbits = newValue}
  }
  /// Returns true if `greenbits` has been explicitly set.
  public var hasGreenbits: Bool {return _storage._greenbits != nil}
  /// Clears the value of `greenbits`. Subsequent reads from it will return its default value.
  public mutating func clearGreenbits() {_uniqueStorage()._greenbits = nil}

  /// Specifies location-specific integration settings with MailChimp.
  public var mailchimp: Bloombox_Partner_Integrations_Mailchimp_MailchimpSettings {
    get {return _storage._mailchimp ?? Bloombox_Partner_Integrations_Mailchimp_MailchimpSettings()}
    set {_uniqueStorage()._mailchimp = newValue}
  }
  /// Returns true if `mailchimp` has been explicitly set.
  public var hasMailchimp: Bool {return _storage._mailchimp != nil}
  /// Clears the value of `mailchimp`. Subsequent reads from it will return its default value.
  public mutating func clearMailchimp() {_uniqueStorage()._mailchimp = nil}

  /// Specifies location-specific integration settings with Sendgrid.
  public var sendgrid: Bloombox_Partner_Integrations_Sendgrid_SendgridSettings {
    get {return _storage._sendgrid ?? Bloombox_Partner_Integrations_Sendgrid_SendgridSettings()}
    set {_uniqueStorage()._sendgrid = newValue}
  }
  /// Returns true if `sendgrid` has been explicitly set.
  public var hasSendgrid: Bool {return _storage._sendgrid != nil}
  /// Clears the value of `sendgrid`. Subsequent reads from it will return its default value.
  public mutating func clearSendgrid() {_uniqueStorage()._sendgrid = nil}

  /// Specifies location-specific integration settings with Twilio.
  public var twilio: Bloombox_Partner_Integrations_Twilio_TwilioSettings {
    get {return _storage._twilio ?? Bloombox_Partner_Integrations_Twilio_TwilioSettings()}
    set {_uniqueStorage()._twilio = newValue}
  }
  /// Returns true if `twilio` has been explicitly set.
  public var hasTwilio: Bool {return _storage._twilio != nil}
  /// Clears the value of `twilio`. Subsequent reads from it will return its default value.
  public mutating func clearTwilio() {_uniqueStorage()._twilio = nil}

  /// Specifies location-specific integration settings with OnFleet.
  public var onfleet: Bloombox_Partner_Integrations_Onfleet_OnFleetSettings {
    get {return _storage._onfleet ?? Bloombox_Partner_Integrations_Onfleet_OnFleetSettings()}
    set {_uniqueStorage()._onfleet = newValue}
  }
  /// Returns true if `onfleet` has been explicitly set.
  public var hasOnfleet: Bool {return _storage._onfleet != nil}
  /// Clears the value of `onfleet`. Subsequent reads from it will return its default value.
  public mutating func clearOnfleet() {_uniqueStorage()._onfleet = nil}

  /// Specifies location-specific integration settings with Treez.
  public var treez: Bloombox_Partner_Integrations_Treez_TreezSettings {
    get {return _storage._treez ?? Bloombox_Partner_Integrations_Treez_TreezSettings()}
    set {_uniqueStorage()._treez = newValue}
  }
  /// Returns true if `treez` has been explicitly set.
  public var hasTreez: Bool {return _storage._treez != nil}
  /// Clears the value of `treez`. Subsequent reads from it will return its default value.
  public mutating func clearTreez() {_uniqueStorage()._treez = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Partner-level integration settings.
public struct Bloombox_Partner_Integrations_PartnerIntegrationSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies integrations that a specific partner has setup.
  public var integrations: [Bloombox_Partner_Integrations_IntegrationPartner] {
    get {return _storage._integrations}
    set {_uniqueStorage()._integrations = newValue}
  }

  /// Generic settings, specified for each partner-level integration.
  public var generic: Dictionary<String,Bloombox_Partner_Integrations_GenericIntegrationSettings> {
    get {return _storage._generic}
    set {_uniqueStorage()._generic = newValue}
  }

  /// Specifies location-specific integration settings with GSuite.
  public var gsuite: Bloombox_Partner_Integrations_Gsuite_GSuiteSettings {
    get {return _storage._gsuite ?? Bloombox_Partner_Integrations_Gsuite_GSuiteSettings()}
    set {_uniqueStorage()._gsuite = newValue}
  }
  /// Returns true if `gsuite` has been explicitly set.
  public var hasGsuite: Bool {return _storage._gsuite != nil}
  /// Clears the value of `gsuite`. Subsequent reads from it will return its default value.
  public mutating func clearGsuite() {_uniqueStorage()._gsuite = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.partner.integrations"

extension Bloombox_Partner_Integrations_IntegrationPartner: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "INTERNAL"),
    1: .same(proto: "SALSIFY"),
    2: .same(proto: "KEEN"),
    3: .same(proto: "GREENBITS"),
    4: .same(proto: "MAILCHIMP"),
    5: .same(proto: "SENDGRID"),
    6: .same(proto: "TWILIO"),
    7: .same(proto: "ONFLEET"),
    8: .same(proto: "GSUITE"),
    9: .same(proto: "TREEZ"),
  ]
}

extension Bloombox_Partner_Integrations_GenericIntegrationSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GenericIntegrationSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "partner"),
    2: .same(proto: "enabled"),
    3: .standard(proto: "fully_setup"),
    4: .standard(proto: "last_tested"),
  ]

  fileprivate class _StorageClass {
    var _partner: Bloombox_Partner_Integrations_IntegrationPartner = .internal
    var _enabled: Bool = false
    var _fullySetup: Bool = false
    var _lastTested: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _partner = source._partner
      _enabled = source._enabled
      _fullySetup = source._fullySetup
      _lastTested = source._lastTested
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
        case 1: try decoder.decodeSingularEnumField(value: &_storage._partner)
        case 2: try decoder.decodeSingularBoolField(value: &_storage._enabled)
        case 3: try decoder.decodeSingularBoolField(value: &_storage._fullySetup)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._lastTested)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._partner != .internal {
        try visitor.visitSingularEnumField(value: _storage._partner, fieldNumber: 1)
      }
      if _storage._enabled != false {
        try visitor.visitSingularBoolField(value: _storage._enabled, fieldNumber: 2)
      }
      if _storage._fullySetup != false {
        try visitor.visitSingularBoolField(value: _storage._fullySetup, fieldNumber: 3)
      }
      if let v = _storage._lastTested {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Partner_Integrations_GenericIntegrationSettings, rhs: Bloombox_Partner_Integrations_GenericIntegrationSettings) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._partner != rhs_storage._partner {return false}
        if _storage._enabled != rhs_storage._enabled {return false}
        if _storage._fullySetup != rhs_storage._fullySetup {return false}
        if _storage._lastTested != rhs_storage._lastTested {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Partner_Integrations_LocationIntegrationSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".LocationIntegrationSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "integrations"),
    2: .same(proto: "generic"),
    10: .same(proto: "greenbits"),
    11: .same(proto: "mailchimp"),
    12: .same(proto: "sendgrid"),
    13: .same(proto: "twilio"),
    14: .same(proto: "onfleet"),
    15: .same(proto: "treez"),
  ]

  fileprivate class _StorageClass {
    var _integrations: [Bloombox_Partner_Integrations_IntegrationPartner] = []
    var _generic: Dictionary<String,Bloombox_Partner_Integrations_GenericIntegrationSettings> = [:]
    var _greenbits: Bloombox_Partner_Integrations_Greenbits_GreenbitsSettings? = nil
    var _mailchimp: Bloombox_Partner_Integrations_Mailchimp_MailchimpSettings? = nil
    var _sendgrid: Bloombox_Partner_Integrations_Sendgrid_SendgridSettings? = nil
    var _twilio: Bloombox_Partner_Integrations_Twilio_TwilioSettings? = nil
    var _onfleet: Bloombox_Partner_Integrations_Onfleet_OnFleetSettings? = nil
    var _treez: Bloombox_Partner_Integrations_Treez_TreezSettings? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _integrations = source._integrations
      _generic = source._generic
      _greenbits = source._greenbits
      _mailchimp = source._mailchimp
      _sendgrid = source._sendgrid
      _twilio = source._twilio
      _onfleet = source._onfleet
      _treez = source._treez
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
        case 1: try decoder.decodeRepeatedEnumField(value: &_storage._integrations)
        case 2: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMessageMap<SwiftProtobuf.ProtobufString,Bloombox_Partner_Integrations_GenericIntegrationSettings>.self, value: &_storage._generic)
        case 10: try decoder.decodeSingularMessageField(value: &_storage._greenbits)
        case 11: try decoder.decodeSingularMessageField(value: &_storage._mailchimp)
        case 12: try decoder.decodeSingularMessageField(value: &_storage._sendgrid)
        case 13: try decoder.decodeSingularMessageField(value: &_storage._twilio)
        case 14: try decoder.decodeSingularMessageField(value: &_storage._onfleet)
        case 15: try decoder.decodeSingularMessageField(value: &_storage._treez)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._integrations.isEmpty {
        try visitor.visitPackedEnumField(value: _storage._integrations, fieldNumber: 1)
      }
      if !_storage._generic.isEmpty {
        try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMessageMap<SwiftProtobuf.ProtobufString,Bloombox_Partner_Integrations_GenericIntegrationSettings>.self, value: _storage._generic, fieldNumber: 2)
      }
      if let v = _storage._greenbits {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      }
      if let v = _storage._mailchimp {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      }
      if let v = _storage._sendgrid {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      }
      if let v = _storage._twilio {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 13)
      }
      if let v = _storage._onfleet {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 14)
      }
      if let v = _storage._treez {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 15)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Partner_Integrations_LocationIntegrationSettings, rhs: Bloombox_Partner_Integrations_LocationIntegrationSettings) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._integrations != rhs_storage._integrations {return false}
        if _storage._generic != rhs_storage._generic {return false}
        if _storage._greenbits != rhs_storage._greenbits {return false}
        if _storage._mailchimp != rhs_storage._mailchimp {return false}
        if _storage._sendgrid != rhs_storage._sendgrid {return false}
        if _storage._twilio != rhs_storage._twilio {return false}
        if _storage._onfleet != rhs_storage._onfleet {return false}
        if _storage._treez != rhs_storage._treez {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Partner_Integrations_PartnerIntegrationSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerIntegrationSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "integrations"),
    2: .same(proto: "generic"),
    10: .same(proto: "gsuite"),
  ]

  fileprivate class _StorageClass {
    var _integrations: [Bloombox_Partner_Integrations_IntegrationPartner] = []
    var _generic: Dictionary<String,Bloombox_Partner_Integrations_GenericIntegrationSettings> = [:]
    var _gsuite: Bloombox_Partner_Integrations_Gsuite_GSuiteSettings? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _integrations = source._integrations
      _generic = source._generic
      _gsuite = source._gsuite
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
        case 1: try decoder.decodeRepeatedEnumField(value: &_storage._integrations)
        case 2: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMessageMap<SwiftProtobuf.ProtobufString,Bloombox_Partner_Integrations_GenericIntegrationSettings>.self, value: &_storage._generic)
        case 10: try decoder.decodeSingularMessageField(value: &_storage._gsuite)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._integrations.isEmpty {
        try visitor.visitPackedEnumField(value: _storage._integrations, fieldNumber: 1)
      }
      if !_storage._generic.isEmpty {
        try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMessageMap<SwiftProtobuf.ProtobufString,Bloombox_Partner_Integrations_GenericIntegrationSettings>.self, value: _storage._generic, fieldNumber: 2)
      }
      if let v = _storage._gsuite {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Partner_Integrations_PartnerIntegrationSettings, rhs: Bloombox_Partner_Integrations_PartnerIntegrationSettings) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._integrations != rhs_storage._integrations {return false}
        if _storage._generic != rhs_storage._generic {return false}
        if _storage._gsuite != rhs_storage._gsuite {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
