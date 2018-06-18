// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: partner/integrations/GSuiteSettings.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

///*
/// Specifies a partner or partner location's settings for integrating with GSuite.

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

/// Specifies Google Apps features that may be enabled or disabled.
public struct Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteIntegrationFeatures {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Specifies settings related to Google Apps integration with Bloombox.
public struct Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Primary domain for the integration.
  public var domain: String {
    get {return _storage._domain}
    set {_uniqueStorage()._domain = newValue}
  }

  /// Flags indicating features that should be enabled or disabled.
  public var features: Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteIntegrationFeatures {
    get {return _storage._features ?? Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteIntegrationFeatures()}
    set {_uniqueStorage()._features = newValue}
  }
  /// Returns true if `features` has been explicitly set.
  public var hasFeatures: Bool {return _storage._features != nil}
  /// Clears the value of `features`. Subsequent reads from it will return its default value.
  public mutating func clearFeatures() {_storage._features = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.partner.integrations.gsuite"

extension Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteIntegrationFeatures: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GSuiteIntegrationFeatures"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteIntegrationFeatures) -> Bool {
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GSuiteSettings"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "domain"),
    10: .same(proto: "features"),
  ]

  fileprivate class _StorageClass {
    var _domain: String = String()
    var _features: Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteIntegrationFeatures? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _domain = source._domain
      _features = source._features
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._domain)
        case 10: try decoder.decodeSingularMessageField(value: &_storage._features)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._domain.isEmpty {
        try visitor.visitSingularStringField(value: _storage._domain, fieldNumber: 1)
      }
      if let v = _storage._features {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Partner_Integrations_Gsuite_GSuiteSettings) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._domain != other_storage._domain {return false}
        if _storage._features != other_storage._features {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
