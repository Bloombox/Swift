//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: telemetry/v1beta4/SearchTelemetryService_Beta4.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Dispatch
import OpenCannabis
import Foundation
import SwiftGRPC
import SwiftProtobuf

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
