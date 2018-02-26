// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: content/Brand.proto
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

///Basic Properties
public struct Opencannabis_Content_Brand {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var name: Opencannabis_Content_Name {
    get {return _storage._name ?? Opencannabis_Content_Name()}
    set {_uniqueStorage()._name = newValue}
  }
  /// Returns true if `name` has been explicitly set.
  public var hasName: Bool {return _storage._name != nil}
  /// Clears the value of `name`. Subsequent reads from it will return its default value.
  public mutating func clearName() {_storage._name = nil}

  public var parent: Opencannabis_Content_Brand {
    get {return _storage._parent ?? Opencannabis_Content_Brand()}
    set {_uniqueStorage()._parent = newValue}
  }
  /// Returns true if `parent` has been explicitly set.
  public var hasParent: Bool {return _storage._parent != nil}
  /// Clears the value of `parent`. Subsequent reads from it will return its default value.
  public mutating func clearParent() {_storage._parent = nil}

  public var summary: Opencannabis_Content_Content {
    get {return _storage._summary ?? Opencannabis_Content_Content()}
    set {_uniqueStorage()._summary = newValue}
  }
  /// Returns true if `summary` has been explicitly set.
  public var hasSummary: Bool {return _storage._summary != nil}
  /// Clears the value of `summary`. Subsequent reads from it will return its default value.
  public mutating func clearSummary() {_storage._summary = nil}

  ///Media
  public var media: [Opencannabis_Media_MediaItem] {
    get {return _storage._media}
    set {_uniqueStorage()._media = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opencannabis.content"

extension Opencannabis_Content_Brand: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Brand"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "parent"),
    3: .same(proto: "summary"),
    20: .same(proto: "media"),
  ]

  fileprivate class _StorageClass {
    var _name: Opencannabis_Content_Name? = nil
    var _parent: Opencannabis_Content_Brand? = nil
    var _summary: Opencannabis_Content_Content? = nil
    var _media: [Opencannabis_Media_MediaItem] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _name = source._name
      _parent = source._parent
      _summary = source._summary
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._name)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._parent)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._summary)
        case 20: try decoder.decodeRepeatedMessageField(value: &_storage._media)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._name {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._parent {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._summary {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if !_storage._media.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._media, fieldNumber: 20)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Opencannabis_Content_Brand) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._name != other_storage._name {return false}
        if _storage._parent != other_storage._parent {return false}
        if _storage._summary != other_storage._summary {return false}
        if _storage._media != other_storage._media {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
