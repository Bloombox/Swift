// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: analytics/search/SearchProperty.proto
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

/// Specifies digital properties that support fulltext search, for the purpose of enumerating where a search came from,
/// or was submitted from, during analytics processing.
public enum Bloombox_Analytics_Search_SearchProperty: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The origin property was left unspecified or it was unrecognized.
  case propertyUnspecified // = 0

  /// The search was submitted via the web.
  case web // = 1

  /// The search was submitted via a tablet menu system.
  case tablet // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .propertyUnspecified
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .propertyUnspecified
    case 1: self = .web
    case 2: self = .tablet
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .propertyUnspecified: return 0
    case .web: return 1
    case .tablet: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Analytics_Search_SearchProperty: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Analytics_Search_SearchProperty] = [
    .propertyUnspecified,
    .web,
    .tablet,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Bloombox_Analytics_Search_SearchProperty: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PROPERTY_UNSPECIFIED"),
    1: .same(proto: "WEB"),
    2: .same(proto: "TABLET"),
  ]
}
