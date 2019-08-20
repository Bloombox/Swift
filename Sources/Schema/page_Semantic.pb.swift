// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: page/Semantic.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Models related to semantic tags and content.

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

/// Enumerates known semantic types, which are further mapped to their implementation types in each
/// semantic expression framework by implementing code.
public enum Bloombox_Page_Kind: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Default content kind: generic web page or web application.
  case webPage // = 0

  /// Master products view: listing of multiple products. Produces impression events in analytics
  /// for each section or product displayed to the user.
  case master // = 1

  /// Detail product view: information about a single product or product group. Produces view events
  /// in analytics for each product or product group displayed to the user.
  case detail // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .webPage
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .webPage
    case 1: self = .master
    case 2: self = .detail
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .webPage: return 0
    case .master: return 1
    case .detail: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Page_Kind: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Page_Kind] = [
    .webPage,
    .master,
    .detail,
  ]
}

#endif  // swift(>=4.2)

/// Enumerates semantic metadata formats that are supported for rendering into the page.
public enum Bloombox_Page_Format: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Specifies generic metadata tags as a metadata format.
  case generic // = 0

  /// Specifies OpenGraph tags as a metadata format.
  case opengraph // = 1

  /// Specifies JSON-LD as a metadata format.
  case jsonLd // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .generic
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .generic
    case 1: self = .opengraph
    case 2: self = .jsonLd
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .generic: return 0
    case .opengraph: return 1
    case .jsonLd: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Page_Format: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Page_Format] = [
    .generic,
    .opengraph,
    .jsonLd,
  ]
}

#endif  // swift(>=4.2)

/// Defines the structure of top-level metadata with regard to semantic content, attached to a given
/// web page for emission in meta tags in various formats.
public struct Bloombox_Page_SemanticMetadata {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Defines the "kind" of content contained on a given page.
  public var kind: Bloombox_Page_Kind = .webPage

  /// Formats to render semantic metadata in.
  public var format: [Bloombox_Page_Format] = []

  /// Describes page-level semantic media.
  public var media: [Bloombox_Page_MediaAsset] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.page"

extension Bloombox_Page_Kind: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "WEB_PAGE"),
    1: .same(proto: "MASTER"),
    2: .same(proto: "DETAIL"),
  ]
}

extension Bloombox_Page_Format: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "GENERIC"),
    1: .same(proto: "OPENGRAPH"),
    2: .same(proto: "JSON_LD"),
  ]
}

extension Bloombox_Page_SemanticMetadata: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SemanticMetadata"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "kind"),
    2: .same(proto: "format"),
    3: .same(proto: "media"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.kind)
      case 2: try decoder.decodeRepeatedEnumField(value: &self.format)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.media)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.kind != .webPage {
      try visitor.visitSingularEnumField(value: self.kind, fieldNumber: 1)
    }
    if !self.format.isEmpty {
      try visitor.visitPackedEnumField(value: self.format, fieldNumber: 2)
    }
    if !self.media.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.media, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Page_SemanticMetadata, rhs: Bloombox_Page_SemanticMetadata) -> Bool {
    if lhs.kind != rhs.kind {return false}
    if lhs.format != rhs.format {return false}
    if lhs.media != rhs.media {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
