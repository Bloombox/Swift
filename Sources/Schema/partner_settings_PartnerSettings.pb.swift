// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: partner/settings/PartnerSettings.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies the concept of partner/organization-level settings.

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

/// Specifies an individual notification target for alerting.
public struct Bloombox_Schema_Partner_Settings_PartnerNotificationTarget {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Whether this notification target is currently disabled.
  public var disabled: Bool {
    get {return _storage._disabled}
    set {_uniqueStorage()._disabled = newValue}
  }

  /// Contact information for this notification target.
  public var contact: OneOf_Contact? {
    get {return _storage._contact}
    set {_uniqueStorage()._contact = newValue}
  }

  /// Phone number contact target.
  public var phone: Opencannabis_Contact_PhoneNumber {
    get {
      if case .phone(let v)? = _storage._contact {return v}
      return Opencannabis_Contact_PhoneNumber()
    }
    set {_uniqueStorage()._contact = .phone(newValue)}
  }

  /// Email address contact target.
  public var email: Opencannabis_Contact_EmailAddress {
    get {
      if case .email(let v)? = _storage._contact {return v}
      return Opencannabis_Contact_EmailAddress()
    }
    set {_uniqueStorage()._contact = .email(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Contact information for this notification target.
  public enum OneOf_Contact: Equatable {
    /// Phone number contact target.
    case phone(Opencannabis_Contact_PhoneNumber)
    /// Email address contact target.
    case email(Opencannabis_Contact_EmailAddress)

    public static func ==(lhs: Bloombox_Schema_Partner_Settings_PartnerNotificationTarget.OneOf_Contact, rhs: Bloombox_Schema_Partner_Settings_PartnerNotificationTarget.OneOf_Contact) -> Bool {
      switch (lhs, rhs) {
      case (.phone(let l), .phone(let r)): return l == r
      case (.email(let l), .email(let r)): return l == r
      default: return false
      }
    }
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies event-level alerting settings.
public struct Bloombox_Schema_Partner_Settings_PartnerEventAlertingSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies 'promo' notifications.
  public var promo: Bool = false

  /// Specifies 'security' notifications.
  public var security: Bool = false

  /// Specifies 'volume' notifications.
  public var volume: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Alerting and notification settings.
public struct Bloombox_Schema_Partner_Settings_PartnerAlertSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specify event-level alerting settings.
  public var events: Bloombox_Schema_Partner_Settings_PartnerEventAlertingSettings {
    get {return _storage._events ?? Bloombox_Schema_Partner_Settings_PartnerEventAlertingSettings()}
    set {_uniqueStorage()._events = newValue}
  }
  /// Returns true if `events` has been explicitly set.
  public var hasEvents: Bool {return _storage._events != nil}
  /// Clears the value of `events`. Subsequent reads from it will return its default value.
  public mutating func clearEvents() {_storage._events = nil}

  /// Notification targets/recipients.
  public var recipients: [Bloombox_Schema_Partner_Settings_PartnerNotificationTarget] {
    get {return _storage._recipients}
    set {_uniqueStorage()._recipients = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Beta and sandbox settings.
public struct Bloombox_Schema_Partner_Settings_BetaSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Enable access to beta systems for this partner.
  public var enable: Bool = false

  /// Enable access to sandbox resources and systems for this partner.
  public var sandbox: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Feature activation flags.
public struct Bloombox_Schema_Partner_Settings_FeatureStatus {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Whether this partner has access to analytics.
  public var analytics: Bool = false

  /// Whether this partner has access to beta features.
  public var beta: Bool = false

  /// Whether this partner has offline features.
  public var offline: Bool = false

  /// Whether this partner has access to shop features.
  public var shop: Bool = false

  /// Whether this partner has access to checkin features.
  public var checkin: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Settings related to search functionality.
public struct Bloombox_Schema_Partner_Settings_SearchSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Whether to enable search for this partner or not.
  public var enabled: Bool = false

  /// Make media uploaded by this partner searchable.
  public var media: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Partner-level account settings.
public struct Bloombox_Schema_Partner_Settings_PartnerSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Alerting and notification settings.
  public var alerts: Bloombox_Schema_Partner_Settings_PartnerAlertSettings {
    get {return _storage._alerts ?? Bloombox_Schema_Partner_Settings_PartnerAlertSettings()}
    set {_uniqueStorage()._alerts = newValue}
  }
  /// Returns true if `alerts` has been explicitly set.
  public var hasAlerts: Bool {return _storage._alerts != nil}
  /// Clears the value of `alerts`. Subsequent reads from it will return its default value.
  public mutating func clearAlerts() {_storage._alerts = nil}

  /// Beta and sandbox settings.
  public var beta: Bloombox_Schema_Partner_Settings_BetaSettings {
    get {return _storage._beta ?? Bloombox_Schema_Partner_Settings_BetaSettings()}
    set {_uniqueStorage()._beta = newValue}
  }
  /// Returns true if `beta` has been explicitly set.
  public var hasBeta: Bool {return _storage._beta != nil}
  /// Clears the value of `beta`. Subsequent reads from it will return its default value.
  public mutating func clearBeta() {_storage._beta = nil}

  /// Feature activation flags.
  public var features: Bloombox_Schema_Partner_Settings_FeatureStatus {
    get {return _storage._features ?? Bloombox_Schema_Partner_Settings_FeatureStatus()}
    set {_uniqueStorage()._features = newValue}
  }
  /// Returns true if `features` has been explicitly set.
  public var hasFeatures: Bool {return _storage._features != nil}
  /// Clears the value of `features`. Subsequent reads from it will return its default value.
  public mutating func clearFeatures() {_storage._features = nil}

  /// Search settings.
  public var search: Bloombox_Schema_Partner_Settings_SearchSettings {
    get {return _storage._search ?? Bloombox_Schema_Partner_Settings_SearchSettings()}
    set {_uniqueStorage()._search = newValue}
  }
  /// Returns true if `search` has been explicitly set.
  public var hasSearch: Bool {return _storage._search != nil}
  /// Clears the value of `search`. Subsequent reads from it will return its default value.
  public mutating func clearSearch() {_storage._search = nil}

  /// Integration settings for this location.
  public var integration: Bloombox_Schema_Partner_Integrations_PartnerIntegrationSettings {
    get {return _storage._integration ?? Bloombox_Schema_Partner_Integrations_PartnerIntegrationSettings()}
    set {_uniqueStorage()._integration = newValue}
  }
  /// Returns true if `integration` has been explicitly set.
  public var hasIntegration: Bool {return _storage._integration != nil}
  /// Clears the value of `integration`. Subsequent reads from it will return its default value.
  public mutating func clearIntegration() {_storage._integration = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.partner.settings"

extension Bloombox_Schema_Partner_Settings_PartnerNotificationTarget: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerNotificationTarget"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "disabled"),
    10: .same(proto: "phone"),
    11: .same(proto: "email"),
  ]

  fileprivate class _StorageClass {
    var _disabled: Bool = false
    var _contact: Bloombox_Schema_Partner_Settings_PartnerNotificationTarget.OneOf_Contact?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _disabled = source._disabled
      _contact = source._contact
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
        case 1: try decoder.decodeSingularBoolField(value: &_storage._disabled)
        case 10:
          var v: Opencannabis_Contact_PhoneNumber?
          if let current = _storage._contact {
            try decoder.handleConflictingOneOf()
            if case .phone(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._contact = .phone(v)}
        case 11:
          var v: Opencannabis_Contact_EmailAddress?
          if let current = _storage._contact {
            try decoder.handleConflictingOneOf()
            if case .email(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._contact = .email(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._disabled != false {
        try visitor.visitSingularBoolField(value: _storage._disabled, fieldNumber: 1)
      }
      switch _storage._contact {
      case .phone(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .email(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Settings_PartnerNotificationTarget) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._disabled != other_storage._disabled {return false}
        if _storage._contact != other_storage._contact {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_Settings_PartnerEventAlertingSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerEventAlertingSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "promo"),
    2: .same(proto: "security"),
    3: .same(proto: "volume"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.promo)
      case 2: try decoder.decodeSingularBoolField(value: &self.security)
      case 3: try decoder.decodeSingularBoolField(value: &self.volume)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.promo != false {
      try visitor.visitSingularBoolField(value: self.promo, fieldNumber: 1)
    }
    if self.security != false {
      try visitor.visitSingularBoolField(value: self.security, fieldNumber: 2)
    }
    if self.volume != false {
      try visitor.visitSingularBoolField(value: self.volume, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Settings_PartnerEventAlertingSettings) -> Bool {
    if self.promo != other.promo {return false}
    if self.security != other.security {return false}
    if self.volume != other.volume {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_Settings_PartnerAlertSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerAlertSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "events"),
    2: .same(proto: "recipients"),
  ]

  fileprivate class _StorageClass {
    var _events: Bloombox_Schema_Partner_Settings_PartnerEventAlertingSettings? = nil
    var _recipients: [Bloombox_Schema_Partner_Settings_PartnerNotificationTarget] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _events = source._events
      _recipients = source._recipients
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._events)
        case 2: try decoder.decodeRepeatedMessageField(value: &_storage._recipients)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._events {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._recipients.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._recipients, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Settings_PartnerAlertSettings) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._events != other_storage._events {return false}
        if _storage._recipients != other_storage._recipients {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_Settings_BetaSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BetaSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "enable"),
    2: .same(proto: "sandbox"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.enable)
      case 2: try decoder.decodeSingularBoolField(value: &self.sandbox)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.enable != false {
      try visitor.visitSingularBoolField(value: self.enable, fieldNumber: 1)
    }
    if self.sandbox != false {
      try visitor.visitSingularBoolField(value: self.sandbox, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Settings_BetaSettings) -> Bool {
    if self.enable != other.enable {return false}
    if self.sandbox != other.sandbox {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_Settings_FeatureStatus: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FeatureStatus"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "analytics"),
    2: .same(proto: "beta"),
    3: .same(proto: "offline"),
    4: .same(proto: "shop"),
    5: .same(proto: "checkin"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.analytics)
      case 2: try decoder.decodeSingularBoolField(value: &self.beta)
      case 3: try decoder.decodeSingularBoolField(value: &self.offline)
      case 4: try decoder.decodeSingularBoolField(value: &self.shop)
      case 5: try decoder.decodeSingularBoolField(value: &self.checkin)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.analytics != false {
      try visitor.visitSingularBoolField(value: self.analytics, fieldNumber: 1)
    }
    if self.beta != false {
      try visitor.visitSingularBoolField(value: self.beta, fieldNumber: 2)
    }
    if self.offline != false {
      try visitor.visitSingularBoolField(value: self.offline, fieldNumber: 3)
    }
    if self.shop != false {
      try visitor.visitSingularBoolField(value: self.shop, fieldNumber: 4)
    }
    if self.checkin != false {
      try visitor.visitSingularBoolField(value: self.checkin, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Settings_FeatureStatus) -> Bool {
    if self.analytics != other.analytics {return false}
    if self.beta != other.beta {return false}
    if self.offline != other.offline {return false}
    if self.shop != other.shop {return false}
    if self.checkin != other.checkin {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_Settings_SearchSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SearchSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "enabled"),
    2: .same(proto: "media"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.enabled)
      case 2: try decoder.decodeSingularBoolField(value: &self.media)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.enabled != false {
      try visitor.visitSingularBoolField(value: self.enabled, fieldNumber: 1)
    }
    if self.media != false {
      try visitor.visitSingularBoolField(value: self.media, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Settings_SearchSettings) -> Bool {
    if self.enabled != other.enabled {return false}
    if self.media != other.media {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_Settings_PartnerSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PartnerSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "alerts"),
    2: .same(proto: "beta"),
    3: .same(proto: "features"),
    4: .same(proto: "search"),
    7: .same(proto: "integration"),
  ]

  fileprivate class _StorageClass {
    var _alerts: Bloombox_Schema_Partner_Settings_PartnerAlertSettings? = nil
    var _beta: Bloombox_Schema_Partner_Settings_BetaSettings? = nil
    var _features: Bloombox_Schema_Partner_Settings_FeatureStatus? = nil
    var _search: Bloombox_Schema_Partner_Settings_SearchSettings? = nil
    var _integration: Bloombox_Schema_Partner_Integrations_PartnerIntegrationSettings? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _alerts = source._alerts
      _beta = source._beta
      _features = source._features
      _search = source._search
      _integration = source._integration
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._alerts)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._beta)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._features)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._search)
        case 7: try decoder.decodeSingularMessageField(value: &_storage._integration)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._alerts {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._beta {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._features {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._search {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._integration {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Settings_PartnerSettings) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._alerts != other_storage._alerts {return false}
        if _storage._beta != other_storage._beta {return false}
        if _storage._features != other_storage._features {return false}
        if _storage._search != other_storage._search {return false}
        if _storage._integration != other_storage._integration {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
