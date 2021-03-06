// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: commerce/Order.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies the notion of a Commercial Order, which is a request to purchase a set of products, by a customer (which is
/// defined as a person in a transactional context). Orders are composed of Items which reference menu products.

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

/// Specifies the type of order requested.
public enum Opencannabis_Commerce_OrderType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Express pickup order.
  case pickup // = 0

  /// Delivery order.
  case delivery // = 1

  /// Order submitted on-site at a retail location.
  case onsite // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .pickup
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .pickup
    case 1: self = .delivery
    case 2: self = .onsite
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .pickup: return 0
    case .delivery: return 1
    case .onsite: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Commerce_OrderType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Commerce_OrderType] = [
    .pickup,
    .delivery,
    .onsite,
  ]
}

#endif  // swift(>=4.2)

/// Specifies the types of delivery timing.
public enum Opencannabis_Commerce_SchedulingType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// As soon as possible.
  case asap // = 0

  /// Desired time.
  case timed // = 1
  case UNRECOGNIZED(Int)

  public init() {
    self = .asap
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .asap
    case 1: self = .timed
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .asap: return 0
    case .timed: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Commerce_SchedulingType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Commerce_SchedulingType] = [
    .asap,
    .timed,
  ]
}

#endif  // swift(>=4.2)

/// Enumeration for current status of order
public enum Opencannabis_Commerce_OrderStatus: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Order has been submitted and is not yet approved.
  case pending // = 0

  /// Order has been approved for fulfillment.
  case approved // = 1

  /// Order could not be fulfilled for some reason.
  case rejected // = 2

  /// Order has been assigned.
  case assigned // = 3

  /// Order is en-route to the user (for delivery).
  case enRoute // = 4

  /// Order has been fulfilled and is considered complete.
  case fulfilled // = 5
  case UNRECOGNIZED(Int)

  public init() {
    self = .pending
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .pending
    case 1: self = .approved
    case 2: self = .rejected
    case 3: self = .assigned
    case 4: self = .enRoute
    case 5: self = .fulfilled
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .pending: return 0
    case .approved: return 1
    case .rejected: return 2
    case .assigned: return 3
    case .enRoute: return 4
    case .fulfilled: return 5
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Commerce_OrderStatus: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Commerce_OrderStatus] = [
    .pending,
    .approved,
    .rejected,
    .assigned,
    .enRoute,
    .fulfilled,
  ]
}

#endif  // swift(>=4.2)

/// Specifies the desired timing of the delivery order.
public struct Opencannabis_Commerce_OrderScheduling {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Scheduling type, either 'ASAP' or a target time.
  public var scheduling: Opencannabis_Commerce_SchedulingType {
    get {return _storage._scheduling}
    set {_uniqueStorage()._scheduling = newValue}
  }

