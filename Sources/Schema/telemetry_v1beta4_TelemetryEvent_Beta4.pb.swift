// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: telemetry/v1beta4/TelemetryEvent_Beta4.proto
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

/// Wrapper object that provides support for transporting telemetry data of any kind.
public struct Bloombox_Schema_Services_Telemetry_V1beta4_TelemetryEvent {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// UUID, as assigned by the server upon receiving this event.
  public var uuid: String {
    get {return _storage._uuid}
    set {_uniqueStorage()._uuid = newValue}
  }

  /// Parent event that yielded this event, if applicable.
  public var parent: String {
    get {return _storage._parent}
    set {_uniqueStorage()._parent = newValue}
  }

  /// Flag indicating this event is internal, meaning, it is not to be re-processed or mirrored to internal event
  /// streams, where it could cause an infinite loop.
  public var `internal`: Bool {
    get {return _storage._internal}
    set {_uniqueStorage()._internal = newValue}
  }

  /// 'Position', or timing, of the event, in various circumstances.
  public var timing: Bloombox_Schema_Analytics_EventPosition {
    get {return _storage._timing ?? Bloombox_Schema_Analytics_EventPosition()}
    set {_uniqueStorage()._timing = newValue}
  }
  /// Returns true if `timing` has been explicitly set.
  public var hasTiming: Bool {return _storage._timing != nil}
  /// Clears the value of `timing`. Subsequent reads from it will return its default value.
  public mutating func clearTiming() {_storage._timing = nil}

  /// Event context.
  public var context: Bloombox_Schema_Analytics_Context {
    get {return _storage._context ?? Bloombox_Schema_Analytics_Context()}
    set {_uniqueStorage()._context = newValue}
  }
  /// Returns true if `context` has been explicitly set.
  public var hasContext: Bool {return _storage._context != nil}
  /// Clears the value of `context`. Subsequent reads from it will return its default value.
  public mutating func clearContext() {_storage._context = nil}

  /// Full event actor records.
  public var actors: Bloombox_Schema_Analytics_EventActors {
    get {return _storage._actors ?? Bloombox_Schema_Analytics_EventActors()}
    set {_uniqueStorage()._actors = newValue}
  }
  /// Returns true if `actors` has been explicitly set.
  public var hasActors: Bool {return _storage._actors != nil}
  /// Clears the value of `actors`. Subsequent reads from it will return its default value.
  public mutating func clearActors() {_storage._actors = nil}

  /// Event data payload.
  public var event: OneOf_Event? {
    get {return _storage._event}
    set {_uniqueStorage()._event = newValue}
  }

  /// Generic: Event.
  public var generic: Bloombox_Schema_Analytics_Generic_Event {
    get {
      if case .generic(let v)? = _storage._event {return v}
      return Bloombox_Schema_Analytics_Generic_Event()
    }
    set {_uniqueStorage()._event = .generic(newValue)}
  }

  /// Generic: Exception.
  public var error: Bloombox_Schema_Analytics_Generic_Exception {
    get {
      if case .error(let v)? = _storage._event {return v}
      return Bloombox_Schema_Analytics_Generic_Exception()
    }
    set {_uniqueStorage()._event = .error(newValue)}
  }

  /// Sections: Impression.
  public var impression: Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.Impression {
    get {
      if case .impression(let v)? = _storage._event {return v}
      return Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.Impression()
    }
    set {_uniqueStorage()._event = .impression(newValue)}
  }

  /// Sections: View.
  public var view: Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.View {
    get {
      if case .view(let v)? = _storage._event {return v}
      return Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.View()
    }
    set {_uniqueStorage()._event = .view(newValue)}
  }

  /// Sections: Action.
  public var action: Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.Action {
    get {
      if case .action(let v)? = _storage._event {return v}
      return Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.Action()
    }
    set {_uniqueStorage()._event = .action(newValue)}
  }

  /// Users: Action.
  public var userAction: Bloombox_Schema_Services_Telemetry_V1beta4_IdentityEvent.Action {
    get {
      if case .userAction(let v)? = _storage._event {return v}
      return Bloombox_Schema_Services_Telemetry_V1beta4_IdentityEvent.Action()
    }
    set {_uniqueStorage()._event = .userAction(newValue)}
  }

  /// Search: Query.
  public var searchQuery: Bloombox_Schema_Services_Telemetry_V1beta4_SearchEvent.Query {
    get {
      if case .searchQuery(let v)? = _storage._event {return v}
      return Bloombox_Schema_Services_Telemetry_V1beta4_SearchEvent.Query()
    }
    set {_uniqueStorage()._event = .searchQuery(newValue)}
  }

