// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: analytics/context/Collection.proto
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

/// Enumerates categories of events supported by the telemetry system.
public enum Bloombox_Schema_Analytics_Context_EventType: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Generic event or error report with arbitrary payload.
  case generic // = 0

  /// Commercial analytics, like purchases, orders, and so on.
  case commercial // = 1

  /// Identity analytics, like profile changes, auth grants and revocations, and so on.
  case identity // = 2

  /// Experience analytics, like pageviews, interactions, etc.
  case experience // = 3

  /// Operational analytics, like memory usage, network traffic, etc.
  case operational // = 4
  case UNRECOGNIZED(Int)

  public init() {
    self = .generic
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .generic
    case 1: self = .commercial
    case 2: self = .identity
    case 3: self = .experience
    case 4: self = .operational
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .generic: return 0
    case .commercial: return 1
    case .identity: return 2
    case .experience: return 3
    case .operational: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

/// Represents a specification for an analytics event collection.
public struct Bloombox_Schema_Analytics_Context_Collection {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies an unenumerated collection by name.
  public var name: String = String()

  /// Specifies a specific collection as internal. Backend-only flag.
  public var `internal`: Bool = false

  /// Specifies the type of event. Usually added by the telemetry backend.
  public var type: Bloombox_Schema_Analytics_Context_EventType = .generic

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.analytics.context"

extension Bloombox_Schema_Analytics_Context_EventType: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "GENERIC"),
    1: .same(proto: "COMMERCIAL"),
    2: .same(proto: "IDENTITY"),
    3: .same(proto: "EXPERIENCE"),
    4: .same(proto: "OPERATIONAL"),
  ]
}

extension Bloombox_Schema_Analytics_Context_Collection: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Collection"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "internal"),
    3: .same(proto: "type"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.name)
      case 2: try decoder.decodeSingularBoolField(value: &self.`internal`)
      case 3: try decoder.decodeSingularEnumField(value: &self.type)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if self.`internal` != false {
      try visitor.visitSingularBoolField(value: self.`internal`, fieldNumber: 2)
    }
    if self.type != .generic {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Analytics_Context_Collection) -> Bool {
    if self.name != other.name {return false}
    if self.`internal` != other.`internal` {return false}
    if self.type != other.type {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