  /// Desired delivery time, if specified.
  public var desiredTime: Opencannabis_Temporal_Instant {
    get {return _storage._desiredTime ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._desiredTime = newValue}
  }
  /// Returns true if `desiredTime` has been explicitly set.
  public var hasDesiredTime: Bool {return _storage._desiredTime != nil}
  /// Clears the value of `desiredTime`. Subsequent reads from it will return its default value.
  public mutating func clearDesiredTime() {_uniqueStorage()._desiredTime = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Information about payment status and info for an order.
public struct Opencannabis_Commerce_OrderPayment {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Status of payment for this order.
  public var status: Opencannabis_Commerce_PaymentStatus = .notApplicable

  /// Method of payment used on this order.
  public var method: Opencannabis_Commerce_PaymentMethod = .cash

  /// Amount of tax added to the subtotal.
  public var tax: Double = 0

  /// Amount the user has paid so far for this order.
  public var paid: Double = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies a moment at which an order changed status, when it happened, and, optionally, why.
public struct Opencannabis_Commerce_StatusCheckin {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Status the order moved to.
  public var status: Opencannabis_Commerce_OrderStatus {
    get {return _storage._status}
    set {_uniqueStorage()._status = newValue}
  }

  /// Instant the order was moved to this status.
  public var instant: Opencannabis_Temporal_Instant {
    get {return _storage._instant ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._instant = newValue}
  }
  /// Returns true if `instant` has been explicitly set.
  public var hasInstant: Bool {return _storage._instant != nil}
  /// Clears the value of `instant`. Subsequent reads from it will return its default value.
  public mutating func clearInstant() {_uniqueStorage()._instant = nil}

  /// Message or reason given for this status change, if any.
  public var message: String {
    get {return _storage._message}
    set {_uniqueStorage()._message = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies a unique key for a commercial order.
public struct Opencannabis_Commerce_OrderKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Order ID, assigned by the server upon creation.
  public var id: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Represents a full order submitted to the server for fulfillment, from an end-user, for delivery or express pickup.
public struct Opencannabis_Commerce_Order {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// ID assigned to the order by the server, and potentially nominated by the client.
  public var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  /// Type of order requested: `PICKUP`, `DELIVERY` or `ONSITE`.
  public var type: Opencannabis_Commerce_OrderType {
    get {return _storage._type}
    set {_uniqueStorage()._type = newValue}
  }

  /// Current status of this order.
  public var status: Opencannabis_Commerce_OrderStatus {
    get {return _storage._status}
    set {_uniqueStorage()._status = newValue}
  }

  /// Customer that submitted this order.
  public var customer: Opencannabis_Commerce_Customer {
    get {return _storage._customer ?? Opencannabis_Commerce_Customer()}
    set {_uniqueStorage()._customer = newValue}
  }
  /// Returns true if `customer` has been explicitly set.
  public var hasCustomer: Bool {return _storage._customer != nil}
  /// Clears the value of `customer`. Subsequent reads from it will return its default value.
  public mutating func clearCustomer() {_uniqueStorage()._customer = nil}

  /// Scheduling spec for this order.
  public var scheduling: Opencannabis_Commerce_OrderScheduling {
    get {return _storage._scheduling ?? Opencannabis_Commerce_OrderScheduling()}
    set {_uniqueStorage()._scheduling = newValue}
  }
  /// Returns true if `scheduling` has been explicitly set.
  public var hasScheduling: Bool {return _storage._scheduling != nil}
  /// Clears the value of `scheduling`. Subsequent reads from it will return its default value.
  public mutating func clearScheduling() {_uniqueStorage()._scheduling = nil}

  /// Location for delivery, if applicable.
  public var destination: Opencannabis_Commerce_DeliveryDestination {
    get {return _storage._destination ?? Opencannabis_Commerce_DeliveryDestination()}
    set {_uniqueStorage()._destination = newValue}
  }
  /// Returns true if `destination` has been explicitly set.
  public var hasDestination: Bool {return _storage._destination != nil}
  /// Clears the value of `destination`. Subsequent reads from it will return its default value.
  public mutating func clearDestination() {_uniqueStorage()._destination = nil}

  /// User-provided notes or questions, if any.
  public var notes: String {
    get {return _storage._notes}
    set {_uniqueStorage()._notes = newValue}
  }

  /// Items being ordered.
  public var item: [Opencannabis_Commerce_Item] {
    get {return _storage._item}
    set {_uniqueStorage()._item = newValue}
  }

  /// Actions taken on this order.
  public var actionLog: [Opencannabis_Commerce_StatusCheckin] {
    get {return _storage._actionLog}
    set {_uniqueStorage()._actionLog = newValue}
  }

  /// When this order was created.
  public var createdAt: Opencannabis_Temporal_Instant {
    get {return _storage._createdAt ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._createdAt = newValue}
  }
  /// Returns true if `createdAt` has been explicitly set.
  public var hasCreatedAt: Bool {return _storage._createdAt != nil}
  /// Clears the value of `createdAt`. Subsequent reads from it will return its default value.
  public mutating func clearCreatedAt() {_uniqueStorage()._createdAt = nil}

  /// Order subtotal.
  public var subtotal: Double {
    get {return _storage._subtotal}
    set {_uniqueStorage()._subtotal = newValue}
  }

  /// When this order was created.
  public var updatedAt: Opencannabis_Temporal_Instant {
    get {return _storage._updatedAt ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._updatedAt = newValue}
  }
  /// Returns true if `updatedAt` has been explicitly set.
  public var hasUpdatedAt: Bool {return _storage._updatedAt != nil}
  /// Clears the value of `updatedAt`. Subsequent reads from it will return its default value.
  public mutating func clearUpdatedAt() {_uniqueStorage()._updatedAt = nil}

  /// Session ID that was active when this order was submitted.
  public var sid: String {
    get {return _storage._sid}
    set {_uniqueStorage()._sid = newValue}
  }

  /// Payment information/metadata for this order, if applicable.
  public var payment: Opencannabis_Commerce_OrderPayment {
    get {return _storage._payment ?? Opencannabis_Commerce_OrderPayment()}
    set {_uniqueStorage()._payment = newValue}
  }
  /// Returns true if `payment` has been explicitly set.
  public var hasPayment: Bool {return _storage._payment != nil}
  /// Clears the value of `payment`. Subsequent reads from it will return its default value.
  public mutating func clearPayment() {_uniqueStorage()._payment = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.commerce"

extension Opencannabis_Commerce_OrderType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PICKUP"),
    1: .same(proto: "DELIVERY"),
    2: .same(proto: "ONSITE"),
  ]
}

extension Opencannabis_Commerce_SchedulingType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ASAP"),
    1: .same(proto: "TIMED"),
  ]
}

extension Opencannabis_Commerce_OrderStatus: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PENDING"),
    1: .same(proto: "APPROVED"),
    2: .same(proto: "REJECTED"),
    3: .same(proto: "ASSIGNED"),
    4: .same(proto: "EN_ROUTE"),
    5: .same(proto: "FULFILLED"),
  ]
}

extension Opencannabis_Commerce_OrderScheduling: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OrderScheduling"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "scheduling"),
    2: .standard(proto: "desired_time"),
  ]

