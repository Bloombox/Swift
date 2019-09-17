// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: partner/PartnerScope.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies authentication/authorization scopes that may be granted by/on behalf of/for a Bloombox partner record, or
/// Bloombox partner location record.

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

/// Specifies authentication scopes at the partner level.
public enum Bloombox_Partner_PartnerScope: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Basic authentication as a member of a partner. This includes partner staff, managers, owners, and so on.
  case auth // = 0

  /// Authorizes the sharing of contact information related to a partner account.
  case contact // = 1

  /// Authorizes access to the Dashboard for a given partner account.
  case dashboard // = 2

  /// Authorizes access to read menu data for a given partner account.
  case menuDataRead // = 10

  /// Authorizes access to write menu data for a given partner account.
  case menuDataWrite // = 20

  /// Authorizes access to read partner-level settings.
  case settingsRead // = 50

  /// Authorizes access to write to partner-level settings.
  case settingsWrite // = 51

  /// Specifies complete and total admin access to a given partner account.
  case admin // = 100
  case UNRECOGNIZED(Int)

  public init() {
    self = .auth
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .auth
    case 1: self = .contact
    case 2: self = .dashboard
    case 10: self = .menuDataRead
    case 20: self = .menuDataWrite
    case 50: self = .settingsRead
    case 51: self = .settingsWrite
    case 100: self = .admin
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .auth: return 0
    case .contact: return 1
    case .dashboard: return 2
    case .menuDataRead: return 10
    case .menuDataWrite: return 20
    case .settingsRead: return 50
    case .settingsWrite: return 51
    case .admin: return 100
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Partner_PartnerScope: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Partner_PartnerScope] = [
    .auth,
    .contact,
    .dashboard,
    .menuDataRead,
    .menuDataWrite,
    .settingsRead,
    .settingsWrite,
    .admin,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Bloombox_Partner_PartnerScope: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "AUTH"),
    1: .same(proto: "CONTACT"),
    2: .same(proto: "DASHBOARD"),
    10: .same(proto: "MENU_DATA_READ"),
    20: .same(proto: "MENU_DATA_WRITE"),
    50: .same(proto: "SETTINGS_READ"),
    51: .same(proto: "SETTINGS_WRITE"),
    100: .same(proto: "ADMIN"),
  ]
}
