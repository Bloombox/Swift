//
//  TelemetryService+Generic.swift
//  Client
//
//  Created by James Clark on 12/13/17.
//

import Foundation
import SwiftProtobuf


//// Protobuf Types
typealias BoolValue = Google_Protobuf_BoolValue
typealias NullValue = Google_Protobuf_NullValue
typealias StringValue = Google_Protobuf_StringValue
typealias ListValue = Google_Protobuf_ListValue


/// Enumerates errors that may be thrown during operations related to serializing and transmitting generic telemetry
/// events.
public enum GenericEventError: Error {
  /// An error occurred serializing a generic telemetry event's payload. This can only happen because an unrecognized
  /// type of some kind was found an event's payload.
  case serializationError
}


///  Convert an arbitrary Swift value into a Protobuf value of some kind.
fileprivate func convertToValue(value: Any) throws -> ProtobufValue {
  // number types first...
  if let valueAsDouble = value as? Double {
    return ProtobufValue.with { valueBuilder in
      valueBuilder.numberValue = valueAsDouble
    }
  } else if let valueAsInt = value as? Int {
    return ProtobufValue.with { valueBuilder in
      valueBuilder.numberValue = Double(valueAsInt)
    }
  } else if let valueAsUint = value as? UInt {
    return ProtobufValue.with { valueBuilder in
      valueBuilder.numberValue = Double(valueAsUint)
    }
  } else if let valueAsBool = value as? Bool {

    // bools next...
    return ProtobufValue.with { valueBuilder in
      valueBuilder.boolValue = valueAsBool
    }
  } else if let valueAsString = value as? String {

    // then strings...
    return ProtobufValue.with { valueBuilder in
      valueBuilder.stringValue = valueAsString
    }

    // then arrays...
  } else if let valueAsList = value as? Array<Any> {
    // it's an array of some kind
    var innerValues: [ProtobufValue] = []
    for anyValue in valueAsList {
      innerValues.append(try convertToValue(value: anyValue))
    }

    // serialize as list
    return ProtobufValue.with { valueBuilder in
      valueBuilder.listValue = ListValue.init(values: innerValues)
    }

    // then maps...
  } else if let valueAsMap = value as? Dictionary<String, Any> {
    // it's a substruct of some kind
    var innerMap: [String: ProtobufValue] = [:]
    for innerKey in valueAsMap.keys {
      let innerValue = valueAsMap[innerKey]
      if innerValue != nil {
        innerMap[innerKey] = try convertToValue(value: innerValue!)
      }
    }
    return ProtobufValue.with { valueBuilder in
      valueBuilder.structValue = ProtobufStruct.init(fields: innerMap)
    }
  }
  throw GenericEventError.serializationError
}


/// Convert a dictionary or dictionary literal into a Protobuf struct, filled with Protobuf values.
fileprivate func convertToStruct(dict: [String: Any]) throws -> ProtobufStruct {
  var properties: [String: ProtobufValue] = [:]

  for key in dict.keys {
    let anyValue = dict[key]

    if anyValue != nil {
      properties[key] = try convertToValue(value: anyValue!)
    }
  }
  return ProtobufStruct.init(fields: properties)
}


///
///
extension TelemetryClient {
  // MARK: Event Telemetry

  /// Method `ping`. Send a message to the Telemetry service, and receive a message back. This function is intended to
  /// warm the connection and measure latency.
  ///
  func ping() throws -> Double {
    let request = TelemetryPing.Request()
    let ts = (Date().timeIntervalSinceReferenceDate * 1000)
    let _ = try events.ping(request)
    let tsEnd = (Date().timeIntervalSinceReferenceDate * 1000)
    let diff = Double(round((tsEnd - ts)*1000)/1000)
    return diff
  }

  /// Method `ping`. Send a message to the Telemetry service, and receive a message back. This function is intended to
  /// warm the connection and measure latency.
  ///
  @discardableResult
  func ping(callback: PingCallback? = nil) throws -> TelemetryPingCall {
    let request = TelemetryPing.Request()
    let ts = (Date().timeIntervalSinceReferenceDate * 1000)
    let call = try events.ping(request) { callResult, response in
      let tsEnd = (Date().timeIntervalSinceReferenceDate * 1000)
      let diff = Double(round((tsEnd - ts)*1000)/1000)
      callback?(diff)
    }
    return call
  }

  /// Method `event`. Submit a generic event to the Telemetry service. Can be used for any visibility instrumentation
  /// desired and supports arbitrary JSON payloads. This variant offers a simpler interface for simpler events.
  ///
  @discardableResult
  func event(collection: EventCollection,
             payload: [String: Any]) throws -> TelemetryEventCall {
    return try self.event(
      collection: collection,
      uuid: nil,
      payload: payload,
      occurred: nil,
      context: nil) { (result) in
        // do nothing, we don't care
    }
  }

  /// Method `event`. Submit a generic event to the Telemetry service. Can be used for any visibility instrumentation
  /// desired and supports arbitrary JSON payloads. This variant offers a simpler interface for simpler events, along
  /// with a callback.
  ///
  @discardableResult
  func event(collection: EventCollection,
             payload: [String: Any],
             context: EventContext,
             callback: GenericEventCallback? = nil) throws -> TelemetryEventCall {
    return try self.event(
      collection: collection,
      uuid: nil,
      payload: payload,
      occurred: nil,
      context: context) { (result) in
        // do nothing, we don't care
        callback?(result)
    }
  }

  /// Method `event`. Submit a generic event to the Telemetry service. Can be used for any visibility instrumentation
  /// desired and supports arbitrary JSON payloads.
  ///
  @discardableResult
  func event(collection: EventCollection,
             uuid: String,
             payload: [String: Any],
             occurred: Double? = nil,
             context: EventContext? = nil) throws -> TelemetryEventCall {
    return try self.event(
      collection: collection,
      uuid: uuid,
      payload: payload,
      occurred: occurred,
      context: context) { (result) in
        // do nothing, we don't care
    }
  }

  /// Method `event`. Submit a generic event to the Telemetry service asynchronously. Can be used for any visibility
  /// instrumentation desired and supports arbitrary JSON payloads. This method variant supports a callback.
  ///
  @discardableResult
  func event(collection: EventCollection,
             uuid: String? = nil,
             payload: [String: Any]? = nil,
             occurred: Double? = nil,
             context: EventContext? = nil,
             callback: GenericEventCallback? = nil) throws -> TelemetryEventCall {
    // merge/resolve event context
    var merged: AnalyticsContext
    if let c = context {
      var exported = c.export()
      let globalContext = settings.export()
      let serialized = try globalContext.serializedData()
      try exported.merge(serializedData: serialized)
      merged = exported
    } else {
      merged = settings.export()
    }

    // override collection, if so directed
    merged.collection = collection.export()

    // serialize payload, if any
    let eventPayload: ProtobufStruct? = (
      payload != nil ? try convertToStruct(dict: payload!) : nil)

    return try events.event(Event.Request.with { event in
      event.uuid = uuid ?? UUID.init().uuidString.uppercased()
      event.context = merged
      event.event = GenericEvent.with { genericEvent in
        genericEvent.occurred = TemporalInstant.with { instant in
          let ts: Double = occurred ?? (Date().timeIntervalSince1970 * 1000.0)
          instant.timestamp = UInt64(ts)
        }

        if let innerPayload = eventPayload {
          genericEvent.payload = innerPayload
        }
      }
      }) { (_, callResult) in
        // dispatch callback, if any
        callback?(callResult)
    }
  }

}
