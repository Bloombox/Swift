//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: devices/v1beta1/DevicesService_Beta1.proto
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
import Foundation
import SwiftGRPC
import SwiftProtobuf
import OpenCannabis

public protocol Bloombox_Services_Devices_V1beta1_DevicesPingCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Devices_V1beta1_DevicesPingCallBase: ClientCallUnaryBase<Bloombox_Services_Devices_V1beta1_Ping.Request, Bloombox_Services_Devices_V1beta1_Ping.Response>, Bloombox_Services_Devices_V1beta1_DevicesPingCall {
  override class var method: String { return "/bloombox.services.devices.v1beta1.Devices/Ping" }
}

public protocol Bloombox_Services_Devices_V1beta1_DevicesActivateCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Devices_V1beta1_DevicesActivateCallBase: ClientCallUnaryBase<Bloombox_Services_Devices_V1beta1_Activation.Request, Bloombox_Services_Devices_V1beta1_Activation.Response>, Bloombox_Services_Devices_V1beta1_DevicesActivateCall {
  override class var method: String { return "/bloombox.services.devices.v1beta1.Devices/Activate" }
}


/// Instantiate Bloombox_Services_Devices_V1beta1_DevicesServiceClient, then call methods of this protocol to make API calls.
public protocol Bloombox_Services_Devices_V1beta1_DevicesService: ServiceClient {
  /// Synchronous. Unary.
  func ping(_ request: Bloombox_Services_Devices_V1beta1_Ping.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Devices_V1beta1_Ping.Response
  /// Asynchronous. Unary.
  @discardableResult
  func ping(_ request: Bloombox_Services_Devices_V1beta1_Ping.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Devices_V1beta1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Devices_V1beta1_DevicesPingCall

  /// Synchronous. Unary.
  func activate(_ request: Bloombox_Services_Devices_V1beta1_Activation.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Devices_V1beta1_Activation.Response
  /// Asynchronous. Unary.
  @discardableResult
  func activate(_ request: Bloombox_Services_Devices_V1beta1_Activation.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Devices_V1beta1_Activation.Response?, CallResult) -> Void) throws -> Bloombox_Services_Devices_V1beta1_DevicesActivateCall

}

public extension Bloombox_Services_Devices_V1beta1_DevicesService {
  /// Synchronous. Unary.
  func ping(_ request: Bloombox_Services_Devices_V1beta1_Ping.Request) throws -> Bloombox_Services_Devices_V1beta1_Ping.Response {
    return try self.ping(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func ping(_ request: Bloombox_Services_Devices_V1beta1_Ping.Request, completion: @escaping (Bloombox_Services_Devices_V1beta1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Devices_V1beta1_DevicesPingCall {
    return try self.ping(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func activate(_ request: Bloombox_Services_Devices_V1beta1_Activation.Request) throws -> Bloombox_Services_Devices_V1beta1_Activation.Response {
    return try self.activate(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func activate(_ request: Bloombox_Services_Devices_V1beta1_Activation.Request, completion: @escaping (Bloombox_Services_Devices_V1beta1_Activation.Response?, CallResult) -> Void) throws -> Bloombox_Services_Devices_V1beta1_DevicesActivateCall {
    return try self.activate(request, metadata: self.metadata, completion: completion)
  }

}

public final class Bloombox_Services_Devices_V1beta1_DevicesServiceClient: ServiceClientBase, Bloombox_Services_Devices_V1beta1_DevicesService {
  /// Synchronous. Unary.
  public func ping(_ request: Bloombox_Services_Devices_V1beta1_Ping.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Devices_V1beta1_Ping.Response {
    return try Bloombox_Services_Devices_V1beta1_DevicesPingCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func ping(_ request: Bloombox_Services_Devices_V1beta1_Ping.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Devices_V1beta1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Devices_V1beta1_DevicesPingCall {
    return try Bloombox_Services_Devices_V1beta1_DevicesPingCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func activate(_ request: Bloombox_Services_Devices_V1beta1_Activation.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Devices_V1beta1_Activation.Response {
    return try Bloombox_Services_Devices_V1beta1_DevicesActivateCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func activate(_ request: Bloombox_Services_Devices_V1beta1_Activation.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Devices_V1beta1_Activation.Response?, CallResult) -> Void) throws -> Bloombox_Services_Devices_V1beta1_DevicesActivateCall {
    return try Bloombox_Services_Devices_V1beta1_DevicesActivateCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