  /// Search: Result.
  public var searchResult: Bloombox_Schema_Services_Telemetry_V1beta4_SearchEvent.Result {
    get {
      if case .searchResult(let v)? = _storage._event {return v}
      return Bloombox_Schema_Services_Telemetry_V1beta4_SearchEvent.Result()
    }
    set {_uniqueStorage()._event = .searchResult(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Event data payload.
  public enum OneOf_Event: Equatable {
    /// Generic: Event.
    case generic(Bloombox_Schema_Analytics_Generic_Event)
    /// Generic: Exception.
    case error(Bloombox_Schema_Analytics_Generic_Exception)
    /// Sections: Impression.
    case impression(Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.Impression)
    /// Sections: View.
    case view(Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.View)
    /// Sections: Action.
    case action(Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.Action)
    /// Users: Action.
    case userAction(Bloombox_Schema_Services_Telemetry_V1beta4_IdentityEvent.Action)
    /// Search: Query.
    case searchQuery(Bloombox_Schema_Services_Telemetry_V1beta4_SearchEvent.Query)
    /// Search: Result.
    case searchResult(Bloombox_Schema_Services_Telemetry_V1beta4_SearchEvent.Result)

    public static func ==(lhs: Bloombox_Schema_Services_Telemetry_V1beta4_TelemetryEvent.OneOf_Event, rhs: Bloombox_Schema_Services_Telemetry_V1beta4_TelemetryEvent.OneOf_Event) -> Bool {
      switch (lhs, rhs) {
      case (.generic(let l), .generic(let r)): return l == r
      case (.error(let l), .error(let r)): return l == r
      case (.impression(let l), .impression(let r)): return l == r
      case (.view(let l), .view(let r)): return l == r
      case (.action(let l), .action(let r)): return l == r
      case (.userAction(let l), .userAction(let r)): return l == r
      case (.searchQuery(let l), .searchQuery(let r)): return l == r
      case (.searchResult(let l), .searchResult(let r)): return l == r
      default: return false
      }
    }
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bloombox.schema.services.telemetry.v1beta4"

extension Bloombox_Schema_Services_Telemetry_V1beta4_TelemetryEvent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TelemetryEvent"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uuid"),
    2: .same(proto: "parent"),
    3: .same(proto: "internal"),
    4: .same(proto: "timing"),
    5: .same(proto: "context"),
    6: .same(proto: "actors"),
    10: .same(proto: "generic"),
    11: .same(proto: "error"),
    20: .same(proto: "impression"),
    21: .same(proto: "view"),
    22: .same(proto: "action"),
    30: .standard(proto: "user_action"),
    31: .standard(proto: "search_query"),
    32: .standard(proto: "search_result"),
  ]

  fileprivate class _StorageClass {
    var _uuid: String = String()
    var _parent: String = String()
    var _internal: Bool = false
    var _timing: Bloombox_Schema_Analytics_EventPosition? = nil
    var _context: Bloombox_Schema_Analytics_Context? = nil
    var _actors: Bloombox_Schema_Analytics_EventActors? = nil
    var _event: Bloombox_Schema_Services_Telemetry_V1beta4_TelemetryEvent.OneOf_Event?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _uuid = source._uuid
      _parent = source._parent
      _internal = source._internal
      _timing = source._timing
      _context = source._context
      _actors = source._actors
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._uuid)
        case 2: try decoder.decodeSingularStringField(value: &_storage._parent)
        case 3: try decoder.decodeSingularBoolField(value: &_storage._internal)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._timing)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._context)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._actors)
        case 10:
          var v: Bloombox_Schema_Analytics_Generic_Event?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .generic(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .generic(v)}
        case 11:
          var v: Bloombox_Schema_Analytics_Generic_Exception?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .error(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .error(v)}
        case 20:
          var v: Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.Impression?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .impression(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .impression(v)}
        case 21:
          var v: Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.View?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .view(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .view(v)}
        case 22:
          var v: Bloombox_Schema_Services_Telemetry_V1beta4_CommercialEvent.Action?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .action(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .action(v)}
        case 30:
          var v: Bloombox_Schema_Services_Telemetry_V1beta4_IdentityEvent.Action?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .userAction(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .userAction(v)}
        case 31:
          var v: Bloombox_Schema_Services_Telemetry_V1beta4_SearchEvent.Query?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .searchQuery(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .searchQuery(v)}
        case 32:
          var v: Bloombox_Schema_Services_Telemetry_V1beta4_SearchEvent.Result?
          if let current = _storage._event {
            try decoder.handleConflictingOneOf()
            if case .searchResult(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._event = .searchResult(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._uuid.isEmpty {
        try visitor.visitSingularStringField(value: _storage._uuid, fieldNumber: 1)
      }
      if !_storage._parent.isEmpty {
        try visitor.visitSingularStringField(value: _storage._parent, fieldNumber: 2)
      }
      if _storage._internal != false {
        try visitor.visitSingularBoolField(value: _storage._internal, fieldNumber: 3)
      }
      if let v = _storage._timing {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._context {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._actors {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      switch _storage._event {
      case .generic(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .error(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case .impression(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 20)
      case .view(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 21)
      case .action(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 22)
      case .userAction(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 30)
      case .searchQuery(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 31)
      case .searchResult(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 32)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public func _protobuf_generated_isEqualTo(other: Bloombox_Schema_Services_Telemetry_V1beta4_TelemetryEvent) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._uuid != other_storage._uuid {return false}
        if _storage._parent != other_storage._parent {return false}
        if _storage._internal != other_storage._internal {return false}
        if _storage._timing != other_storage._timing {return false}
        if _storage._context != other_storage._context {return false}
        if _storage._actors != other_storage._actors {return false}
        if _storage._event != other_storage._event {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}