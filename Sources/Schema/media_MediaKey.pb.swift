// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: media/MediaKey.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Provides structures relating to a media key and reference.

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

/// Key uniquely describing an item of media known to the system. An "item of media" can be anything from an image or a
/// video, to a PDF document, or larger data.
public struct Opencannabis_Media_MediaKey {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Unique ID for this media item.
  public var id: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Reference to a global media item, which consists of at least a key/ID and a URL at which the media may be consumed.
/// Referenced media is expected to be public.
public struct Opencannabis_Media_MediaReference {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Key for the media item.
  public var key: Opencannabis_Media_MediaKey {
    get {return _storage._key ?? Opencannabis_Media_MediaKey()}
    set {_uniqueStorage()._key = newValue}
  }
  /// Returns true if `key` has been explicitly set.
  public var hasKey: Bool {return _storage._key != nil}
  /// Clears the value of `key`. Subsequent reads from it will return its default value.
  public mutating func clearKey() {_uniqueStorage()._key = nil}

  /// URI at which the media item can be consumed/downloaded.
  public var uri: String {
    get {return _storage._uri}
    set {_uniqueStorage()._uri = newValue}
  }

  /// Specifies the type of media being referenced.
  public var type: Opencannabis_Media_MediaType {
    get {return _storage._type ?? Opencannabis_Media_MediaType()}
    set {_uniqueStorage()._type = newValue}
  }
  /// Returns true if `type` has been explicitly set.
  public var hasType: Bool {return _storage._type != nil}
  /// Clears the value of `type`. Subsequent reads from it will return its default value.
  public mutating func clearType() {_uniqueStorage()._type = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.media"

extension Opencannabis_Media_MediaKey: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MediaKey"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Media_MediaKey, rhs: Opencannabis_Media_MediaKey) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opencannabis_Media_MediaReference: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".MediaReference"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "uri"),
    3: .same(proto: "type"),
  ]

  fileprivate class _StorageClass {
    var _key: Opencannabis_Media_MediaKey? = nil
    var _uri: String = String()
    var _type: Opencannabis_Media_MediaType? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _key = source._key
      _uri = source._uri
      _type = source._type
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._key)
        case 2: try decoder.decodeSingularStringField(value: &_storage._uri)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._type)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._key {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._uri.isEmpty {
        try visitor.visitSingularStringField(value: _storage._uri, fieldNumber: 2)
      }
      if let v = _storage._type {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Opencannabis_Media_MediaReference, rhs: Opencannabis_Media_MediaReference) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._key != rhs_storage._key {return false}
        if _storage._uri != rhs_storage._uri {return false}
        if _storage._type != rhs_storage._type {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
