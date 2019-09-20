// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: platform/v1/PlatformService_v1.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies the Platform API, which provides core functionality that is either used broadly or across different
/// product offerings.

import Foundation
import SwiftProtobuf
import OpenCannabis

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Enumerates known errors that may be thrown by platform API operations.
public enum Bloombox_Services_Platform_V1_PlatformError: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// No error was encountered.
  case noError // = 0

  /// Search services are not currently available.
  case searchNotAvailable // = 1

  /// The domain origin value was missing or invalid.
  case originInvalid // = 2

  /// The specified domain or origin could not be resolved.
  case originNotFound // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .noError
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .noError
    case 1: self = .searchNotAvailable
    case 2: self = .originInvalid
    case 3: self = .originNotFound
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .noError: return 0
    case .searchNotAvailable: return 1
    case .originInvalid: return 2
    case .originNotFound: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Services_Platform_V1_PlatformError: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Services_Platform_V1_PlatformError] = [
    .noError,
    .searchNotAvailable,
    .originInvalid,
    .originNotFound,
  ]
}

#endif  // swift(>=4.2)

/// Specifies the status of this service in PING responses.
public enum Bloombox_Services_Platform_V1_PlatformServiceStatus: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The state of the service is not known.
  case unknown // = 0

  /// The service is up and functioning normally.
  case up // = 1

  /// The service is down.
  case down // = 2

  /// The service is under maintenance.
  case maintenance // = 3
  case UNRECOGNIZED(Int)

  public init() {
    self = .unknown
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unknown
    case 1: self = .up
    case 2: self = .down
    case 3: self = .maintenance
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unknown: return 0
    case .up: return 1
    case .down: return 2
    case .maintenance: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Services_Platform_V1_PlatformServiceStatus: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Services_Platform_V1_PlatformServiceStatus] = [
    .unknown,
    .up,
    .down,
    .maintenance,
  ]
}

#endif  // swift(>=4.2)

/// Specifies an RPC operation to retrieve status information for the Checkin API.
public struct Bloombox_Services_Platform_V1_Ping {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies a platform ping request.
  public struct Request {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Specifies a platform ping response.
  public struct Response {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Current service status.
    public var status: Bloombox_Services_Platform_V1_PlatformServiceStatus = .unknown

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  public init() {}
}

/// Specifies an RPC operation to retrieve system health status for automated external systems.
public struct Bloombox_Services_Platform_V1_Healthcheck {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies a health-check request.
  public struct Request {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Name of the probe that is measuring health. Arbitrary string to identify the source of healthcheck traffic.
    public var probe: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  public init() {}
}

/// Specifies the notion of a "referenced" location, which is a foreign object representing an "other" location when
/// operating from the perspective of a given partner location.
public struct Bloombox_Services_Platform_V1_ReferencedLocation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the ID for a given reference location.
  public var id: String = String()

  /// Specifies a string name for a given reference location.
  public var name: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies an RPC operation to retrieve information for a given partner domain.
public struct Bloombox_Services_Platform_V1_DomainResolve {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Request to retrieve information about a partner domain.
  public struct Request {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Base64-encoded domain origin to resolve.
    public var origin: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Response to a request to retrieve information about a partner domain.
  public struct Response {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Partner ID to apply for the given domain.
    public var partner: String = String()

    /// Location ID to apply for the given domain.
    public var location: String = String()

    /// API key to use with the JS SDK.
    public var apikey: String = String()

    /// OAuth2 client ID assigned to the property.
    public var clientID: String = String()

    /// Describes locations considered "other" locations from this context, under this same partner.
    public var referencedLocation: [Bloombox_Services_Platform_V1_ReferencedLocation] = []

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  public init() {}
}

/// Specifies a request to retrieve the set of domains assigned for use by a partner location.
public struct Bloombox_Services_Platform_V1_DomainInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Request for domain info.
  public struct Request {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Partner ID to fetch domains for.
    public var partnerID: String = String()

    /// Location ID to fetch domains for.
    public var locationID: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Response to a request for domain info.
  public struct Response {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Shop domain/home link.
    public var shop: String = String()

    /// Standalone menu link.
    public var menu: String = String()

    /// Dashboard link.
    public var dashboard: String = String()

    /// TV menu link.
    public var tv: String = String()

    /// Embedded/email link domain.
    public var link: String = String()

    /// Internal/store website for the partner location.
    public var website: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  public init() {}
}

/// Describes website information for a given partner location's web presence. 
/// Included in web pages via regular meta tags and OpenGraph tags.
public struct Bloombox_Services_Platform_V1_SiteInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies a request to retrieve web presence info for a partner location.
  public struct Request {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Partner ID to fetch metadata for.
    public var partnerID: String = String()

