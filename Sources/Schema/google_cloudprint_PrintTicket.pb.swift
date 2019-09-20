// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/cloudprint/PrintTicket.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies a print ticket, which is the structure to submit to Google Cloud Print to invoke the printer with a new
/// print job.

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

/// Section of a CJT which describes how a print job should be handled by a cloud-connected printer.
public struct Google_Cloudprint_PrintTicketSection {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Ticket item indicating what value for a vendor-specific capability to use.
  public var vendorTicketItem: [Google_Cloudprint_PrintTicketSection.VendorTicketItem] {
    get {return _storage._vendorTicketItem}
    set {_uniqueStorage()._vendorTicketItem = newValue}
  }

  /// Ticket item indicating which color option to use.
  public var color: Google_Cloudprint_PrintTicketSection.ColorTicketItem {
    get {return _storage._color ?? Google_Cloudprint_PrintTicketSection.ColorTicketItem()}
    set {_uniqueStorage()._color = newValue}
  }
  /// Returns true if `color` has been explicitly set.
  public var hasColor: Bool {return _storage._color != nil}
  /// Clears the value of `color`. Subsequent reads from it will return its default value.
  public mutating func clearColor() {_uniqueStorage()._color = nil}

  /// Ticket item indicating which duplexing option to use.
  public var duplex: Google_Cloudprint_PrintTicketSection.DuplexTicketItem {
    get {return _storage._duplex ?? Google_Cloudprint_PrintTicketSection.DuplexTicketItem()}
    set {_uniqueStorage()._duplex = newValue}
  }
  /// Returns true if `duplex` has been explicitly set.
  public var hasDuplex: Bool {return _storage._duplex != nil}
  /// Clears the value of `duplex`. Subsequent reads from it will return its default value.
  public mutating func clearDuplex() {_uniqueStorage()._duplex = nil}

  /// Ticket item indicating which page orientation option to use.
  public var pageOrientation: Google_Cloudprint_PrintTicketSection.PageOrientationTicketItem {
    get {return _storage._pageOrientation ?? Google_Cloudprint_PrintTicketSection.PageOrientationTicketItem()}
    set {_uniqueStorage()._pageOrientation = newValue}
  }
  /// Returns true if `pageOrientation` has been explicitly set.
  public var hasPageOrientation: Bool {return _storage._pageOrientation != nil}
  /// Clears the value of `pageOrientation`. Subsequent reads from it will return its default value.
  public mutating func clearPageOrientation() {_uniqueStorage()._pageOrientation = nil}

  /// Ticket item indicating how many copies to produce.
  public var copies: Google_Cloudprint_PrintTicketSection.CopiesTicketItem {
    get {return _storage._copies ?? Google_Cloudprint_PrintTicketSection.CopiesTicketItem()}
    set {_uniqueStorage()._copies = newValue}
  }
  /// Returns true if `copies` has been explicitly set.
  public var hasCopies: Bool {return _storage._copies != nil}
  /// Clears the value of `copies`. Subsequent reads from it will return its default value.
  public mutating func clearCopies() {_uniqueStorage()._copies = nil}

  /// Ticket item indicating what margins to use (in microns).
  public var margins: Google_Cloudprint_PrintTicketSection.MarginsTicketItem {
    get {return _storage._margins ?? Google_Cloudprint_PrintTicketSection.MarginsTicketItem()}
    set {_uniqueStorage()._margins = newValue}
  }
  /// Returns true if `margins` has been explicitly set.
  public var hasMargins: Bool {return _storage._margins != nil}
  /// Clears the value of `margins`. Subsequent reads from it will return its default value.
  public mutating func clearMargins() {_uniqueStorage()._margins = nil}

  /// Ticket item indicating what image resolution to use.
  public var dpi: Google_Cloudprint_PrintTicketSection.DpiTicketItem {
    get {return _storage._dpi ?? Google_Cloudprint_PrintTicketSection.DpiTicketItem()}
    set {_uniqueStorage()._dpi = newValue}
  }
  /// Returns true if `dpi` has been explicitly set.
  public var hasDpi: Bool {return _storage._dpi != nil}
  /// Clears the value of `dpi`. Subsequent reads from it will return its default value.
  public mutating func clearDpi() {_uniqueStorage()._dpi = nil}

