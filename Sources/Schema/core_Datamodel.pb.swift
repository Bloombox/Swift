// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: core/Datamodel.proto
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

/// Specifies how a sub-object in a particular message should be persisted.
public enum Core_CollectionMode: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// `NESTED` mode stores the specified collection within the parent document.
  case nested // = 0

  /// `COLLECTION` mode stores the specified collection as a subcollection under the parent document.
  case collection // = 1

  /// `GROUP` mode stores the specified collection at the root of the data system.
  case group // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .nested
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .nested
    case 1: self = .collection
    case 2: self = .group
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .nested: return 0
    case .collection: return 1
    case .group: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Core_CollectionMode: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Core_CollectionMode] = [
    .nested,
    .collection,
    .group,
  ]
}

#endif  // swift(>=4.2)

/// Enumerates field handling special-cases. Fields may be annotated with these special types to change the way they are
/// handled by the model mapping layer.
public enum Core_FieldType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// This is a standard field (default value).
  case standard // = 0

  /// This is a key field (a primary key submessage) for a GROUP or COLLECTION-moded message.
  case key // = 1

  /// This is an ID field that should be used as the final name of this document.
  case id // = 2

  /// This is a tags-style field.
  case tags // = 3

  /// Store this object as a special flags-style mapping.
  case flags // = 4
  case UNRECOGNIZED(Int)

  public init() {
    self = .standard
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .standard
    case 1: self = .key
    case 2: self = .id
    case 3: self = .tags
    case 4: self = .flags
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .standard: return 0
    case .key: return 1
    case .id: return 2
    case .tags: return 3
    case .flags: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Core_FieldType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Core_FieldType] = [
    .standard,
    .key,
    .id,
    .tags,
    .flags,
  ]
}

#endif  // swift(>=4.2)

/// Specifies options related to persistence of underlying model data associated with this particular message type. This
/// includes settings related to Firestore and other data engines.
public struct Core_PersistenceOptions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the storage mode for this entity.
  public var mode: Core_CollectionMode = .nested

  /// Data path for a given message, with items in the URL corresponding to parameters in the item's key path.
  public var path: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Options specific to model integration with table-style engines, where there can be a table name and/or description
/// that should be mapped to a particular message structure.
public struct Core_TableOptions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Name of the table bound to this model.
  public var name: String = String()

  /// Description for the table bound to this model.
  public var description_p: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies options related to storing a sub-message.
public struct Core_SubmessageOptions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Collection storage mode for the given sub-message field.
  public var mode: Core_CollectionMode = .nested

  /// Data path for the given sub-message field.
  public var path: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Persistence/data engine options specific to an individual message field.
public struct Core_FieldPersistenceOptions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Field type, for special-case fields.
  public var type: Core_FieldType = .standard

  /// String description of this field included in schemas.
  public var description_p: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies options specific to storing this field in a tabular-style data engine.
public struct Core_TableFieldOptions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Marks this field as `REQUIRED` in tabular schemas.
  public var require: Bool = false

  /// Marks this field as ignored for serialization in tabular circumstances.
  public var ignore: Bool = false

  /// Overrides the BigQuery type associated with the exported form of this message.
  public var bqtype: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies mappings for an arbitrary protobuf message object.
public struct Core_ObjectMapping {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Maps an enumeration instance to this object. Enumeration membership is contextual.
  public var instance: [String] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Extension support defined in Datamodel.proto.

extension Google_Protobuf_EnumValueOptions {

  /// Human-readable label for a given enumeration value state. Optional, can be used by invoking code to generate labels
  /// for states in forms or other UI.
  public var Core_label: String {
    get {return getExtensionValue(ext: Core_Extensions_label) ?? String()}
    set {setExtensionValue(ext: Core_Extensions_label, value: newValue)}
  }
  /// Returns true if extension `Core_Extensions_label`
  /// has been explicitly set.
  public var hasCore_label: Bool {
    return hasExtensionValue(ext: Core_Extensions_label)
  }
  /// Clears the value of extension `Core_Extensions_label`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCore_label() {
    clearExtensionValue(ext: Core_Extensions_label)
  }

  /// Color code value for a given enumerated value state. Optional, can be used by invoking code to generate UI schemes.
  public var Core_color: Opencannabis_Content_Color {
    get {return getExtensionValue(ext: Core_Extensions_color) ?? Opencannabis_Content_Color()}
    set {setExtensionValue(ext: Core_Extensions_color, value: newValue)}
  }
  /// Returns true if extension `Core_Extensions_color`
  /// has been explicitly set.
  public var hasCore_color: Bool {
    return hasExtensionValue(ext: Core_Extensions_color)
  }
  /// Clears the value of extension `Core_Extensions_color`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCore_color() {
    clearExtensionValue(ext: Core_Extensions_color)
  }
}

