// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: temporal/Instant.proto
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

/// Specifies a particular moment in time.
public struct Opencannabis_Temporal_Instant {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Instant specification option.
  public var spec: Opencannabis_Temporal_Instant.OneOf_Spec? = nil

  /// ISO8601-formatted timestamp.
  public var iso8601: String {
    get {
      if case .iso8601(let v)? = spec {return v}
      return String()
    }
    set {spec = .iso8601(newValue)}
  }

  /// Unix epoch timestamp, at millisecond resolution.
  public var timestamp: UInt64 {
    get {
      if case .timestamp(let v)? = spec {return v}
      return 0
    }
    set {spec = .timestamp(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Instant specification option.
  public enum OneOf_Spec: Equatable {
    /// ISO8601-formatted timestamp.
    case iso8601(String)
    /// Unix epoch timestamp, at millisecond resolution.
    case timestamp(UInt64)

    public static func ==(lhs: Opencannabis_Temporal_Instant.OneOf_Spec, rhs: Opencannabis_Temporal_Instant.OneOf_Spec) -> Bool {
      switch (lhs, rhs) {
      case (.iso8601(let l), .iso8601(let r)): return l == r
      case (.timestamp(let l), .timestamp(let r)): return l == r
      default: return false
      }
    }
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.temporal"

extension Opencannabis_Temporal_Instant: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Instant"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "iso8601"),
    2: .same(proto: "timestamp"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1:
        if self.spec != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.spec = .iso8601(v)}
      case 2:
        if self.spec != nil {try decoder.handleConflictingOneOf()}
        var v: UInt64?
        try decoder.decodeSingularUInt64Field(value: &v)
        if let v = v {self.spec = .timestamp(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self.spec {
    case .iso8601(let v)?:
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    case .timestamp(let v)?:
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 2)
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Opencannabis_Temporal_Instant) -> Bool {
    if self.spec != other.spec {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