  /// Ticket item indicating what page-fitting algorithm to use.
  public var fitToPage: Google_Cloudprint_PrintTicketSection.FitToPageTicketItem {
    get {return _storage._fitToPage ?? Google_Cloudprint_PrintTicketSection.FitToPageTicketItem()}
    set {_uniqueStorage()._fitToPage = newValue}
  }
  /// Returns true if `fitToPage` has been explicitly set.
  public var hasFitToPage: Bool {return _storage._fitToPage != nil}
  /// Clears the value of `fitToPage`. Subsequent reads from it will return its default value.
  public mutating func clearFitToPage() {_uniqueStorage()._fitToPage = nil}

  /// Ticket item indicating what pages to use.
  public var pageRange: Google_Cloudprint_PrintTicketSection.PageRangeTicketItem {
    get {return _storage._pageRange ?? Google_Cloudprint_PrintTicketSection.PageRangeTicketItem()}
    set {_uniqueStorage()._pageRange = newValue}
  }
  /// Returns true if `pageRange` has been explicitly set.
  public var hasPageRange: Bool {return _storage._pageRange != nil}
  /// Clears the value of `pageRange`. Subsequent reads from it will return its default value.
  public mutating func clearPageRange() {_uniqueStorage()._pageRange = nil}

  /// Ticket item indicating what media size to use.
  public var mediaSize: Google_Cloudprint_PrintTicketSection.MediaSizeTicketItem {
    get {return _storage._mediaSize ?? Google_Cloudprint_PrintTicketSection.MediaSizeTicketItem()}
    set {_uniqueStorage()._mediaSize = newValue}
  }
  /// Returns true if `mediaSize` has been explicitly set.
  public var hasMediaSize: Bool {return _storage._mediaSize != nil}
  /// Clears the value of `mediaSize`. Subsequent reads from it will return its default value.
  public mutating func clearMediaSize() {_uniqueStorage()._mediaSize = nil}

  /// Ticket item indicating whether to collate pages.
  public var collate: Google_Cloudprint_PrintTicketSection.CollateTicketItem {
    get {return _storage._collate ?? Google_Cloudprint_PrintTicketSection.CollateTicketItem()}
    set {_uniqueStorage()._collate = newValue}
  }
  /// Returns true if `collate` has been explicitly set.
  public var hasCollate: Bool {return _storage._collate != nil}
  /// Clears the value of `collate`. Subsequent reads from it will return its default value.
  public mutating func clearCollate() {_uniqueStorage()._collate = nil}

