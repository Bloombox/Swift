// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: temporal/Interval.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Provides time interval-related models.

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

/// Enumerates supported time interval types.
public enum Opencannabis_Temporal_Interval: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Specifies the default value of a minute-scale window.
  case minutely // = 0

  /// Specifies an hour-scale window.
  case hourly // = 1

  /// Specifies a day-scale window.
  case daily // = 2

  /// Specifies a week-scale window.
  case weekly // = 3

  /// Specifies a calendar month-scale window.
  case monthly // = 4
  case UNRECOGNIZED(Int)

  public init() {
    self = .minutely
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .minutely
    case 1: self = .hourly
    case 2: self = .daily
    case 3: self = .weekly
    case 4: self = .monthly
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .minutely: return 0
    case .hourly: return 1
    case .daily: return 2
    case .weekly: return 3
    case .monthly: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Temporal_Interval: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Temporal_Interval] = [
    .minutely,
    .hourly,
    .daily,
    .weekly,
    .monthly,
  ]
}

#endif  // swift(>=4.2)

/// Specifies time interval information.
public struct Opencannabis_Temporal_TimeInterval {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the type of interval.
  public var interval: Opencannabis_Temporal_Interval = .minutely

  /// Optional: specifies the interval border.
  public var every: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.temporal"

extension Opencannabis_Temporal_Interval: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "MINUTELY"),
    1: .same(proto: "HOURLY"),
    2: .same(proto: "DAILY"),
    3: .same(proto: "WEEKLY"),
    4: .same(proto: "MONTHLY"),
  ]
}

extension Opencannabis_Temporal_TimeInterval: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TimeInterval"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "interval"),
    2: .same(proto: "every"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.interval)
      case 2: try decoder.decodeSingularUInt32Field(value: &self.every)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.interval != .minutely {
      try visitor.visitSingularEnumField(value: self.interval, fieldNumber: 1)
    }
    if self.every != 0 {
      try visitor.visitSingularUInt32Field(value: self.every, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Temporal_TimeInterval, rhs: Opencannabis_Temporal_TimeInterval) -> Bool {
    if lhs.interval != rhs.interval {return false}
    if lhs.every != rhs.every {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
