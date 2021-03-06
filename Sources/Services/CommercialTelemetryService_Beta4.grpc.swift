//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: telemetry/v1beta4/CommercialTelemetryService_Beta4.proto
//

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
*/
import Dispatch
import Foundation
import SwiftGRPC
import SwiftProtobuf
import OpenCannabis

public protocol Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryImpressionCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryImpressionCallBase: ClientCallUnaryBase<Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryImpressionCall {
  override class var method: String { return "/bloombox.services.telemetry.v1beta4.CommercialTelemetry/Impression" }
}

public protocol Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryViewCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryViewCallBase: ClientCallUnaryBase<Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryViewCall {
  override class var method: String { return "/bloombox.services.telemetry.v1beta4.CommercialTelemetry/View" }
}

public protocol Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryActionCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryActionCallBase: ClientCallUnaryBase<Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryActionCall {
  override class var method: String { return "/bloombox.services.telemetry.v1beta4.CommercialTelemetry/Action" }
}


/// Instantiate Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryServiceClient, then call methods of this protocol to make API calls.
public protocol Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryService: ServiceClient {
  /// Synchronous. Unary.
  func impression(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func impression(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryImpressionCall

  /// Synchronous. Unary.
  func view(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func view(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryViewCall

  /// Synchronous. Unary.
  func action(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func action(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryActionCall

}

public extension Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryService {
  /// Synchronous. Unary.
  func impression(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.impression(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func impression(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryImpressionCall {
    return try self.impression(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func view(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.view(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func view(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryViewCall {
    return try self.view(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func action(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.action(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func action(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryActionCall {
    return try self.action(request, metadata: self.metadata, completion: completion)
  }

}

public final class Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryServiceClient: ServiceClientBase, Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryService {
  /// Synchronous. Unary.
  public func impression(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryImpressionCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func impression(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Impression, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryImpressionCall {
    return try Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryImpressionCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func view(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryViewCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func view(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.View, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryViewCall {
    return try Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryViewCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func action(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryActionCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func action(_ request: Bloombox_Services_Telemetry_V1beta4_CommercialEvent.Action, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryActionCall {
    return try Bloombox_Services_Telemetry_V1beta4_CommercialTelemetryActionCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

