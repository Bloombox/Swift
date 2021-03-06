// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: page/Media.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Models that define media records for various use cases.

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

/// Enumerates known or supported video asset providers.
public enum Bloombox_Page_VideoProvider: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// Private hosting for a given video asset.
  case `private` // = 0

  /// YouTube hosting for a given video asset.
  case youtube // = 1

  /// Vimeo hosting for a given video asset.
  case vimeo // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .private
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .private
    case 1: self = .youtube
    case 2: self = .vimeo
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .private: return 0
    case .youtube: return 1
    case .vimeo: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Page_VideoProvider: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Page_VideoProvider] = [
    .private,
    .youtube,
    .vimeo,
  ]
}

#endif  // swift(>=4.2)

/// Describes resolutions at which video assets may be made available.
public enum Bloombox_Page_VideoResolution: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The video is available in low-res form.
  case low // = 0

  /// The video is available in HD (720p/720i-1080p/1080i) form.
  case hd // = 1

  /// The video is available in 4K Ultra HD (UHD).
  case uhd // = 2
  case UNRECOGNIZED(Int)

  public init() {
    self = .low
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .low
    case 1: self = .hd
    case 2: self = .uhd
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .low: return 0
    case .hd: return 1
    case .uhd: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Bloombox_Page_VideoResolution: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Bloombox_Page_VideoResolution] = [
    .low,
    .hd,
    .uhd,
  ]
}

#endif  // swift(>=4.2)

/// Defines the structure of attached content media, which is intended for emission in a given web page
/// via some sort of render process, depending on the context in which this media is used.
public struct Bloombox_Page_MediaAsset {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Describes the kind of media being attached.
  public var kind: Opencannabis_Media_MediaType.Kind {
    get {return _storage._kind}
    set {_uniqueStorage()._kind = newValue}
  }

  /// Specifies concrete information about the attached media asset.
  public var media: OneOf_Media? {
    get {return _storage._media}
    set {_uniqueStorage()._media = newValue}
  }

  /// Decribes concrete information about an attached media link.
  public var link: Bloombox_Page_MediaAsset.Link {
    get {
      if case .link(let v)? = _storage._media {return v}
      return Bloombox_Page_MediaAsset.Link()
    }
    set {_uniqueStorage()._media = .link(newValue)}
  }

  /// Describes concrete information about an attached image.
  public var image: Bloombox_Page_MediaAsset.Image {
    get {
      if case .image(let v)? = _storage._media {return v}
      return Bloombox_Page_MediaAsset.Image()
    }
    set {_uniqueStorage()._media = .image(newValue)}
  }

