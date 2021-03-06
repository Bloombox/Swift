// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ledger/Transaction.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Ledger transactions enable the issuance and exchange/interchange of digital assets. In the model presented herein,
/// there are two types of ledger transactions: CREATE transactions, that issue or introduce new assets, and TRANSFER
/// transactions, which enable the exchange of existing digital assets.

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

/// Transactions: CREATE. Create transactions allocate, or issue, digital assets within the context of a ledger. The
/// owner-to-be of those assets commits the transaction, signed with their private key.
public struct Bloombox_Ledger_CreateOperation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the digital asset we are creating a record for in the digital ledger. The content of this data depends on
  /// the particular asset being stored.
  public var asset: Bloombox_Ledger_DigitalAsset {
    get {return _storage._asset ?? Bloombox_Ledger_DigitalAsset()}
    set {_uniqueStorage()._asset = newValue}
  }
  /// Returns true if `asset` has been explicitly set.
  public var hasAsset: Bool {return _storage._asset != nil}
  /// Clears the value of `asset`. Subsequent reads from it will return its default value.
  public mutating func clearAsset() {_uniqueStorage()._asset = nil}

  /// Specifies the acting identity on the ledger for this transaction. In the context of a CREATE transaction, this is
  /// the final owner of the digital asset after execution.
  public var owner: Bloombox_Ledger_LedgerIdentity {
    get {return _storage._owner ?? Bloombox_Ledger_LedgerIdentity()}
    set {_uniqueStorage()._owner = newValue}
  }
  /// Returns true if `owner` has been explicitly set.
  public var hasOwner: Bool {return _storage._owner != nil}
  /// Clears the value of `owner`. Subsequent reads from it will return its default value.
  public mutating func clearOwner() {_uniqueStorage()._owner = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Transactions: TRANSFER. Transfer transactions enable the interchange of existing digital assets, and, as such, always
/// follow a CREATE transaction in the lifecycle of an asset.
public struct Bloombox_Ledger_TransferOperation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the underlying digital asset being transferred. TRANSFER transactions specify digital assets by
  /// reference. It is worth noting here that an asset's ID is equal to the CREATE transaction's ID that created it.
  public var asset: Bloombox_Ledger_AssetKey {
    get {return _storage._asset ?? Bloombox_Ledger_AssetKey()}
    set {_uniqueStorage()._asset = newValue}
  }
  /// Returns true if `asset` has been explicitly set.
  public var hasAsset: Bool {return _storage._asset != nil}
  /// Clears the value of `asset`. Subsequent reads from it will return its default value.
  public mutating func clearAsset() {_uniqueStorage()._asset = nil}

  /// Specifies the acting identity on the ledger for this transaction. In the case of a TRANSFER, it must be the
  /// authorized owner of the asset in its current state, in order to fully authorize the underlying asset's transfer.
  public var source: Bloombox_Ledger_LedgerIdentity {
    get {return _storage._source ?? Bloombox_Ledger_LedgerIdentity()}
    set {_uniqueStorage()._source = newValue}
  }
  /// Returns true if `source` has been explicitly set.
  public var hasSource: Bool {return _storage._source != nil}
  /// Clears the value of `source`. Subsequent reads from it will return its default value.
  public mutating func clearSource() {_uniqueStorage()._source = nil}

  /// Specifies the identity of the future-owner of the digital asset, should this transaction be deemed valid and then
  /// accepted to the ledger. That is to say, this is the "recipient" in the transaction.
  public var target: Bloombox_Ledger_LedgerIdentity {
    get {return _storage._target ?? Bloombox_Ledger_LedgerIdentity()}
    set {_uniqueStorage()._target = newValue}
  }
  /// Returns true if `target` has been explicitly set.
  public var hasTarget: Bool {return _storage._target != nil}
  /// Clears the value of `target`. Subsequent reads from it will return its default value.
  public mutating func clearTarget() {_uniqueStorage()._target = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Specifies the concept of a transaction "key," which may or may not be based on the transaction's ID, and may be
/// allocated outside of the transaction's commitment lifecycle (i.e. to track an in-flight transaction).
public struct Bloombox_Ledger_TransactionKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the 'XID', or eXternal ID, for a given transaction. External IDs are not required to be dependent on
  /// signed transaction content.
  public var xid: String = String()

  /// Specifies the 'ID' of a transaction, which, in the context of a blockchain or distributed ledger, may be entirely
  /// based on the content and private-key signature of the subject transaction.
  public var id: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Describes the structure of an individual transaction on the ledger. This serves as the main structural specification
/// for a transaction, by operating as a generic container of both CREATE and TRANSFER operations.
public struct Bloombox_Ledger_Transaction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Key for the transaction, which may consist of an ID (calculated from the underlying transaction content), and/or
  /// an XID (external ID, which is independent of the transaction content and committment status).
  public var key: Bloombox_Ledger_TransactionKey {
    get {return _storage._key ?? Bloombox_Ledger_TransactionKey()}
    set {_uniqueStorage()._key = newValue}
  }
  /// Returns true if `key` has been explicitly set.
  public var hasKey: Bool {return _storage._key != nil}
  /// Clears the value of `key`. Subsequent reads from it will return its default value.
  public mutating func clearKey() {_uniqueStorage()._key = nil}

  /// Operation mode of this transaction. Can either be CREATE or TRANSFER. Create transactions perform the issuance of
  /// digital assets, and TRANSFER transactions perform their interchange.
  public var operation: Bloombox_Ledger_Transaction.Operation {
    get {return _storage._operation}
    set {_uniqueStorage()._operation = newValue}
  }

  /// Union property, holding the actual transaction payload, depending on the type of transaction being transmitted or
  /// expressed for serialization.
  public var txn: OneOf_Txn? {
    get {return _storage._txn}
    set {_uniqueStorage()._txn = newValue}
  }

  /// Specifies a payload for an asset CREATE transaction.
  public var issuance: Bloombox_Ledger_CreateOperation {
    get {
      if case .issuance(let v)? = _storage._txn {return v}
      return Bloombox_Ledger_CreateOperation()
    }
    set {_uniqueStorage()._txn = .issuance(newValue)}
  }

  /// Specifies a payload for an asset TRANSFER transaction.
  public var interchange: Bloombox_Ledger_TransferOperation {
    get {
      if case .interchange(let v)? = _storage._txn {return v}
      return Bloombox_Ledger_TransferOperation()
    }
    set {_uniqueStorage()._txn = .interchange(newValue)}
  }

  /// Timestamp for when this ledger transaction was created.
  public var created: Opencannabis_Temporal_Instant {
    get {return _storage._created ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._created = newValue}
  }
  /// Returns true if `created` has been explicitly set.
  public var hasCreated: Bool {return _storage._created != nil}
  /// Clears the value of `created`. Subsequent reads from it will return its default value.
  public mutating func clearCreated() {_uniqueStorage()._created = nil}

  /// Timestamp for when this ledger transaction was last modified.
  public var modified: Opencannabis_Temporal_Instant {
    get {return _storage._modified ?? Opencannabis_Temporal_Instant()}
    set {_uniqueStorage()._modified = newValue}
  }
  /// Returns true if `modified` has been explicitly set.
  public var hasModified: Bool {return _storage._modified != nil}
  /// Clears the value of `modified`. Subsequent reads from it will return its default value.
  public mutating func clearModified() {_uniqueStorage()._modified = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Union property, holding the actual transaction payload, depending on the type of transaction being transmitted or
  /// expressed for serialization.
  public enum OneOf_Txn: Equatable {
    /// Specifies a payload for an asset CREATE transaction.
    case issuance(Bloombox_Ledger_CreateOperation)
    /// Specifies a payload for an asset TRANSFER transaction.
    case interchange(Bloombox_Ledger_TransferOperation)

  #if !swift(>=4.1)
    public static func ==(lhs: Bloombox_Ledger_Transaction.OneOf_Txn, rhs: Bloombox_Ledger_Transaction.OneOf_Txn) -> Bool {
      switch (lhs, rhs) {
      case (.issuance(let l), .issuance(let r)): return l == r
      case (.interchange(let l), .interchange(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  /// Enumerates the types of operations supported via this interface. At the time of writing, supported transaction
  /// types include CREATE and TRANSFER.
  public enum Operation: SwiftProtobuf.Enum {
    public typealias RawValue = Int

    /// CREATE operations perform the issuance of digital assets.
    case create // = 0

    /// TRANSFER operations perform the interchange of existing digital assets.
    case transfer // = 1
    case UNRECOGNIZED(Int)

    public init() {
      self = .create
    }

    public init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .create
      case 1: self = .transfer
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    public var rawValue: Int {
      switch self {
      case .create: return 0
      case .transfer: return 1
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

#if swift(>=4.2)

extension Bloombox_Ledger_Transaction.Operation: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Ledger_Transaction.Operation] = [
    .create,
    .transfer,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.ledger"

extension Bloombox_Ledger_CreateOperation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CreateOperation"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "asset"),
    2: .same(proto: "owner"),
  ]

  fileprivate class _StorageClass {
    var _asset: Bloombox_Ledger_DigitalAsset? = nil
    var _owner: Bloombox_Ledger_LedgerIdentity? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _asset = source._asset
      _owner = source._owner
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._asset)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._owner)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._asset {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._owner {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Ledger_CreateOperation, rhs: Bloombox_Ledger_CreateOperation) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._asset != rhs_storage._asset {return false}
        if _storage._owner != rhs_storage._owner {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Ledger_TransferOperation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TransferOperation"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "asset"),
    2: .same(proto: "source"),
    3: .same(proto: "target"),
  ]

  fileprivate class _StorageClass {
    var _asset: Bloombox_Ledger_AssetKey? = nil
    var _source: Bloombox_Ledger_LedgerIdentity? = nil
    var _target: Bloombox_Ledger_LedgerIdentity? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _asset = source._asset
      _source = source._source
      _target = source._target
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._asset)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._source)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._target)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._asset {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._source {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._target {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Ledger_TransferOperation, rhs: Bloombox_Ledger_TransferOperation) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._asset != rhs_storage._asset {return false}
        if _storage._source != rhs_storage._source {return false}
        if _storage._target != rhs_storage._target {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Ledger_TransactionKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TransactionKey"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "xid"),
    2: .same(proto: "id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.xid)
      case 2: try decoder.decodeSingularStringField(value: &self.id)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.xid.isEmpty {
      try visitor.visitSingularStringField(value: self.xid, fieldNumber: 1)
    }
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Ledger_TransactionKey, rhs: Bloombox_Ledger_TransactionKey) -> Bool {
    if lhs.xid != rhs.xid {return false}
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Ledger_Transaction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Transaction"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "operation"),
    10: .same(proto: "issuance"),
    11: .same(proto: "interchange"),
    98: .same(proto: "created"),
    99: .same(proto: "modified"),
  ]

  fileprivate class _StorageClass {
    var _key: Bloombox_Ledger_TransactionKey? = nil
    var _operation: Bloombox_Ledger_Transaction.Operation = .create
    var _txn: Bloombox_Ledger_Transaction.OneOf_Txn?
    var _created: Opencannabis_Temporal_Instant? = nil
    var _modified: Opencannabis_Temporal_Instant? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _key = source._key
      _operation = source._operation
      _txn = source._txn
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._key)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._operation)
        case 10:
          var v: Bloombox_Ledger_CreateOperation?
          if let current = _storage._txn {
            try decoder.handleConflictingOneOf()
            if case .issuance(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._txn = .issuance(v)}
        case 11:
          var v: Bloombox_Ledger_TransferOperation?
          if let current = _storage._txn {
            try decoder.handleConflictingOneOf()
            if case .interchange(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._txn = .interchange(v)}
        case 98: try decoder.decodeSingularMessageField(value: &_storage._created)
        case 99: try decoder.decodeSingularMessageField(value: &_storage._modified)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._key {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if _storage._operation != .create {
        try visitor.visitSingularEnumField(value: _storage._operation, fieldNumber: 2)
      }
      switch _storage._txn {
      case .issuance(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .interchange(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case nil: break
      }
      if let v = _storage._created {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 98)
      }
      if let v = _storage._modified {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 99)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Ledger_Transaction, rhs: Bloombox_Ledger_Transaction) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._key != rhs_storage._key {return false}
        if _storage._operation != rhs_storage._operation {return false}
        if _storage._txn != rhs_storage._txn {return false}
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

extension Bloombox_Ledger_Transaction.Operation: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "CREATE"),
    1: .same(proto: "TRANSFER"),
  ]
}