  fileprivate class _StorageClass {
    var _scheduling: Opencannabis_Commerce_SchedulingType = .asap
    var _desiredTime: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _scheduling = source._scheduling
      _desiredTime = source._desiredTime
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
        case 1: try decoder.decodeSingularEnumField(value: &_storage._scheduling)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._desiredTime)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._scheduling != .asap {
        try visitor.visitSingularEnumField(value: _storage._scheduling, fieldNumber: 1)
      }
      if let v = _storage._desiredTime {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Commerce_OrderScheduling, rhs: Opencannabis_Commerce_OrderScheduling) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._scheduling != rhs_storage._scheduling {return false}
        if _storage._desiredTime != rhs_storage._desiredTime {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Commerce_OrderPayment: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OrderPayment"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
    2: .same(proto: "method"),
    3: .same(proto: "tax"),
    4: .same(proto: "paid"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.status)
      case 2: try decoder.decodeSingularEnumField(value: &self.method)
      case 3: try decoder.decodeSingularDoubleField(value: &self.tax)
      case 4: try decoder.decodeSingularDoubleField(value: &self.paid)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.status != .notApplicable {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 1)
    }
    if self.method != .cash {
      try visitor.visitSingularEnumField(value: self.method, fieldNumber: 2)
    }
    if self.tax != 0 {
      try visitor.visitSingularDoubleField(value: self.tax, fieldNumber: 3)
    }
    if self.paid != 0 {
      try visitor.visitSingularDoubleField(value: self.paid, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Commerce_OrderPayment, rhs: Opencannabis_Commerce_OrderPayment) -> Bool {
    if lhs.status != rhs.status {return false}
    if lhs.method != rhs.method {return false}
    if lhs.tax != rhs.tax {return false}
    if lhs.paid != rhs.paid {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Commerce_StatusCheckin: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".StatusCheckin"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
    2: .same(proto: "instant"),
    3: .same(proto: "message"),
  ]

  fileprivate class _StorageClass {
    var _status: Opencannabis_Commerce_OrderStatus = .pending
    var _instant: Opencannabis_Temporal_Instant? = nil
    var _message: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _status = source._status
      _instant = source._instant
      _message = source._message
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
        case 1: try decoder.decodeSingularEnumField(value: &_storage._status)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._instant)
        case 3: try decoder.decodeSingularStringField(value: &_storage._message)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._status != .pending {
        try visitor.visitSingularEnumField(value: _storage._status, fieldNumber: 1)
      }
      if let v = _storage._instant {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if !_storage._message.isEmpty {
        try visitor.visitSingularStringField(value: _storage._message, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Commerce_StatusCheckin, rhs: Opencannabis_Commerce_StatusCheckin) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._status != rhs_storage._status {return false}
        if _storage._instant != rhs_storage._instant {return false}
        if _storage._message != rhs_storage._message {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Commerce_OrderKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".OrderKey"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Commerce_OrderKey, rhs: Opencannabis_Commerce_OrderKey) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Commerce_Order: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Order"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "type"),
    3: .same(proto: "status"),
    4: .same(proto: "customer"),
    5: .same(proto: "scheduling"),
    6: .same(proto: "destination"),
    7: .same(proto: "notes"),
    8: .same(proto: "item"),
    9: .standard(proto: "action_log"),
    10: .standard(proto: "created_at"),
    11: .same(proto: "subtotal"),
    12: .standard(proto: "updated_at"),
    13: .same(proto: "sid"),
    14: .same(proto: "payment"),
  ]

  fileprivate class _StorageClass {
    var _id: String = String()
    var _type: Opencannabis_Commerce_OrderType = .pickup
    var _status: Opencannabis_Commerce_OrderStatus = .pending
    var _customer: Opencannabis_Commerce_Customer? = nil
    var _scheduling: Opencannabis_Commerce_OrderScheduling? = nil
    var _destination: Opencannabis_Commerce_DeliveryDestination? = nil
    var _notes: String = String()
    var _item: [Opencannabis_Commerce_Item] = []
    var _actionLog: [Opencannabis_Commerce_StatusCheckin] = []
    var _createdAt: Opencannabis_Temporal_Instant? = nil
    var _subtotal: Double = 0
    var _updatedAt: Opencannabis_Temporal_Instant? = nil
    var _sid: String = String()
    var _payment: Opencannabis_Commerce_OrderPayment? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _type = source._type
      _status = source._status
      _customer = source._customer
      _scheduling = source._scheduling
      _destination = source._destination
      _notes = source._notes
      _item = source._item
      _actionLog = source._actionLog
      _createdAt = source._createdAt
      _subtotal = source._subtotal
      _updatedAt = source._updatedAt
      _sid = source._sid
      _payment = source._payment
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
        case 2: try decoder.decodeSingularEnumField(value: &_storage._type)
        case 3: try decoder.decodeSingularEnumField(value: &_storage._status)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._customer)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._scheduling)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._destination)
        case 7: try decoder.decodeSingularStringField(value: &_storage._notes)
        case 8: try decoder.decodeRepeatedMessageField(value: &_storage._item)
        case 9: try decoder.decodeRepeatedMessageField(value: &_storage._actionLog)
        case 10: try decoder.decodeSingularMessageField(value: &_storage._createdAt)
        case 11: try decoder.decodeSingularDoubleField(value: &_storage._subtotal)
        case 12: try decoder.decodeSingularMessageField(value: &_storage._updatedAt)
        case 13: try decoder.decodeSingularStringField(value: &_storage._sid)
        case 14: try decoder.decodeSingularMessageField(value: &_storage._payment)
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
      if _storage._type != .pickup {
        try visitor.visitSingularEnumField(value: _storage._type, fieldNumber: 2)
      }
      if _storage._status != .pending {
        try visitor.visitSingularEnumField(value: _storage._status, fieldNumber: 3)
      }
      if let v = _storage._customer {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._scheduling {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._destination {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if !_storage._notes.isEmpty {
        try visitor.visitSingularStringField(value: _storage._notes, fieldNumber: 7)
      }
      if !_storage._item.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._item, fieldNumber: 8)
      }
      if !_storage._actionLog.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._actionLog, fieldNumber: 9)
      }
      if let v = _storage._createdAt {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      }
      if _storage._subtotal != 0 {
        try visitor.visitSingularDoubleField(value: _storage._subtotal, fieldNumber: 11)
      }
      if let v = _storage._updatedAt {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      }
      if !_storage._sid.isEmpty {
        try visitor.visitSingularStringField(value: _storage._sid, fieldNumber: 13)
      }
      if let v = _storage._payment {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 14)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Commerce_Order, rhs: Opencannabis_Commerce_Order) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._id != rhs_storage._id {return false}
        if _storage._type != rhs_storage._type {return false}
        if _storage._status != rhs_storage._status {return false}
        if _storage._customer != rhs_storage._customer {return false}
        if _storage._scheduling != rhs_storage._scheduling {return false}
        if _storage._destination != rhs_storage._destination {return false}
        if _storage._notes != rhs_storage._notes {return false}
        if _storage._item != rhs_storage._item {return false}
        if _storage._actionLog != rhs_storage._actionLog {return false}
        if _storage._createdAt != rhs_storage._createdAt {return false}
        if _storage._subtotal != rhs_storage._subtotal {return false}
        if _storage._updatedAt != rhs_storage._updatedAt {return false}
        if _storage._sid != rhs_storage._sid {return false}
        if _storage._payment != rhs_storage._payment {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
