// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: inventory/rfid/RFID.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Defines the structure of Radio Frequency Identifier (RFID)-related hardware and software. RFID is used in this
/// context to track and trace individual inventory throughout the supply chain.

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

/// Describes known vendors of RFID reader equipment.
public enum Opencannabis_Inventory_Rfid_ReaderVendor: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The vendor for the reader could not be recognized.
  case unrecognizedVendor // = 0

  /// The vendor for the reader was detected as Impinj.
  case impinj // = 25882

  /// The vendor for the reader was detected as Alien.
  case alien // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .unrecognizedVendor
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unrecognizedVendor
    case 2: self = .alien
    case 25882: self = .impinj
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unrecognizedVendor: return 0
    case .alien: return 2
    case .impinj: return 25882
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Inventory_Rfid_ReaderVendor: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Inventory_Rfid_ReaderVendor] = [
    .unrecognizedVendor,
    .impinj,
    .alien,
  ]
}

#endif  // swift(>=4.2)

/// Describes known, or supported, models of RFID reader controller devices.
public enum Opencannabis_Inventory_Rfid_ReaderModel: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The model of the reader could not be recognized.
  case unrecognizedReader // = 0

  /// Impinj Speedway Revolution R120 (1-port).
  case speedwayR120 // = 1

  /// Impinj Speedway Revolution R220 (2-port).
  case speedwayR220 // = 2

  /// Impinj Speedway Revolution R420 (4-port).
  case speedwayR420 // = 2001002

  /// Impinj Speedway xPortal Gateway.
  case speedwayXportal // = 4

  /// Alien ALR-H450 handheld reader.
  case alienAlrh450 // = 5

  /// Alien F800 reader.
  case alienF800 // = 6

  /// Alien ALR-9680 reader (4-port).
  case alienAlr9680 // = 7
  case UNRECOGNIZED(Int)

  public init() {
    self = .unrecognizedReader
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unrecognizedReader
    case 1: self = .speedwayR120
    case 2: self = .speedwayR220
    case 4: self = .speedwayXportal
    case 5: self = .alienAlrh450
    case 6: self = .alienF800
    case 7: self = .alienAlr9680
    case 2001002: self = .speedwayR420
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unrecognizedReader: return 0
    case .speedwayR120: return 1
    case .speedwayR220: return 2
    case .speedwayXportal: return 4
    case .alienAlrh450: return 5
    case .alienF800: return 6
    case .alienAlr9680: return 7
    case .speedwayR420: return 2001002
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Opencannabis_Inventory_Rfid_ReaderModel: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Opencannabis_Inventory_Rfid_ReaderModel] = [
    .unrecognizedReader,
    .speedwayR120,
    .speedwayR220,
    .speedwayR420,
    .speedwayXportal,
    .alienAlrh450,
    .alienF800,
    .alienAlr9680,
  ]
}

#endif  // swift(>=4.2)

/// Describes the notion of an RFID reader device, which manages one or more RFID antennae. RFID readers control the RF
/// scanning process, and correspond over LLRP with clients to facilitate reading RFID tags.
public struct Opencannabis_Inventory_Rfid_Reader {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the string name of the reader, if one is assigned and could be detected.
  public var name: String = String()

  /// Specifies the MAC address of the reader device, assigned to the Ethernet/PoE port embedded on the device and hooked
  /// into the local network.
  public var mac: String = String()

  /// Specifies the IP address of the reader device, where it can be connected to over LLRP, assuming no firewall or
  /// security IDS/IPS interference.
  public var ip: String = String()

  /// Describes the vendor of the RFID reader controller, if one could be detected.
  public var vendor: Opencannabis_Inventory_Rfid_ReaderVendor = .unrecognizedVendor

  /// Describes the model of the RFID reader controller, if one could be detected.
  public var model: Opencannabis_Inventory_Rfid_ReaderModel = .unrecognizedReader

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Describes the concept of an RFID antenna, which is attached to an RFID reader device. Antennas are essentially
/// passive hardware, so they must be operated by a reader, which is the "controller" device clients communicate with.
public struct Opencannabis_Inventory_Rfid_Antenna {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Antenna number. This identifies the port which the antenna is connected to on the reader which is controlling this
  /// external RFID antenna device.
  public var index: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Defines the structure of an individual RFID tag, which is placed on, or attached to, a physical item in order to
/// facilitate unique tracking of that item throughout the supply chain.
public struct Opencannabis_Inventory_Rfid_Tag {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Tag ID, assigned to the tag at manufacturing time and never over-written. Uniquely identifies this particular RFID
  /// tag in a permanent, hard-to-reproduce manner.
  public var tid: String = String()

