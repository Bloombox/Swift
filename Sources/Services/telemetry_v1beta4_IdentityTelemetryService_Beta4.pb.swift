// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: telemetry/v1beta4/IdentityTelemetryService_Beta4.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

/**
* Copyright 2019, Momentum Ideas, Co. All rights reserved.
* Source and object computer code contained herein is the private intellectual
* property of Momentum Ideas Co., a Delaware Corporation. Use of this
* code in source form requires permission in writing before use or the
* assembly, distribution, or publishing of derivative works, for commercial
* purposes or any other purpose, from a duly authorized officer of Momentum
* Ideas Co.
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

///*
/// Provides services for identity-related telemetry data, or, data involved with user authorization and profile actions,
/// or from actions taken by the user on those data objects.

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

/// Specifies an event related to a user's identity, account, preferences, or otherwise having some concern with the
/// addressability, authentication, and relevance of a user's experience with Bloombox.
public struct Bloombox_Services_Telemetry_V1beta4_IdentityEvent {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Action taken by or on a user.
  public struct Action {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Name of the action we are reporting.
    public var name: String {
      get {return _storage._name}
      set {_uniqueStorage()._name = newValue}
    }

    /// Event context to specify for this event.
    public var context: Bloombox_Analytics_Context {
      get {return _storage._context ?? Bloombox_Analytics_Context()}
      set {_uniqueStorage()._context = newValue}
    }
    /// Returns true if `context` has been explicitly set.
    public var hasContext: Bool {return _storage._context != nil}
    /// Clears the value of `context`. Subsequent reads from it will return its default value.
    public mutating func clearContext() {_uniqueStorage()._context = nil}

    public var event: OneOf_Event? {
      get {return _storage._event}
      set {_uniqueStorage()._event = newValue}
    }

    /// Action taken by or on a user.
    public var action: Bloombox_Analytics_Identity_Action {
      get {
        if case .action(let v)? = _storage._event {return v}
        return Bloombox_Analytics_Identity_Action()
      }
      set {_uniqueStorage()._event = .action(newValue)}
    }

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public enum OneOf_Event: Equatable {
      /// Action taken by or on a user.
      case action(Bloombox_Analytics_Identity_Action)

    #if !swift(>=4.1)
      public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_IdentityEvent.Action.OneOf_Event, rhs: Bloombox_Services_Telemetry_V1beta4_IdentityEvent.Action.OneOf_Event) -> Bool {
        switch (lhs, rhs) {
        case (.action(let l), .action(let r)): return l == r
        }
      }
    #endif
    }

    public init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.services.telemetry.v1beta4"

extension Bloombox_Services_Telemetry_V1beta4_IdentityEvent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".IdentityEvent"
  public static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_IdentityEvent, rhs: Bloombox_Services_Telemetry_V1beta4_IdentityEvent) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bloombox_Services_Telemetry_V1beta4_IdentityEvent.Action: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Bloombox_Services_Telemetry_V1beta4_IdentityEvent.protoMessageName + ".Action"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "context"),
    10: .same(proto: "action"),
  ]

  fileprivate class _StorageClass {
    var _name: String = String()
    var _context: Bloombox_Analytics_Context? = nil
    var _event: Bloombox_Services_Telemetry_V1beta4_IdentityEvent.Action.OneOf_Event?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _name = source._name
      _context = source._context
      _event = source._event
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._name)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._context)
        case 10:
          var v: Bloombox_Analytics_Identity_Action?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .action(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .action(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 1)
      }
      if let v = _storage._context {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if case .action(let v)? = _storage._event {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bloombox_Services_Telemetry_V1beta4_IdentityEvent.Action, rhs: Bloombox_Services_Telemetry_V1beta4_IdentityEvent.Action) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._name != rhs_storage._name {return false}
        if _storage._context != rhs_storage._context {return false}
        if _storage._event != rhs_storage._event {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}