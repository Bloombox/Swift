//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: checkin/v1beta1/CheckinService_Beta1.proto
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

public protocol Bloombox_Services_Checkin_V1beta1_CheckinPingCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Checkin_V1beta1_CheckinPingCallBase: ClientCallUnaryBase<Bloombox_Services_Checkin_V1beta1_Ping.Request, Bloombox_Services_Checkin_V1beta1_Ping.Response>, Bloombox_Services_Checkin_V1beta1_CheckinPingCall {
  override class var method: String { return "/bloombox.services.checkin.v1beta1.Checkin/Ping" }
}

public protocol Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCallBase: ClientCallUnaryBase<Bloombox_Services_Checkin_V1beta1_IDCheckin.Request, Bloombox_Services_Checkin_V1beta1_CheckinResponse>, Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCall {
  override class var method: String { return "/bloombox.services.checkin.v1beta1.Checkin/Identification" }
}

public protocol Bloombox_Services_Checkin_V1beta1_CheckinCardCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Checkin_V1beta1_CheckinCardCallBase: ClientCallUnaryBase<Bloombox_Services_Checkin_V1beta1_CardCheckin.Request, Bloombox_Services_Checkin_V1beta1_CheckinResponse>, Bloombox_Services_Checkin_V1beta1_CheckinCardCall {
  override class var method: String { return "/bloombox.services.checkin.v1beta1.Checkin/Card" }
}


/// Instantiate Bloombox_Services_Checkin_V1beta1_CheckinServiceClient, then call methods of this protocol to make API calls.
public protocol Bloombox_Services_Checkin_V1beta1_CheckinService: ServiceClient {
  /// Synchronous. Unary.
  func ping(_ request: Bloombox_Services_Checkin_V1beta1_Ping.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Checkin_V1beta1_Ping.Response
  /// Asynchronous. Unary.
  @discardableResult
  func ping(_ request: Bloombox_Services_Checkin_V1beta1_Ping.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Checkin_V1beta1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinPingCall

  /// Synchronous. Unary.
  func identification(_ request: Bloombox_Services_Checkin_V1beta1_IDCheckin.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Checkin_V1beta1_CheckinResponse
  /// Asynchronous. Unary.
  @discardableResult
  func identification(_ request: Bloombox_Services_Checkin_V1beta1_IDCheckin.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Checkin_V1beta1_CheckinResponse?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCall

  /// Synchronous. Unary.
  func card(_ request: Bloombox_Services_Checkin_V1beta1_CardCheckin.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Checkin_V1beta1_CheckinResponse
  /// Asynchronous. Unary.
  @discardableResult
  func card(_ request: Bloombox_Services_Checkin_V1beta1_CardCheckin.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Checkin_V1beta1_CheckinResponse?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinCardCall

}

public extension Bloombox_Services_Checkin_V1beta1_CheckinService {
  /// Synchronous. Unary.
  func ping(_ request: Bloombox_Services_Checkin_V1beta1_Ping.Request) throws -> Bloombox_Services_Checkin_V1beta1_Ping.Response {
    return try self.ping(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func ping(_ request: Bloombox_Services_Checkin_V1beta1_Ping.Request, completion: @escaping (Bloombox_Services_Checkin_V1beta1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinPingCall {
    return try self.ping(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func identification(_ request: Bloombox_Services_Checkin_V1beta1_IDCheckin.Request) throws -> Bloombox_Services_Checkin_V1beta1_CheckinResponse {
    return try self.identification(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func identification(_ request: Bloombox_Services_Checkin_V1beta1_IDCheckin.Request, completion: @escaping (Bloombox_Services_Checkin_V1beta1_CheckinResponse?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCall {
    return try self.identification(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func card(_ request: Bloombox_Services_Checkin_V1beta1_CardCheckin.Request) throws -> Bloombox_Services_Checkin_V1beta1_CheckinResponse {
    return try self.card(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func card(_ request: Bloombox_Services_Checkin_V1beta1_CardCheckin.Request, completion: @escaping (Bloombox_Services_Checkin_V1beta1_CheckinResponse?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinCardCall {
    return try self.card(request, metadata: self.metadata, completion: completion)
  }

}

public final class Bloombox_Services_Checkin_V1beta1_CheckinServiceClient: ServiceClientBase, Bloombox_Services_Checkin_V1beta1_CheckinService {
  /// Synchronous. Unary.
  public func ping(_ request: Bloombox_Services_Checkin_V1beta1_Ping.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Checkin_V1beta1_Ping.Response {
    return try Bloombox_Services_Checkin_V1beta1_CheckinPingCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func ping(_ request: Bloombox_Services_Checkin_V1beta1_Ping.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Checkin_V1beta1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinPingCall {
    return try Bloombox_Services_Checkin_V1beta1_CheckinPingCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func identification(_ request: Bloombox_Services_Checkin_V1beta1_IDCheckin.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Checkin_V1beta1_CheckinResponse {
    return try Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func identification(_ request: Bloombox_Services_Checkin_V1beta1_IDCheckin.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Checkin_V1beta1_CheckinResponse?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCall {
    return try Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func card(_ request: Bloombox_Services_Checkin_V1beta1_CardCheckin.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Checkin_V1beta1_CheckinResponse {
    return try Bloombox_Services_Checkin_V1beta1_CheckinCardCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func card(_ request: Bloombox_Services_Checkin_V1beta1_CardCheckin.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Checkin_V1beta1_CheckinResponse?, CallResult) -> Void) throws -> Bloombox_Services_Checkin_V1beta1_CheckinCardCall {
    return try Bloombox_Services_Checkin_V1beta1_CheckinCardCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