  /// Raw content encoded onto the tag. This payload is set to complement any decoded content payload which might be
  /// available as a result of this scan.
  public var payload: Data = SwiftProtobuf.Internal.emptyData

  /// Specifies decoded content, read from the raw content of the encodable section of the RFID tag we are describing.
  public var content: Opencannabis_Inventory_Rfid_Tag.OneOf_Content? = nil

  /// EPC, or Electronic Product Code, which was read from the encoded data section of the subject RFID tag which we
  /// are describing in this payload.
  public var epc: String {
    get {
      if case .epc(let v)? = content {return v}
      return String()
    }
    set {content = .epc(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies decoded content, read from the raw content of the encodable section of the RFID tag we are describing.
  public enum OneOf_Content: Equatable {
    /// EPC, or Electronic Product Code, which was read from the encoded data section of the subject RFID tag which we
    /// are describing in this payload.
    case epc(String)

  #if !swift(>=4.1)
    public static func ==(lhs: Opencannabis_Inventory_Rfid_Tag.OneOf_Content, rhs: Opencannabis_Inventory_Rfid_Tag.OneOf_Content) -> Bool {
      switch (lhs, rhs) {
      case (.epc(let l), .epc(let r)): return l == r
      }
    }
  #endif
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.inventory.rfid"

extension Opencannabis_Inventory_Rfid_ReaderVendor: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNRECOGNIZED_VENDOR"),
    2: .same(proto: "ALIEN"),
    25882: .same(proto: "IMPINJ"),
  ]
}

extension Opencannabis_Inventory_Rfid_ReaderModel: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNRECOGNIZED_READER"),
    1: .same(proto: "SPEEDWAY_R120"),
    2: .same(proto: "SPEEDWAY_R220"),
    4: .same(proto: "SPEEDWAY_XPORTAL"),
    5: .same(proto: "ALIEN_ALRH450"),
    6: .same(proto: "ALIEN_F800"),
    7: .same(proto: "ALIEN_ALR9680"),
    2001002: .same(proto: "SPEEDWAY_R420"),
  ]
}

extension Opencannabis_Inventory_Rfid_Reader: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Reader"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "mac"),
    3: .same(proto: "ip"),
    4: .same(proto: "vendor"),
    5: .same(proto: "model"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.name)
      case 2: try decoder.decodeSingularStringField(value: &self.mac)
      case 3: try decoder.decodeSingularStringField(value: &self.ip)
      case 4: try decoder.decodeSingularEnumField(value: &self.vendor)
      case 5: try decoder.decodeSingularEnumField(value: &self.model)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if !self.mac.isEmpty {
      try visitor.visitSingularStringField(value: self.mac, fieldNumber: 2)
    }
    if !self.ip.isEmpty {
      try visitor.visitSingularStringField(value: self.ip, fieldNumber: 3)
    }
    if self.vendor != .unrecognizedVendor {
      try visitor.visitSingularEnumField(value: self.vendor, fieldNumber: 4)
    }
    if self.model != .unrecognizedReader {
      try visitor.visitSingularEnumField(value: self.model, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Inventory_Rfid_Reader, rhs: Opencannabis_Inventory_Rfid_Reader) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.mac != rhs.mac {return false}
    if lhs.ip != rhs.ip {return false}
    if lhs.vendor != rhs.vendor {return false}
    if lhs.model != rhs.model {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Inventory_Rfid_Antenna: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Antenna"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "index"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt32Field(value: &self.index)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.index != 0 {
      try visitor.visitSingularUInt32Field(value: self.index, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Inventory_Rfid_Antenna, rhs: Opencannabis_Inventory_Rfid_Antenna) -> Bool {
    if lhs.index != rhs.index {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Inventory_Rfid_Tag: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Tag"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tid"),
    2: .same(proto: "payload"),
    10: .same(proto: "epc"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.tid)
      case 2: try decoder.decodeSingularBytesField(value: &self.payload)
      case 10:
        if self.content != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.content = .epc(v)}
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.tid.isEmpty {
      try visitor.visitSingularStringField(value: self.tid, fieldNumber: 1)
    }
    if !self.payload.isEmpty {
      try visitor.visitSingularBytesField(value: self.payload, fieldNumber: 2)
    }
    if case .epc(let v)? = self.content {
      try visitor.visitSingularStringField(value: v, fieldNumber: 10)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Inventory_Rfid_Tag, rhs: Opencannabis_Inventory_Rfid_Tag) -> Bool {
    if lhs.tid != rhs.tid {return false}
    if lhs.payload != rhs.payload {return false}
    if lhs.content != rhs.content {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}