// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: identity/bioprint/Affinities.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Defines the structure of *Affinities*, which are stored in a user's Bioprint, and relate their personal cannabis use
/// experience and response back to general concepts.

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

/// Specifies an individual sentiment response payload, which carries content for a user's experiential response. Stanza
/// payloads are mapped to aspects of consumer use and maintain two response summaries: one for promotion and one for
/// rejection. Promotion of products occurs when a product is deemed to likely "work" for a customer.
public struct Bloombox_Identity_Bioprint_SentimentResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies product filters that promote subject products. Items "promoted" in this fashion are arranged or displayed
  /// in such a way as to encourage the user to try them, because they might work to achieve their inferred or declared
  /// desired cannabis outcomes. Promoted products do not factor in price beyond filters the user has set for themselves,
  /// and they do not inherently factor in provider-side commerce/economics-based decision making.
  public var promote: Bloombox_Stream_OITDBloomFilter {
    get {return _storage._promote ?? Bloombox_Stream_OITDBloomFilter()}
    set {_uniqueStorage()._promote = newValue}
  }
  /// Returns true if `promote` has been explicitly set.
  public var hasPromote: Bool {return _storage._promote != nil}
  /// Clears the value of `promote`. Subsequent reads from it will return its default value.
  public mutating func clearPromote() {_uniqueStorage()._promote = nil}

  /// Specifies product filters that reject subject products. Items "rejected" in this fashion are entirely hidden from
  /// view, by default. Users opt-in to this feature to hide products that present harm or may be dangerous for their
  /// consumption. Products that land in this category must still be visible on the menu, but hidden behind a prompt that
  /// allows the user to explicitly opt-in to seeing them, rather than displaying them normally.
  public var reject: Bloombox_Stream_OITDBloomFilter {
    get {return _storage._reject ?? Bloombox_Stream_OITDBloomFilter()}
    set {_uniqueStorage()._reject = newValue}
  }
  /// Returns true if `reject` has been explicitly set.
  public var hasReject: Bool {return _storage._reject != nil}
  /// Clears the value of `reject`. Subsequent reads from it will return its default value.
  public mutating func clearReject() {_uniqueStorage()._reject = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Describes a mapping between an aspect of cannabis use, and a user's affinity rating, both for promotion and rejection
/// of products based on the composure fo those products.
public struct Bloombox_Identity_Bioprint_Affinity {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the affinity content attached to this aspect/affinity scope mapping. The stanza includes metrics for
  /// promotion or rejection of products based on composition.
  public var affinity: [Bloombox_Identity_Bioprint_SentimentResponse] {
    get {return _storage._affinity}
    set {_uniqueStorage()._affinity = newValue}
  }

  /// Indicates the relative significance of this affinity value, when weighing it against other metrics. Significance
  /// can be gathered from different signals, and so, each is summed here by signal type when calculating the weight
  /// value to apply during Bioprint interrogation at the point-of-purchase.
  public var significance: [Bloombox_Identity_Bioprint_MetricSignificance] {
    get {return _storage._significance}
    set {_uniqueStorage()._significance = newValue}
  }

  /// Specifies the scope of this affinity mapping. The scope can either be one individual "aspect," or a set of aspects,
  /// called an "aspect group."
  public var scope: OneOf_Scope? {
    get {return _storage._scope}
    set {_uniqueStorage()._scope = newValue}
  }

  /// Specifies an individual aspect-of-use, for which this affinity mapping applies.
  public var aspect: Bloombox_Identity_Bioprint_Aspect {
    get {
      if case .aspect(let v)? = _storage._scope {return v}
      return Bloombox_Identity_Bioprint_Aspect()
    }
    set {_uniqueStorage()._scope = .aspect(newValue)}
  }

  /// Specifies an aspect-of-use aggregate group, for which this affinity mapping applies.
  public var group: Bloombox_Identity_Bioprint_AspectGroup {
    get {
      if case .group(let v)? = _storage._scope {return v}
      return Bloombox_Identity_Bioprint_AspectGroup()
    }
    set {_uniqueStorage()._scope = .group(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Specifies the scope of this affinity mapping. The scope can either be one individual "aspect," or a set of aspects,
  /// called an "aspect group."
  public enum OneOf_Scope: Equatable {
    /// Specifies an individual aspect-of-use, for which this affinity mapping applies.
    case aspect(Bloombox_Identity_Bioprint_Aspect)
    /// Specifies an aspect-of-use aggregate group, for which this affinity mapping applies.
    case group(Bloombox_Identity_Bioprint_AspectGroup)

  #if !swift(>=4.1)
    public static func ==(lhs: Bloombox_Identity_Bioprint_Affinity.OneOf_Scope, rhs: Bloombox_Identity_Bioprint_Affinity.OneOf_Scope) -> Bool {
      switch (lhs, rhs) {
      case (.aspect(let l), .aspect(let r)): return l == r
      case (.group(let l), .group(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.identity.bioprint"

extension Bloombox_Identity_Bioprint_SentimentResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SentimentResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "promote"),
    2: .same(proto: "reject"),
  ]

  fileprivate class _StorageClass {
    var _promote: Bloombox_Stream_OITDBloomFilter? = nil
    var _reject: Bloombox_Stream_OITDBloomFilter? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _promote = source._promote
      _reject = source._reject
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._promote)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._reject)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._promote {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._reject {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Identity_Bioprint_SentimentResponse, rhs: Bloombox_Identity_Bioprint_SentimentResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._promote != rhs_storage._promote {return false}
        if _storage._reject != rhs_storage._reject {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Identity_Bioprint_Affinity: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Affinity"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "affinity"),
    2: .same(proto: "significance"),
    10: .same(proto: "aspect"),
    11: .same(proto: "group"),
  ]

  fileprivate class _StorageClass {
    var _affinity: [Bloombox_Identity_Bioprint_SentimentResponse] = []
    var _significance: [Bloombox_Identity_Bioprint_MetricSignificance] = []
    var _scope: Bloombox_Identity_Bioprint_Affinity.OneOf_Scope?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _affinity = source._affinity
      _significance = source._significance
      _scope = source._scope
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
        case 1: try decoder.decodeRepeatedMessageField(value: &_storage._affinity)
        case 2: try decoder.decodeRepeatedMessageField(value: &_storage._significance)
        case 10:
          var v: Bloombox_Identity_Bioprint_Aspect?
          if let current = _storage._scope {
            try decoder.handleConflictingOneOf()
            if case .aspect(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._scope = .aspect(v)}
        case 11:
          var v: Bloombox_Identity_Bioprint_AspectGroup?
          if let current = _storage._scope {
            try decoder.handleConflictingOneOf()
            if case .group(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._scope = .group(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._affinity.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._affinity, fieldNumber: 1)
      }
      if !_storage._significance.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._significance, fieldNumber: 2)
      }
      switch _storage._scope {
      case .aspect(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .group(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Identity_Bioprint_Affinity, rhs: Bloombox_Identity_Bioprint_Affinity) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._affinity != rhs_storage._affinity {return false}
        if _storage._significance != rhs_storage._significance {return false}
        if _storage._scope != rhs_storage._scope {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}