    /// Location ID to fetch metadata for.
    public var locationID: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Response for a request of site information.
  public struct Response {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Metadata for a given partner location's web presence.
    public var metadata: Bloombox_Page_Context.Metadata {
      get {return _storage._metadata ?? Bloombox_Page_Context.Metadata()}
      set {_uniqueStorage()._metadata = newValue}
    }
    /// Returns true if `metadata` has been explicitly set.
    public var hasMetadata: Bool {return _storage._metadata != nil}
    /// Clears the value of `metadata`. Subsequent reads from it will return its default value.
    public mutating func clearMetadata() {_uniqueStorage()._metadata = nil}

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  public init() {}
}

/// Specifies an operation to retrieve brand information for a given partner location.
public struct Bloombox_Services_Platform_V1_BrandInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies a request for branding information.
  public struct Request {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Partner code identifying the partner organization owning the location for which branding is being requested.
    public var partner: String = String()

    /// Location code for which branding is being requested.
    public var location: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Specifies a response to a request for branding information.
  public struct Response {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Branding information returned to the callee, assuming it could be located.
    public var brand: Opencannabis_Content_Brand {
      get {return _storage._brand ?? Opencannabis_Content_Brand()}
      set {_uniqueStorage()._brand = newValue}
    }
    /// Returns true if `brand` has been explicitly set.
    public var hasBrand: Bool {return _storage._brand != nil}
    /// Clears the value of `brand`. Subsequent reads from it will return its default value.
    public mutating func clearBrand() {_uniqueStorage()._brand = nil}

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.services.platform.v1"

extension Bloombox_Services_Platform_V1_PlatformError: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NO_ERROR"),
    1: .same(proto: "SEARCH_NOT_AVAILABLE"),
    2: .same(proto: "ORIGIN_INVALID"),
    3: .same(proto: "ORIGIN_NOT_FOUND"),
  ]
}

extension Bloombox_Services_Platform_V1_PlatformServiceStatus: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNKNOWN"),
    1: .same(proto: "UP"),
    2: .same(proto: "DOWN"),
    3: .same(proto: "MAINTENANCE"),
  ]
}

extension Bloombox_Services_Platform_V1_Ping: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Ping"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_Ping, rhs: Bloombox_Services_Platform_V1_Ping) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_Ping.Request: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_Ping.protoMessageName + ".Request"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_Ping.Request, rhs: Bloombox_Services_Platform_V1_Ping.Request) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_Ping.Response: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_Ping.protoMessageName + ".Response"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.status)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.status != .unknown {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_Ping.Response, rhs: Bloombox_Services_Platform_V1_Ping.Response) -> Bool {
    if lhs.status != rhs.status {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_Healthcheck: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Healthcheck"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_Healthcheck, rhs: Bloombox_Services_Platform_V1_Healthcheck) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_Healthcheck.Request: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_Healthcheck.protoMessageName + ".Request"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "probe"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.probe)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.probe.isEmpty {
      try visitor.visitSingularStringField(value: self.probe, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_Healthcheck.Request, rhs: Bloombox_Services_Platform_V1_Healthcheck.Request) -> Bool {
    if lhs.probe != rhs.probe {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_ReferencedLocation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ReferencedLocation"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.name)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_ReferencedLocation, rhs: Bloombox_Services_Platform_V1_ReferencedLocation) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_DomainResolve: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".DomainResolve"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_DomainResolve, rhs: Bloombox_Services_Platform_V1_DomainResolve) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_DomainResolve.Request: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_DomainResolve.protoMessageName + ".Request"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "origin"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.origin)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.origin.isEmpty {
      try visitor.visitSingularStringField(value: self.origin, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_DomainResolve.Request, rhs: Bloombox_Services_Platform_V1_DomainResolve.Request) -> Bool {
    if lhs.origin != rhs.origin {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_DomainResolve.Response: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_DomainResolve.protoMessageName + ".Response"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "partner"),
    2: .same(proto: "location"),
    3: .same(proto: "apikey"),
    4: .standard(proto: "client_id"),
    7: .standard(proto: "referenced_location"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.partner)
      case 2: try decoder.decodeSingularStringField(value: &self.location)
      case 3: try decoder.decodeSingularStringField(value: &self.apikey)
      case 4: try decoder.decodeSingularStringField(value: &self.clientID)
      case 7: try decoder.decodeRepeatedMessageField(value: &self.referencedLocation)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.partner.isEmpty {
      try visitor.visitSingularStringField(value: self.partner, fieldNumber: 1)
    }
    if !self.location.isEmpty {
      try visitor.visitSingularStringField(value: self.location, fieldNumber: 2)
    }
    if !self.apikey.isEmpty {
      try visitor.visitSingularStringField(value: self.apikey, fieldNumber: 3)
    }
    if !self.clientID.isEmpty {
      try visitor.visitSingularStringField(value: self.clientID, fieldNumber: 4)
    }
    if !self.referencedLocation.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.referencedLocation, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_DomainResolve.Response, rhs: Bloombox_Services_Platform_V1_DomainResolve.Response) -> Bool {
    if lhs.partner != rhs.partner {return false}
    if lhs.location != rhs.location {return false}
    if lhs.apikey != rhs.apikey {return false}
    if lhs.clientID != rhs.clientID {return false}
    if lhs.referencedLocation != rhs.referencedLocation {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_DomainInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".DomainInfo"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_DomainInfo, rhs: Bloombox_Services_Platform_V1_DomainInfo) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_DomainInfo.Request: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_DomainInfo.protoMessageName + ".Request"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "partner_id"),
    2: .standard(proto: "location_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.partnerID)
      case 2: try decoder.decodeSingularStringField(value: &self.locationID)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.partnerID.isEmpty {
      try visitor.visitSingularStringField(value: self.partnerID, fieldNumber: 1)
    }
    if !self.locationID.isEmpty {
      try visitor.visitSingularStringField(value: self.locationID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_DomainInfo.Request, rhs: Bloombox_Services_Platform_V1_DomainInfo.Request) -> Bool {
    if lhs.partnerID != rhs.partnerID {return false}
    if lhs.locationID != rhs.locationID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_DomainInfo.Response: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_DomainInfo.protoMessageName + ".Response"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "shop"),
    2: .same(proto: "menu"),
    3: .same(proto: "dashboard"),
    4: .same(proto: "tv"),
    5: .same(proto: "link"),
    6: .same(proto: "website"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.shop)
      case 2: try decoder.decodeSingularStringField(value: &self.menu)
      case 3: try decoder.decodeSingularStringField(value: &self.dashboard)
      case 4: try decoder.decodeSingularStringField(value: &self.tv)
      case 5: try decoder.decodeSingularStringField(value: &self.link)
      case 6: try decoder.decodeSingularStringField(value: &self.website)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.shop.isEmpty {
      try visitor.visitSingularStringField(value: self.shop, fieldNumber: 1)
    }
    if !self.menu.isEmpty {
      try visitor.visitSingularStringField(value: self.menu, fieldNumber: 2)
    }
    if !self.dashboard.isEmpty {
      try visitor.visitSingularStringField(value: self.dashboard, fieldNumber: 3)
    }
    if !self.tv.isEmpty {
      try visitor.visitSingularStringField(value: self.tv, fieldNumber: 4)
    }
    if !self.link.isEmpty {
      try visitor.visitSingularStringField(value: self.link, fieldNumber: 5)
    }
    if !self.website.isEmpty {
      try visitor.visitSingularStringField(value: self.website, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_DomainInfo.Response, rhs: Bloombox_Services_Platform_V1_DomainInfo.Response) -> Bool {
    if lhs.shop != rhs.shop {return false}
    if lhs.menu != rhs.menu {return false}
    if lhs.dashboard != rhs.dashboard {return false}
    if lhs.tv != rhs.tv {return false}
    if lhs.link != rhs.link {return false}
    if lhs.website != rhs.website {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_SiteInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SiteInfo"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_SiteInfo, rhs: Bloombox_Services_Platform_V1_SiteInfo) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_SiteInfo.Request: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_SiteInfo.protoMessageName + ".Request"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "partner_id"),
    2: .standard(proto: "location_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.partnerID)
      case 2: try decoder.decodeSingularStringField(value: &self.locationID)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.partnerID.isEmpty {
      try visitor.visitSingularStringField(value: self.partnerID, fieldNumber: 1)
    }
    if !self.locationID.isEmpty {
      try visitor.visitSingularStringField(value: self.locationID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_SiteInfo.Request, rhs: Bloombox_Services_Platform_V1_SiteInfo.Request) -> Bool {
    if lhs.partnerID != rhs.partnerID {return false}
    if lhs.locationID != rhs.locationID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_SiteInfo.Response: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_SiteInfo.protoMessageName + ".Response"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "Metadata"),
  ]

  fileprivate class _StorageClass {
    var _metadata: Bloombox_Page_Context.Metadata? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _metadata = source._metadata
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._metadata)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._metadata {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_SiteInfo.Response, rhs: Bloombox_Services_Platform_V1_SiteInfo.Response) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._metadata != rhs_storage._metadata {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_BrandInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BrandInfo"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_BrandInfo, rhs: Bloombox_Services_Platform_V1_BrandInfo) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_BrandInfo.Request: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_BrandInfo.protoMessageName + ".Request"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "partner"),
    2: .same(proto: "location"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.partner)
      case 2: try decoder.decodeSingularStringField(value: &self.location)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.partner.isEmpty {
      try visitor.visitSingularStringField(value: self.partner, fieldNumber: 1)
    }
    if !self.location.isEmpty {
      try visitor.visitSingularStringField(value: self.location, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_BrandInfo.Request, rhs: Bloombox_Services_Platform_V1_BrandInfo.Request) -> Bool {
    if lhs.partner != rhs.partner {return false}
    if lhs.location != rhs.location {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Platform_V1_BrandInfo.Response: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Platform_V1_BrandInfo.protoMessageName + ".Response"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "brand"),
  ]

  fileprivate class _StorageClass {
    var _brand: Opencannabis_Content_Brand? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _brand = source._brand
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._brand)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._brand {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Platform_V1_BrandInfo.Response, rhs: Bloombox_Services_Platform_V1_BrandInfo.Response) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._brand != rhs_storage._brand {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