  /// Ticket item indicating whether to print in reverse.
  public var reverseOrder: Google_Cloudprint_PrintTicketSection.ReverseOrderTicketItem {
    get {return _storage._reverseOrder ?? Google_Cloudprint_PrintTicketSection.ReverseOrderTicketItem()}
    set {_uniqueStorage()._reverseOrder = newValue}
  }
  /// Returns true if `reverseOrder` has been explicitly set.
  public var hasReverseOrder: Bool {return _storage._reverseOrder != nil}
  /// Clears the value of `reverseOrder`. Subsequent reads from it will return its default value.
  public mutating func clearReverseOrder() {_uniqueStorage()._reverseOrder = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Ticket item indicating what value for a vendor-specific capability to use.
  public struct VendorTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// ID of vendor-specific capability that this ticket item refers to (required).
    public var id: String = String()

    /// Value of ticket item (required).
    public var value: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating which color option to use.
  public struct ColorTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Vendor ID of the color (required if the type is CUSTOM_COLOR or
    /// CUSTOM_MONOCHROME).
    public var vendorID: String = String()

    /// Type of the color (required).
    public var type: Google_Cloudprint_Color.TypeEnum = .standardColor

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating which duplexing option to use.
  public struct DuplexTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Type of duplexing (required).
    public var type: Google_Cloudprint_Duplex.TypeEnum = .noDuplex

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating which page orientation option to use.
  public struct PageOrientationTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Page orientation type (required).
    public var type: Google_Cloudprint_PageOrientation.TypeEnum = .portrait

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating how many copies to produce.
  public struct CopiesTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Number of copies to print (required).
    public var copies: Int32 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating what margins to use (in microns).
  public struct MarginsTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Top margin of the page (required).
    public var topMicrons: Int32 = 0

    /// Top margin of the page (required).
    public var rightMicrons: Int32 = 0

    /// Top margin of the page (required).
    public var bottomMicrons: Int32 = 0

    /// Top margin of the page (required).
    public var leftMicrons: Int32 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating what image resolution to use.
  public struct DpiTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Horizontal DPI to print at (required).
    public var horizontalDpi: Int32 = 0

    /// Vertical DPI to print at (required).
    public var verticalDpi: Int32 = 0

    /// Vendor-provided ID of the Dpi option. Needed to disambiguate Dpi options that have the same DPI values, but may
    /// have a different effect for the printer.
    public var vendorID: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating what page-fitting algorithm to use.
  public struct FitToPageTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Type of page fitting (required).
    public var type: Google_Cloudprint_FitToPage.TypeEnum = .noFitting

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating what pages to use.
  public struct PageRangeTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var interval: [Google_Cloudprint_PageRange.Interval] = []

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating what media size to use.
  public struct MediaSizeTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Width (in microns) of the media to print to.
    public var widthMicrons: Int32 = 0

    /// Height (in microns) of the media to print to.
    public var heightMicrons: Int32 = 0

    /// Whether the media size selection is continuously fed. If false, both width and height must be set. If true, only
    /// one need be set.
    public var isContinuousFeed: Bool = false

    /// Vendor-provided ID of the MediaSize option. Needed to disambiguate media sizes that may have the same width and
    /// height, but may have a different effect for the printer.
    public var vendorID: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating whether to collate pages.
  public struct CollateTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Whether to print collated (required).
    public var collate: Bool = false

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Ticket item indicating whether to print in reverse.
  public struct ReverseOrderTicketItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Whether to print in reverse (required).
    public var reverseOrder: Bool = false

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.cloudprint"

extension Google_Cloudprint_PrintTicketSection: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PrintTicketSection"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "vendor_ticket_item"),
    2: .same(proto: "color"),
    3: .same(proto: "duplex"),
    4: .standard(proto: "page_orientation"),
    5: .same(proto: "copies"),
    6: .same(proto: "margins"),
    7: .same(proto: "dpi"),
    8: .standard(proto: "fit_to_page"),
    9: .standard(proto: "page_range"),
    10: .standard(proto: "media_size"),
    11: .same(proto: "collate"),
    12: .standard(proto: "reverse_order"),
  ]

  fileprivate class _StorageClass {
    var _vendorTicketItem: [Google_Cloudprint_PrintTicketSection.VendorTicketItem] = []
    var _color: Google_Cloudprint_PrintTicketSection.ColorTicketItem? = nil
    var _duplex: Google_Cloudprint_PrintTicketSection.DuplexTicketItem? = nil
    var _pageOrientation: Google_Cloudprint_PrintTicketSection.PageOrientationTicketItem? = nil
    var _copies: Google_Cloudprint_PrintTicketSection.CopiesTicketItem? = nil
    var _margins: Google_Cloudprint_PrintTicketSection.MarginsTicketItem? = nil
    var _dpi: Google_Cloudprint_PrintTicketSection.DpiTicketItem? = nil
    var _fitToPage: Google_Cloudprint_PrintTicketSection.FitToPageTicketItem? = nil
    var _pageRange: Google_Cloudprint_PrintTicketSection.PageRangeTicketItem? = nil
    var _mediaSize: Google_Cloudprint_PrintTicketSection.MediaSizeTicketItem? = nil
    var _collate: Google_Cloudprint_PrintTicketSection.CollateTicketItem? = nil
    var _reverseOrder: Google_Cloudprint_PrintTicketSection.ReverseOrderTicketItem? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _vendorTicketItem = source._vendorTicketItem
      _color = source._color
      _duplex = source._duplex
      _pageOrientation = source._pageOrientation
      _copies = source._copies
      _margins = source._margins
      _dpi = source._dpi
      _fitToPage = source._fitToPage
      _pageRange = source._pageRange
      _mediaSize = source._mediaSize
      _collate = source._collate
      _reverseOrder = source._reverseOrder
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
        case 1: try decoder.decodeRepeatedMessageField(value: &_storage._vendorTicketItem)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._color)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._duplex)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._pageOrientation)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._copies)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._margins)
        case 7: try decoder.decodeSingularMessageField(value: &_storage._dpi)
        case 8: try decoder.decodeSingularMessageField(value: &_storage._fitToPage)
        case 9: try decoder.decodeSingularMessageField(value: &_storage._pageRange)
        case 10: try decoder.decodeSingularMessageField(value: &_storage._mediaSize)
        case 11: try decoder.decodeSingularMessageField(value: &_storage._collate)
        case 12: try decoder.decodeSingularMessageField(value: &_storage._reverseOrder)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._vendorTicketItem.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._vendorTicketItem, fieldNumber: 1)
      }
      if let v = _storage._color {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._duplex {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._pageOrientation {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._copies {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._margins {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if let v = _storage._dpi {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
      }
      if let v = _storage._fitToPage {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
      }
      if let v = _storage._pageRange {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
      }
      if let v = _storage._mediaSize {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      }
      if let v = _storage._collate {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      }
      if let v = _storage._reverseOrder {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection, rhs: Google_Cloudprint_PrintTicketSection) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._vendorTicketItem != rhs_storage._vendorTicketItem {return false}
        if _storage._color != rhs_storage._color {return false}
        if _storage._duplex != rhs_storage._duplex {return false}
        if _storage._pageOrientation != rhs_storage._pageOrientation {return false}
        if _storage._copies != rhs_storage._copies {return false}
        if _storage._margins != rhs_storage._margins {return false}
        if _storage._dpi != rhs_storage._dpi {return false}
        if _storage._fitToPage != rhs_storage._fitToPage {return false}
        if _storage._pageRange != rhs_storage._pageRange {return false}
        if _storage._mediaSize != rhs_storage._mediaSize {return false}
        if _storage._collate != rhs_storage._collate {return false}
        if _storage._reverseOrder != rhs_storage._reverseOrder {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.VendorTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".VendorTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.value)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.VendorTicketItem, rhs: Google_Cloudprint_PrintTicketSection.VendorTicketItem) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.ColorTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".ColorTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "vendor_id"),
    2: .same(proto: "type"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.vendorID)
      case 2: try decoder.decodeSingularEnumField(value: &self.type)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.vendorID.isEmpty {
      try visitor.visitSingularStringField(value: self.vendorID, fieldNumber: 1)
    }
    if self.type != .standardColor {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.ColorTicketItem, rhs: Google_Cloudprint_PrintTicketSection.ColorTicketItem) -> Bool {
    if lhs.vendorID != rhs.vendorID {return false}
    if lhs.type != rhs.type {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.DuplexTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".DuplexTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.type)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.type != .noDuplex {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.DuplexTicketItem, rhs: Google_Cloudprint_PrintTicketSection.DuplexTicketItem) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.PageOrientationTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".PageOrientationTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.type)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.type != .portrait {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.PageOrientationTicketItem, rhs: Google_Cloudprint_PrintTicketSection.PageOrientationTicketItem) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.CopiesTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".CopiesTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "copies"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.copies)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.copies != 0 {
      try visitor.visitSingularInt32Field(value: self.copies, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.CopiesTicketItem, rhs: Google_Cloudprint_PrintTicketSection.CopiesTicketItem) -> Bool {
    if lhs.copies != rhs.copies {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.MarginsTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".MarginsTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "top_microns"),
    2: .standard(proto: "right_microns"),
    3: .standard(proto: "bottom_microns"),
    4: .standard(proto: "left_microns"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.topMicrons)
      case 2: try decoder.decodeSingularInt32Field(value: &self.rightMicrons)
      case 3: try decoder.decodeSingularInt32Field(value: &self.bottomMicrons)
      case 4: try decoder.decodeSingularInt32Field(value: &self.leftMicrons)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.topMicrons != 0 {
      try visitor.visitSingularInt32Field(value: self.topMicrons, fieldNumber: 1)
    }
    if self.rightMicrons != 0 {
      try visitor.visitSingularInt32Field(value: self.rightMicrons, fieldNumber: 2)
    }
    if self.bottomMicrons != 0 {
      try visitor.visitSingularInt32Field(value: self.bottomMicrons, fieldNumber: 3)
    }
    if self.leftMicrons != 0 {
      try visitor.visitSingularInt32Field(value: self.leftMicrons, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.MarginsTicketItem, rhs: Google_Cloudprint_PrintTicketSection.MarginsTicketItem) -> Bool {
    if lhs.topMicrons != rhs.topMicrons {return false}
    if lhs.rightMicrons != rhs.rightMicrons {return false}
    if lhs.bottomMicrons != rhs.bottomMicrons {return false}
    if lhs.leftMicrons != rhs.leftMicrons {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.DpiTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".DpiTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "horizontal_dpi"),
    2: .standard(proto: "vertical_dpi"),
    3: .standard(proto: "vendor_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.horizontalDpi)
      case 2: try decoder.decodeSingularInt32Field(value: &self.verticalDpi)
      case 3: try decoder.decodeSingularStringField(value: &self.vendorID)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.horizontalDpi != 0 {
      try visitor.visitSingularInt32Field(value: self.horizontalDpi, fieldNumber: 1)
    }
    if self.verticalDpi != 0 {
      try visitor.visitSingularInt32Field(value: self.verticalDpi, fieldNumber: 2)
    }
    if !self.vendorID.isEmpty {
      try visitor.visitSingularStringField(value: self.vendorID, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.DpiTicketItem, rhs: Google_Cloudprint_PrintTicketSection.DpiTicketItem) -> Bool {
    if lhs.horizontalDpi != rhs.horizontalDpi {return false}
    if lhs.verticalDpi != rhs.verticalDpi {return false}
    if lhs.vendorID != rhs.vendorID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.FitToPageTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".FitToPageTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.type)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.type != .noFitting {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.FitToPageTicketItem, rhs: Google_Cloudprint_PrintTicketSection.FitToPageTicketItem) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.PageRangeTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".PageRangeTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "interval"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.interval)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.interval.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.interval, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.PageRangeTicketItem, rhs: Google_Cloudprint_PrintTicketSection.PageRangeTicketItem) -> Bool {
    if lhs.interval != rhs.interval {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.MediaSizeTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".MediaSizeTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "width_microns"),
    2: .standard(proto: "height_microns"),
    3: .standard(proto: "is_continuous_feed"),
    4: .standard(proto: "vendor_id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.widthMicrons)
      case 2: try decoder.decodeSingularInt32Field(value: &self.heightMicrons)
      case 3: try decoder.decodeSingularBoolField(value: &self.isContinuousFeed)
      case 4: try decoder.decodeSingularStringField(value: &self.vendorID)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.widthMicrons != 0 {
      try visitor.visitSingularInt32Field(value: self.widthMicrons, fieldNumber: 1)
    }
    if self.heightMicrons != 0 {
      try visitor.visitSingularInt32Field(value: self.heightMicrons, fieldNumber: 2)
    }
    if self.isContinuousFeed != false {
      try visitor.visitSingularBoolField(value: self.isContinuousFeed, fieldNumber: 3)
    }
    if !self.vendorID.isEmpty {
      try visitor.visitSingularStringField(value: self.vendorID, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.MediaSizeTicketItem, rhs: Google_Cloudprint_PrintTicketSection.MediaSizeTicketItem) -> Bool {
    if lhs.widthMicrons != rhs.widthMicrons {return false}
    if lhs.heightMicrons != rhs.heightMicrons {return false}
    if lhs.isContinuousFeed != rhs.isContinuousFeed {return false}
    if lhs.vendorID != rhs.vendorID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.CollateTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".CollateTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "collate"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.collate)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.collate != false {
      try visitor.visitSingularBoolField(value: self.collate, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.CollateTicketItem, rhs: Google_Cloudprint_PrintTicketSection.CollateTicketItem) -> Bool {
    if lhs.collate != rhs.collate {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloudprint_PrintTicketSection.ReverseOrderTicketItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Cloudprint_PrintTicketSection.protoMessageName + ".ReverseOrderTicketItem"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "reverse_order"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.reverseOrder)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.reverseOrder != false {
      try visitor.visitSingularBoolField(value: self.reverseOrder, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloudprint_PrintTicketSection.ReverseOrderTicketItem, rhs: Google_Cloudprint_PrintTicketSection.ReverseOrderTicketItem) -> Bool {
    if lhs.reverseOrder != rhs.reverseOrder {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
