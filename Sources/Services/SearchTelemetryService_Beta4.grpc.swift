//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: telemetry/v1beta4/SearchTelemetryService_Beta4.proto
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

public protocol Bloombox_Services_Telemetry_V1beta4_SearchTelemetryQueryCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Telemetry_V1beta4_SearchTelemetryQueryCallBase: ClientCallUnaryBase<Bloombox_Services_Telemetry_V1beta4_SearchEvent.Query, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Telemetry_V1beta4_SearchTelemetryQueryCall {
  override class var method: String { return "/bloombox.services.telemetry.v1beta4.SearchTelemetry/Query" }
}

public protocol Bloombox_Services_Telemetry_V1beta4_SearchTelemetryResultCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Telemetry_V1beta4_SearchTelemetryResultCallBase: ClientCallUnaryBase<Bloombox_Services_Telemetry_V1beta4_SearchEvent.Result, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Telemetry_V1beta4_SearchTelemetryResultCall {
  override class var method: String { return "/bloombox.services.telemetry.v1beta4.SearchTelemetry/Result" }
}


/// Instantiate Bloombox_Services_Telemetry_V1beta4_SearchTelemetryServiceClient, then call methods of this protocol to make API calls.
public protocol Bloombox_Services_Telemetry_V1beta4_SearchTelemetryService: ServiceClient {
  /// Synchronous. Unary.
  func query(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Query, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func query(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Query, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_SearchTelemetryQueryCall

  /// Synchronous. Unary.
  func result(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Result, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func result(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Result, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_SearchTelemetryResultCall

}

public extension Bloombox_Services_Telemetry_V1beta4_SearchTelemetryService {
  /// Synchronous. Unary.
  func query(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Query) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.query(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func query(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Query, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_SearchTelemetryQueryCall {
    return try self.query(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func result(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Result) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.result(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func result(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Result, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_SearchTelemetryResultCall {
    return try self.result(request, metadata: self.metadata, completion: completion)
  }

}

public final class Bloombox_Services_Telemetry_V1beta4_SearchTelemetryServiceClient: ServiceClientBase, Bloombox_Services_Telemetry_V1beta4_SearchTelemetryService {
  /// Synchronous. Unary.
  public func query(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Query, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Telemetry_V1beta4_SearchTelemetryQueryCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func query(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Query, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_SearchTelemetryQueryCall {
    return try Bloombox_Services_Telemetry_V1beta4_SearchTelemetryQueryCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func result(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Result, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Telemetry_V1beta4_SearchTelemetryResultCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func result(_ request: Bloombox_Services_Telemetry_V1beta4_SearchEvent.Result, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Telemetry_V1beta4_SearchTelemetryResultCall {
    return try Bloombox_Services_Telemetry_V1beta4_SearchTelemetryResultCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

