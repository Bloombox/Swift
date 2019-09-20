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

import Foundation
import SwiftProtobuf


/// Protobuf Types
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


/// Extends the base `TelemetryClient` with so-called *Generic Telemetry* features. With generic telemetry,
/// arbitrary event payloads can be sent and correlated back and forth with other structured event streams. It's
/// generally easiest to start with some stream of generic events, then specialize as needed into task-optimized
/// event structures in their own streams, where appropriate.
///
/// ### Event Collections
/// *Generic Telemetry* events contain an arbitrary payload, and tie themselves together with other similar events
/// via the `collection` context property. This property assigns either an enumerated (well-known) or named
/// collection to each event, which is used later to query them as a set.
///
/// ### Event Context
/// Every event, regardless of type, supports a standard set of properties called "event context." These properties
/// describe things like the app/site/system that sent the event, when the event occurred, the user account active
/// when the event was sent, and so on. These payloads are assembled automatically with overlayed data provided
/// by invoking code. Some methods on these APIs support explicit event context.
///
/// ### Explicit UUIDs
/// Explicit event UUIDs allow the telemetry data originator to assign unique IDs to events before they are ingested.
/// This feature enables de-duplication of events server-side, making event submission an idempotent activity. If IDs
/// are not assigned by the client, the server assigns IDs during event ingest.
///
/// ### API Reference
/// Methods provided:
/// - `event`: Record a generic event, with some arbitrary JSON-style object payload, along with the standard
///   set of event context data. This event is recorded with an occurrence timestamp when it is prepared, unless
///   otherwise specified. At some point later on, the event is sent to the server for processing.
extension TelemetryClient {
  // MARK: Event Telemetry

  /// Method `event`. Submit a generic event to the Telemetry service. Can be used for any visibility instrumentation
  /// desired and supports arbitrary JSON payloads. This variant offers a simpler interface for simpler events.
  ///
  /// This method variant presents an intentionally-simple interface, offering just a `collection` and `payload`.
  /// For more customization options, see other methods by the same name on this API.
  ///
  /// - Parameter collection: Event collection to add this event to.
  /// - Parameter payload: Event payload to send.
  /// - Throws: Client-side errors for missing data (see `GenericEventError`).
  /// - Returns: gRPC call object, which can be used to observe or cancel the in-flight call.
  @discardableResult
  public func event(collection: EventCollection, payload: [String: Any]) throws -> TelemetryEventCall {
    return try self.event(
      collection: collection,
      uuid: nil,
      payload: payload,
      occurred: nil,
      context: nil)
  }

  /// Method `event`. Submit a generic event to the Telemetry service asynchronously. Can be used for any visibility
  /// instrumentation desired and supports arbitrary JSON payloads. This method variant supports a callback, along with
  /// the ability to send an explicit event UUID, occurrence timestamp, or context payload.
  ///
  /// - Parameter collection: Event collection to add this event to.
  /// - Parameter uuid: Explicit UUID to use for this event. If left as `nil`, one will be assigned server-side.
  /// - Parameter payload: JSON-like payload for the event. Items must eventually be serializable/primitive types.
  /// - Parameter occurred: Explicit occurrence timestamp for this event. If left unset, one will be set immediately.
  /// - Parameter context: Explicit event context for this event. If left unset, a payload is calculated before send.
  /// - Parameter callback: Callback to dispatch once the event has been transmitted, or an error occurs.
  /// - Throws: Client-side errors for missing data (see `GenericEventError`).
  /// - Returns: gRPC call object, which can be used to observe or cancel the in-flight call.
  @discardableResult
  public func event(collection: EventCollection,
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