extension Google_Protobuf_FieldOptions {

  /// Database engine persistence options specific to an individual document field.
  public var Core_field: Core_FieldPersistenceOptions {
    get {return getExtensionValue(ext: Core_Extensions_field) ?? Core_FieldPersistenceOptions()}
    set {setExtensionValue(ext: Core_Extensions_field, value: newValue)}
  }
  /// Returns true if extension `Core_Extensions_field`
  /// has been explicitly set.
  public var hasCore_field: Bool {
    return hasExtensionValue(ext: Core_Extensions_field)
  }
  /// Clears the value of extension `Core_Extensions_field`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCore_field() {
    clearExtensionValue(ext: Core_Extensions_field)
  }

  /// Specifies options related to storage of this field in a tabular-style data engine.
  public var Core_column: Core_TableFieldOptions {
    get {return getExtensionValue(ext: Core_Extensions_column) ?? Core_TableFieldOptions()}
    set {setExtensionValue(ext: Core_Extensions_column, value: newValue)}
  }
  /// Returns true if extension `Core_Extensions_column`
  /// has been explicitly set.
  public var hasCore_column: Bool {
    return hasExtensionValue(ext: Core_Extensions_column)
  }
  /// Clears the value of extension `Core_Extensions_column`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCore_column() {
    clearExtensionValue(ext: Core_Extensions_column)
  }

  /// Specifies options related to storage of a submessage-typed field.
  public var Core_collection: Core_SubmessageOptions {
    get {return getExtensionValue(ext: Core_Extensions_collection) ?? Core_SubmessageOptions()}
    set {setExtensionValue(ext: Core_Extensions_collection, value: newValue)}
  }
  /// Returns true if extension `Core_Extensions_collection`
  /// has been explicitly set.
  public var hasCore_collection: Bool {
    return hasExtensionValue(ext: Core_Extensions_collection)
  }
  /// Clears the value of extension `Core_Extensions_collection`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCore_collection() {
    clearExtensionValue(ext: Core_Extensions_collection)
  }
}

extension Google_Protobuf_MessageOptions {

  /// Settings specific to how a particular message entity is stored in the underlying persistence engine. For Bloombox,
  /// this generally means Cloud Firestore.
  public var Core_db: Core_PersistenceOptions {
    get {return getExtensionValue(ext: Core_Extensions_db) ?? Core_PersistenceOptions()}
    set {setExtensionValue(ext: Core_Extensions_db, value: newValue)}
  }
  /// Returns true if extension `Core_Extensions_db`
  /// has been explicitly set.
  public var hasCore_db: Bool {
    return hasExtensionValue(ext: Core_Extensions_db)
  }
  /// Clears the value of extension `Core_Extensions_db`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCore_db() {
    clearExtensionValue(ext: Core_Extensions_db)
  }

  /// Table-specific configuration for this message. Kicks in when engines are in play that observe or couch data in a
  /// table/row-style pattern. Usually used for integration with BigQuery.
  public var Core_table: Core_TableOptions {
    get {return getExtensionValue(ext: Core_Extensions_table) ?? Core_TableOptions()}
    set {setExtensionValue(ext: Core_Extensions_table, value: newValue)}
  }
  /// Returns true if extension `Core_Extensions_table`
  /// has been explicitly set.
  public var hasCore_table: Bool {
    return hasExtensionValue(ext: Core_Extensions_table)
  }
  /// Clears the value of extension `Core_Extensions_table`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCore_table() {
    clearExtensionValue(ext: Core_Extensions_table)
  }

  /// Settings that determine meta-mappings between this message object and enumerated states, declared in a foreign
  /// structure. Foreign structure mappings are contextually defined by the invoking application.
  public var Core_map: Core_ObjectMapping {
    get {return getExtensionValue(ext: Core_Extensions_map) ?? Core_ObjectMapping()}
    set {setExtensionValue(ext: Core_Extensions_map, value: newValue)}
  }
  /// Returns true if extension `Core_Extensions_map`
  /// has been explicitly set.
  public var hasCore_map: Bool {
    return hasExtensionValue(ext: Core_Extensions_map)
  }
  /// Clears the value of extension `Core_Extensions_map`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearCore_map() {
    clearExtensionValue(ext: Core_Extensions_map)
  }

}

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
public let Core_Datamodel_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  Core_Extensions_db,
  Core_Extensions_table,
  Core_Extensions_map,
  Core_Extensions_field,
  Core_Extensions_column,
  Core_Extensions_collection,
  Core_Extensions_label,
  Core_Extensions_color
]

/// Settings specific to how a particular message entity is stored in the underlying persistence engine. For Bloombox,
/// this generally means Cloud Firestore.
let Core_Extensions_db = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Core_PersistenceOptions>, Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 6000,
  fieldName: "core.db"
)