  /// Describes concrete information about an attached video.
  public var video: Bloombox_Page_MediaAsset.Video {
    get {
      if case .video(let v)? = _storage._media {return v}
      return Bloombox_Page_MediaAsset.Video()
    }
    set {_uniqueStorage()._media = .video(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies concrete information about the attached media asset.
  public enum OneOf_Media: Equatable {
    /// Decribes concrete information about an attached media link.
    case link(Bloombox_Page_MediaAsset.Link)
    /// Describes concrete information about an attached image.
    case image(Bloombox_Page_MediaAsset.Image)
    /// Describes concrete information about an attached video.
    case video(Bloombox_Page_MediaAsset.Video)

  #if !swift(>=4.1)
    public static func ==(lhs: Bloombox_Page_MediaAsset.OneOf_Media, rhs: Bloombox_Page_MediaAsset.OneOf_Media) -> Bool {
      switch (lhs, rhs) {
      case (.link(let l), .link(let r)): return l == r
      case (.image(let l), .image(let r)): return l == r
      case (.video(let l), .video(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  /// Describes concrete information about a media link, attached to some web page or data point.
  public struct Link {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// URI to consider for an attached media link.
    public var uri: String = String()

    /// Alternative text to display for this link, if applicable.
    public var alt: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Describes concrete information about an image asset, attached to some web page or data point.
  public struct Image {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Concrete information regarding this image asset.
    public var asset: [Bloombox_Page_MediaAsset.Image.ImageAsset] = []

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    /// Describes information about an individual image asset, which is part of an attached image.
    public struct ImageAsset {
      // SwiftProtobuf.Message conformance is added in an extension below. See the
      // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
      // methods supported on all messages.

      /// Specifies the intended resolution of this image asset.
      public var resolution: Opencannabis_Media_MediaType.ImageDPI {
        get {return _storage._resolution}
        set {_uniqueStorage()._resolution = newValue}
      }

      /// Specifies the kind of image attached as this asset.
      public var kind: Opencannabis_Media_MediaType.ImageKind {
        get {return _storage._kind}
        set {_uniqueStorage()._kind = newValue}
      }

      /// Specifies the native width of this image asset.
      public var width: UInt64 {
        get {return _storage._width}
        set {_uniqueStorage()._width = newValue}
      }

      /// Specifies the native height of this image asset.
      public var height: UInt64 {
        get {return _storage._height}
        set {_uniqueStorage()._height = newValue}
      }

      /// Specifies the content, or content by reference, for this image.
      public var content: OneOf_Content? {
        get {return _storage._content}
        set {_uniqueStorage()._content = newValue}
      }

      /// Raw Base64 content to be embedded directly in an image tag.
      public var b64: String {
        get {
          if case .b64(let v)? = _storage._content {return v}
          return String()
        }
        set {_uniqueStorage()._content = .b64(newValue)}
      }

      /// URI to be used in reference to this image asset.
      public var uri: String {
        get {
          if case .uri(let v)? = _storage._content {return v}
          return String()
        }
        set {_uniqueStorage()._content = .uri(newValue)}
      }

      /// Standard OpenCannabis media reference to attach.
      public var ref: Opencannabis_Media_MediaReference {
        get {
          if case .ref(let v)? = _storage._content {return v}
          return Opencannabis_Media_MediaReference()
        }
        set {_uniqueStorage()._content = .ref(newValue)}
      }

      public var unknownFields = SwiftProtobuf.UnknownStorage()

      /// Specifies the content, or content by reference, for this image.
      public enum OneOf_Content: Equatable {
        /// Raw Base64 content to be embedded directly in an image tag.
        case b64(String)
        /// URI to be used in reference to this image asset.
        case uri(String)
        /// Standard OpenCannabis media reference to attach.
        case ref(Opencannabis_Media_MediaReference)

      #if !swift(>=4.1)
        public static func ==(lhs: Bloombox_Page_MediaAsset.Image.ImageAsset.OneOf_Content, rhs: Bloombox_Page_MediaAsset.Image.ImageAsset.OneOf_Content) -> Bool {
          switch (lhs, rhs) {
          case (.b64(let l), .b64(let r)): return l == r
          case (.uri(let l), .uri(let r)): return l == r
          case (.ref(let l), .ref(let r)): return l == r
          default: return false
          }
        }
      #endif
      }

      public init() {}

      fileprivate var _storage = _StorageClass.defaultInstance
    }

    public init() {}
  }

  /// Describes concrete information about a video asset, attached to some web page or data point.
  public struct Video {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Describes where the video may be streamed from, or accessed.
    public var provider: Bloombox_Page_VideoProvider = .private

    /// Title to display for this video asset.
    public var title: String = String()

    /// Description for this video asset.
    public var description_p: String = String()

    /// Duration of the video asset, in milliseconds.
    public var runTime: UInt64 = 0

    /// Describes the assets that back this video media.
    public var asset: [Bloombox_Page_MediaAsset.Video.VideoAsset] = []

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    /// Describes information about an individual video asset, which is part of an attached video.
    public struct VideoAsset {
      // SwiftProtobuf.Message conformance is added in an extension below. See the
      // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
      // methods supported on all messages.

      /// Resolutions at which a video might be available.
      public var resolution: Bloombox_Page_VideoResolution {
        get {return _storage._resolution}
        set {_uniqueStorage()._resolution = newValue}
      }

      /// Image asset to be used as a thumbnail for this video asset.
      public var thumb: Bloombox_Page_MediaAsset.Image {
        get {return _storage._thumb ?? Bloombox_Page_MediaAsset.Image()}
        set {_uniqueStorage()._thumb = newValue}
      }
      /// Returns true if `thumb` has been explicitly set.
      public var hasThumb: Bool {return _storage._thumb != nil}
      /// Clears the value of `thumb`. Subsequent reads from it will return its default value.
      public mutating func clearThumb() {_uniqueStorage()._thumb = nil}

      /// URI where the video may be streamed or accessed.
      public var uri: String {
        get {return _storage._uri}
        set {_uniqueStorage()._uri = newValue}
      }

      public var unknownFields = SwiftProtobuf.UnknownStorage()

      public init() {}

      fileprivate var _storage = _StorageClass.defaultInstance
    }

    public init() {}
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.page"

extension Bloombox_Page_VideoProvider: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PRIVATE"),
    1: .same(proto: "YOUTUBE"),
    2: .same(proto: "VIMEO"),
  ]
}

extension Bloombox_Page_VideoResolution: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "LOW"),
    1: .same(proto: "HD"),
    2: .same(proto: "UHD"),
  ]
}

extension Bloombox_Page_MediaAsset: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MediaAsset"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "kind"),
    10: .same(proto: "link"),
    20: .same(proto: "image"),
    30: .same(proto: "video"),
  ]

  fileprivate class _StorageClass {
    var _kind: Opencannabis_Media_MediaType.Kind = .link
    var _media: Bloombox_Page_MediaAsset.OneOf_Media?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _kind = source._kind
      _media = source._media
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
        case 1: try decoder.decodeSingularEnumField(value: &_storage._kind)
        case 10:
          var v: Bloombox_Page_MediaAsset.Link?
          if let current = _storage._media {
            try decoder.handleConflictingOneOf()
            if case .link(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._media = .link(v)}
        case 20:
          var v: Bloombox_Page_MediaAsset.Image?
          if let current = _storage._media {
            try decoder.handleConflictingOneOf()
            if case .image(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._media = .image(v)}
        case 30:
          var v: Bloombox_Page_MediaAsset.Video?
          if let current = _storage._media {
            try decoder.handleConflictingOneOf()
            if case .video(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._media = .video(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._kind != .link {
        try visitor.visitSingularEnumField(value: _storage._kind, fieldNumber: 1)
      }
      switch _storage._media {
      case .link(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .image(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 20)
      case .video(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 30)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Page_MediaAsset, rhs: Bloombox_Page_MediaAsset) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._kind != rhs_storage._kind {return false}
        if _storage._media != rhs_storage._media {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Page_MediaAsset.Link: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Page_MediaAsset.protoMessageName + ".Link"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uri"),
    2: .same(proto: "alt"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.uri)
      case 2: try decoder.decodeSingularStringField(value: &self.alt)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.uri.isEmpty {
      try visitor.visitSingularStringField(value: self.uri, fieldNumber: 1)
    }
    if !self.alt.isEmpty {
      try visitor.visitSingularStringField(value: self.alt, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Page_MediaAsset.Link, rhs: Bloombox_Page_MediaAsset.Link) -> Bool {
    if lhs.uri != rhs.uri {return false}
    if lhs.alt != rhs.alt {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Page_MediaAsset.Image: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Page_MediaAsset.protoMessageName + ".Image"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "asset"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.asset)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.asset.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.asset, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Page_MediaAsset.Image, rhs: Bloombox_Page_MediaAsset.Image) -> Bool {
    if lhs.asset != rhs.asset {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Page_MediaAsset.Image.ImageAsset: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Page_MediaAsset.Image.protoMessageName + ".ImageAsset"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "resolution"),
    2: .same(proto: "kind"),
    3: .same(proto: "width"),
    4: .same(proto: "height"),
    10: .same(proto: "b64"),
    20: .same(proto: "uri"),
    30: .same(proto: "ref"),
  ]

  fileprivate class _StorageClass {
    var _resolution: Opencannabis_Media_MediaType.ImageDPI = .x1
    var _kind: Opencannabis_Media_MediaType.ImageKind = .unspecifiedImageType
    var _width: UInt64 = 0
    var _height: UInt64 = 0
    var _content: Bloombox_Page_MediaAsset.Image.ImageAsset.OneOf_Content?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _resolution = source._resolution
      _kind = source._kind
      _width = source._width
      _height = source._height
      _content = source._content
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
        case 1: try decoder.decodeSingularEnumField(value: &_storage._resolution)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._kind)
        case 3: try decoder.decodeSingularUInt64Field(value: &_storage._width)
        case 4: try decoder.decodeSingularUInt64Field(value: &_storage._height)
        case 10:
          if _storage._content != nil {try decoder.handleConflictingOneOf()}
          var v: String?
          try decoder.decodeSingularStringField(value: &v)
          if let v = v {_storage._content = .b64(v)}
        case 20:
          if _storage._content != nil {try decoder.handleConflictingOneOf()}
          var v: String?
          try decoder.decodeSingularStringField(value: &v)
          if let v = v {_storage._content = .uri(v)}
        case 30:
          var v: Opencannabis_Media_MediaReference?
          if let current = _storage._content {
            try decoder.handleConflictingOneOf()
            if case .ref(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._content = .ref(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._resolution != .x1 {
        try visitor.visitSingularEnumField(value: _storage._resolution, fieldNumber: 1)
      }
      if _storage._kind != .unspecifiedImageType {
        try visitor.visitSingularEnumField(value: _storage._kind, fieldNumber: 2)
      }
      if _storage._width != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._width, fieldNumber: 3)
      }
      if _storage._height != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._height, fieldNumber: 4)
      }
      switch _storage._content {
      case .b64(let v)?:
        try visitor.visitSingularStringField(value: v, fieldNumber: 10)
      case .uri(let v)?:
        try visitor.visitSingularStringField(value: v, fieldNumber: 20)
      case .ref(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 30)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Page_MediaAsset.Image.ImageAsset, rhs: Bloombox_Page_MediaAsset.Image.ImageAsset) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._resolution != rhs_storage._resolution {return false}
        if _storage._kind != rhs_storage._kind {return false}
        if _storage._width != rhs_storage._width {return false}
        if _storage._height != rhs_storage._height {return false}
        if _storage._content != rhs_storage._content {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Page_MediaAsset.Video: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Page_MediaAsset.protoMessageName + ".Video"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "provider"),
    2: .same(proto: "title"),
    3: .same(proto: "description"),
    4: .standard(proto: "run_time"),
    5: .same(proto: "asset"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.provider)
      case 2: try decoder.decodeSingularStringField(value: &self.title)
      case 3: try decoder.decodeSingularStringField(value: &self.description_p)
      case 4: try decoder.decodeSingularUInt64Field(value: &self.runTime)
      case 5: try decoder.decodeRepeatedMessageField(value: &self.asset)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.provider != .private {
      try visitor.visitSingularEnumField(value: self.provider, fieldNumber: 1)
    }
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 2)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 3)
    }
    if self.runTime != 0 {
      try visitor.visitSingularUInt64Field(value: self.runTime, fieldNumber: 4)
    }
    if !self.asset.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.asset, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Page_MediaAsset.Video, rhs: Bloombox_Page_MediaAsset.Video) -> Bool {
    if lhs.provider != rhs.provider {return false}
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.runTime != rhs.runTime {return false}
    if lhs.asset != rhs.asset {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Page_MediaAsset.Video.VideoAsset: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Page_MediaAsset.Video.protoMessageName + ".VideoAsset"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "resolution"),
    2: .same(proto: "thumb"),
    3: .same(proto: "uri"),
  ]

  fileprivate class _StorageClass {
    var _resolution: Bloombox_Page_VideoResolution = .low
    var _thumb: Bloombox_Page_MediaAsset.Image? = nil
    var _uri: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _resolution = source._resolution
      _thumb = source._thumb
      _uri = source._uri
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
        case 1: try decoder.decodeSingularEnumField(value: &_storage._resolution)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._thumb)
        case 3: try decoder.decodeSingularStringField(value: &_storage._uri)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._resolution != .low {
        try visitor.visitSingularEnumField(value: _storage._resolution, fieldNumber: 1)
      }
      if let v = _storage._thumb {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if !_storage._uri.isEmpty {
        try visitor.visitSingularStringField(value: _storage._uri, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Page_MediaAsset.Video.VideoAsset, rhs: Bloombox_Page_MediaAsset.Video.VideoAsset) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._resolution != rhs_storage._resolution {return false}
        if _storage._thumb != rhs_storage._thumb {return false}
        if _storage._uri != rhs_storage._uri {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
