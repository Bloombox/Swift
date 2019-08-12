// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: structs/Shelf.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Enumerates the "shelf" of a product. Indicates the quality of an entry.

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

/// Enumerates available 'shelf' entries, for use in retail contexts, to indicate the quality of a particular product
/// entry (usually flowers).
public enum Opencannabis_Structs_Shelf: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Default value, indicating no specific shelf choice.
  case genericShelf // = 0

  /// 'Economy' shelf. Best value for the money, generally with a focus on THC-per-gram.
  case economy // = 1

  /// 'Midshelf'. Medium-grade products that strike a balance between cost and potency/quality.
  case midshelf // = 2

  /// 'Topshelf'. High-grade, or highly-refined products, that focus on potency or quality to the exclusion or detriment
  /// of cost.
  case topshelf // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .genericShelf
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .genericShelf
    case 1: self = .economy
    case 2: self = .midshelf
    case 3: self = .topshelf
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .genericShelf: return 0
    case .economy: return 1
    case .midshelf: return 2
    case .topshelf: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Structs_Shelf: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Structs_Shelf] = [
    .genericShelf,
    .economy,
    .midshelf,
    .topshelf,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Opencannabis_Structs_Shelf: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "GENERIC_SHELF"),
    1: .same(proto: "ECONOMY"),
    2: .same(proto: "MIDSHELF"),
    3: .same(proto: "TOPSHELF"),
  ]
}