/// Table-specific configuration for this message. Kicks in when engines are in play that observe or couch data in a
/// table/row-style pattern. Usually used for integration with BigQuery.
let Core_Extensions_table = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Core_TableOptions>, Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 6001,
  fieldName: "core.table"
)

/// Settings that determine meta-mappings between this message object and enumerated states, declared in a foreign
/// structure. Foreign structure mappings are contextually defined by the invoking application.
let Core_Extensions_map = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Core_ObjectMapping>, Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 6002,
  fieldName: "core.map"
)

/// Database engine persistence options specific to an individual document field.
let Core_Extensions_field = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Core_FieldPersistenceOptions>, Google_Protobuf_FieldOptions>(
  _protobuf_fieldNumber: 7000,
  fieldName: "core.field"
)

/// Specifies options related to storage of this field in a tabular-style data engine.
let Core_Extensions_column = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Core_TableFieldOptions>, Google_Protobuf_FieldOptions>(
  _protobuf_fieldNumber: 7001,
  fieldName: "core.column"
)

/// Specifies options related to storage of a submessage-typed field.
let Core_Extensions_collection = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Core_SubmessageOptions>, Google_Protobuf_FieldOptions>(
  _protobuf_fieldNumber: 7002,
  fieldName: "core.collection"
)

/// Human-readable label for a given enumeration value state. Optional, can be used by invoking code to generate labels
/// for states in forms or other UI.
let Core_Extensions_label = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, Google_Protobuf_EnumValueOptions>(
  _protobuf_fieldNumber: 8003,
  fieldName: "core.label"
)

/// Color code value for a given enumerated value state. Optional, can be used by invoking code to generate UI schemes.
let Core_Extensions_color = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Opencannabis_Content_Color>, Google_Protobuf_EnumValueOptions>(
  _protobuf_fieldNumber: 8004,
  fieldName: "core.color"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "core"

extension Core_CollectionMode: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NESTED"),
    1: .same(proto: "COLLECTION"),
    2: .same(proto: "GROUP"),
  ]
}

extension Core_FieldType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "STANDARD"),
    1: .same(proto: "KEY"),
    2: .same(proto: "ID"),
    3: .same(proto: "TAGS"),
    4: .same(proto: "FLAGS"),
  ]
}

extension Core_PersistenceOptions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PersistenceOptions"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "mode"),
    2: .same(proto: "path"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.mode)
      case 2: try decoder.decodeSingularStringField(value: &self.path)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.mode != .nested {
      try visitor.visitSingularEnumField(value: self.mode, fieldNumber: 1)
    }
    if !self.path.isEmpty {
      try visitor.visitSingularStringField(value: self.path, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_PersistenceOptions, rhs: Core_PersistenceOptions) -> Bool {
    if lhs.mode != rhs.mode {return false}
    if lhs.path != rhs.path {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_TableOptions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TableOptions"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "description"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.name)
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_TableOptions, rhs: Core_TableOptions) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_SubmessageOptions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SubmessageOptions"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "mode"),
    3: .same(proto: "path"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.mode)
      case 3: try decoder.decodeSingularStringField(value: &self.path)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.mode != .nested {
      try visitor.visitSingularEnumField(value: self.mode, fieldNumber: 1)
    }
    if !self.path.isEmpty {
      try visitor.visitSingularStringField(value: self.path, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_SubmessageOptions, rhs: Core_SubmessageOptions) -> Bool {
    if lhs.mode != rhs.mode {return false}
    if lhs.path != rhs.path {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_FieldPersistenceOptions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FieldPersistenceOptions"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "description"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.type)
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.type != .standard {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_FieldPersistenceOptions, rhs: Core_FieldPersistenceOptions) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_TableFieldOptions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TableFieldOptions"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "require"),
    2: .same(proto: "ignore"),
    3: .same(proto: "bqtype"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.require)
      case 2: try decoder.decodeSingularBoolField(value: &self.ignore)
      case 3: try decoder.decodeSingularStringField(value: &self.bqtype)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.require != false {
      try visitor.visitSingularBoolField(value: self.require, fieldNumber: 1)
    }
    if self.ignore != false {
      try visitor.visitSingularBoolField(value: self.ignore, fieldNumber: 2)
    }
    if !self.bqtype.isEmpty {
      try visitor.visitSingularStringField(value: self.bqtype, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_TableFieldOptions, rhs: Core_TableFieldOptions) -> Bool {
    if lhs.require != rhs.require {return false}
    if lhs.ignore != rhs.ignore {return false}
    if lhs.bqtype != rhs.bqtype {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Core_ObjectMapping: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ObjectMapping"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "instance"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.instance)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.instance.isEmpty {
      try visitor.visitRepeatedStringField(value: self.instance, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Core_ObjectMapping, rhs: Core_ObjectMapping) -> Bool {
    if lhs.instance != rhs.instance {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
