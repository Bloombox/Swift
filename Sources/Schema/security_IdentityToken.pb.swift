// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: security/IdentityToken.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies the notion of a user identity token, which is used to specify/transmit/emit user authorization assertion
/// materials to frontends (in particular, web).

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

/// Enumerates identity token issuers, or authorizing IdPs (Identity Providers). Internal authorization refers to systems
/// internal to Bloombox, where a system account is authorizing some resource. Otherwise, Firebase is the main auth
/// mechanism for end-users.
public enum Bloombox_Security_IdentityTokenIssuer: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Internal, Bloombox-system account authentication.
  case `internal` // = 0

  /// Firebase end-user authentication.
  case firebase // = 1

  /// Auth0-powered authentication.
  case auth0 // = 2

  /// GSuite-powered authentication.
  case google // = 3

  /// Second-party domain authentication, perhaps via SAML or other SSO technologies.
  case domain // = 4

  /// External IDP-powered authentication.
  case external // = 5
  case UNRECOGNIZED(Int)

  public init() {
    self = .internal
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .internal
    case 1: self = .firebase
    case 2: self = .auth0
    case 3: self = .google
    case 4: self = .domain
    case 5: self = .external
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .internal: return 0
    case .firebase: return 1
    case .auth0: return 2
    case .google: return 3
    case .domain: return 4
    case .external: return 5
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Security_IdentityTokenIssuer: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Security_IdentityTokenIssuer] = [
    .internal,
    .firebase,
    .auth0,
    .google,
    .domain,
    .external,
  ]
}

#endif  // swift(>=4.2)

/// Specifies an individual token asserting the identity of a user. An identity token does not make any claim related to
/// authorization, only identity.
public struct Bloombox_Security_IdentityToken {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// ID for the subject user.
  public var uid: String = String()

  /// Encoded JWT identity token.
  public var encoded: String = String()

  /// Token issuer, or authorizing IdP (Identity Provider).
  public var issuer: Bloombox_Security_IdentityTokenIssuer = .internal

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.security"

extension Bloombox_Security_IdentityTokenIssuer: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "INTERNAL"),
    1: .same(proto: "FIREBASE"),
    2: .same(proto: "AUTH0"),
    3: .same(proto: "GOOGLE"),
    4: .same(proto: "DOMAIN"),
    5: .same(proto: "EXTERNAL"),
  ]
}

extension Bloombox_Security_IdentityToken: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".IdentityToken"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uid"),
    2: .same(proto: "encoded"),
    3: .same(proto: "issuer"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.uid)
      case 2: try decoder.decodeSingularStringField(value: &self.encoded)
      case 3: try decoder.decodeSingularEnumField(value: &self.issuer)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.uid.isEmpty {
      try visitor.visitSingularStringField(value: self.uid, fieldNumber: 1)
    }
    if !self.encoded.isEmpty {
      try visitor.visitSingularStringField(value: self.encoded, fieldNumber: 2)
    }
    if self.issuer != .internal {
      try visitor.visitSingularEnumField(value: self.issuer, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Security_IdentityToken, rhs: Bloombox_Security_IdentityToken) -> Bool {
    if lhs.uid != rhs.uid {return false}
    if lhs.encoded != rhs.encoded {return false}
    if lhs.issuer != rhs.issuer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
