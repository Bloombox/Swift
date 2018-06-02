/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: dash/v1beta1/DashService_Beta1.proto
 *
 */

/*
 * Copyright 2018, gRPC Authors All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Foundation
import Dispatch
import gRPC
import SwiftProtobuf

/// Type for errors thrown from generated client code.
public enum Bloombox_Schema_Services_Dash_V1Beta1_DashboardClientError : Error {
  case endOfStream
  case invalidMessageReceived
  case error(c: CallResult)
}

/// PartnerSettings (Unary)
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsCall {
  private var call : Call

  /// Create a call.
  fileprivate init(_ channel: Channel) {
    self.call = channel.makeCall("/bloombox.schema.services.dash.v1beta1.Dashboard/PartnerSettings")
  }

  /// Run the call. Blocks until the reply is received.
  fileprivate func run(request: Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Request,
                       metadata: Metadata) throws -> Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Response {
    let sem = DispatchSemaphore(value: 0)
    var returnCallResult : CallResult!
    var returnResponse : Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Response?
    _ = try start(request:request, metadata:metadata) {response, callResult in
      returnResponse = response
      returnCallResult = callResult
      sem.signal()
    }
    _ = sem.wait(timeout: DispatchTime.distantFuture)
    if let returnResponse = returnResponse {
      return returnResponse
    } else {
      throw Bloombox_Schema_Services_Dash_V1Beta1_DashboardClientError.error(c: returnCallResult)
    }
  }

  /// Start the call. Nonblocking.
  fileprivate func start(request: Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Request,
                         metadata: Metadata,
                         completion: @escaping (Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Response?, CallResult)->())
    throws -> Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsCall {

      let requestData = try request.serializedData()
      try call.start(.unary,
                     metadata:metadata,
                     message:requestData)
      {(callResult) in
        if let responseData = callResult.resultData,
          let response = try? Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Response(serializedData:responseData) {
          completion(response, callResult)
        } else {
          completion(nil, callResult)
        }
      }
      return self
  }

  /// Cancel the call.
  public func cancel() {
    call.cancel()
  }
}

/// PartnerSettingsUpdate (Unary)
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsUpdateCall {
  private var call : Call

  /// Create a call.
  fileprivate init(_ channel: Channel) {
    self.call = channel.makeCall("/bloombox.schema.services.dash.v1beta1.Dashboard/PartnerSettingsUpdate")
  }

  /// Run the call. Blocks until the reply is received.
  fileprivate func run(request: Bloombox_Schema_Services_Dash_V1beta1_UpdatePartnerSettings.Request,
                       metadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    let sem = DispatchSemaphore(value: 0)
    var returnCallResult : CallResult!
    var returnResponse : SwiftProtobuf.Google_Protobuf_Empty?
    _ = try start(request:request, metadata:metadata) {response, callResult in
      returnResponse = response
      returnCallResult = callResult
      sem.signal()
    }
    _ = sem.wait(timeout: DispatchTime.distantFuture)
    if let returnResponse = returnResponse {
      return returnResponse
    } else {
      throw Bloombox_Schema_Services_Dash_V1Beta1_DashboardClientError.error(c: returnCallResult)
    }
  }

  /// Start the call. Nonblocking.
  fileprivate func start(request: Bloombox_Schema_Services_Dash_V1beta1_UpdatePartnerSettings.Request,
                         metadata: Metadata,
                         completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult)->())
    throws -> Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsUpdateCall {

      let requestData = try request.serializedData()
      try call.start(.unary,
                     metadata:metadata,
                     message:requestData)
      {(callResult) in
        if let responseData = callResult.resultData,
          let response = try? SwiftProtobuf.Google_Protobuf_Empty(serializedData:responseData) {
          completion(response, callResult)
        } else {
          completion(nil, callResult)
        }
      }
      return self
  }

  /// Cancel the call.
  public func cancel() {
    call.cancel()
  }
}

/// LocationSettings (Unary)
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsCall {
  private var call : Call

  /// Create a call.
  fileprivate init(_ channel: Channel) {
    self.call = channel.makeCall("/bloombox.schema.services.dash.v1beta1.Dashboard/LocationSettings")
  }

  /// Run the call. Blocks until the reply is received.
  fileprivate func run(request: Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Request,
                       metadata: Metadata) throws -> Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Response {
    let sem = DispatchSemaphore(value: 0)
    var returnCallResult : CallResult!
    var returnResponse : Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Response?
    _ = try start(request:request, metadata:metadata) {response, callResult in
      returnResponse = response
      returnCallResult = callResult
      sem.signal()
    }
    _ = sem.wait(timeout: DispatchTime.distantFuture)
    if let returnResponse = returnResponse {
      return returnResponse
    } else {
      throw Bloombox_Schema_Services_Dash_V1Beta1_DashboardClientError.error(c: returnCallResult)
    }
  }

  /// Start the call. Nonblocking.
  fileprivate func start(request: Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Request,
                         metadata: Metadata,
                         completion: @escaping (Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Response?, CallResult)->())
    throws -> Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsCall {

      let requestData = try request.serializedData()
      try call.start(.unary,
                     metadata:metadata,
                     message:requestData)
      {(callResult) in
        if let responseData = callResult.resultData,
          let response = try? Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Response(serializedData:responseData) {
          completion(response, callResult)
        } else {
          completion(nil, callResult)
        }
      }
      return self
  }

  /// Cancel the call.
  public func cancel() {
    call.cancel()
  }
}

/// LocationSettingsUpdate (Unary)
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsUpdateCall {
  private var call : Call

  /// Create a call.
  fileprivate init(_ channel: Channel) {
    self.call = channel.makeCall("/bloombox.schema.services.dash.v1beta1.Dashboard/LocationSettingsUpdate")
  }

  /// Run the call. Blocks until the reply is received.
  fileprivate func run(request: Bloombox_Schema_Services_Dash_V1beta1_UpdateLocationSettings.Request,
                       metadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    let sem = DispatchSemaphore(value: 0)
    var returnCallResult : CallResult!
    var returnResponse : SwiftProtobuf.Google_Protobuf_Empty?
    _ = try start(request:request, metadata:metadata) {response, callResult in
      returnResponse = response
      returnCallResult = callResult
      sem.signal()
    }
    _ = sem.wait(timeout: DispatchTime.distantFuture)
    if let returnResponse = returnResponse {
      return returnResponse
    } else {
      throw Bloombox_Schema_Services_Dash_V1Beta1_DashboardClientError.error(c: returnCallResult)
    }
  }

  /// Start the call. Nonblocking.
  fileprivate func start(request: Bloombox_Schema_Services_Dash_V1beta1_UpdateLocationSettings.Request,
                         metadata: Metadata,
                         completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult)->())
    throws -> Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsUpdateCall {

      let requestData = try request.serializedData()
      try call.start(.unary,
                     metadata:metadata,
                     message:requestData)
      {(callResult) in
        if let responseData = callResult.resultData,
          let response = try? SwiftProtobuf.Google_Protobuf_Empty(serializedData:responseData) {
          completion(response, callResult)
        } else {
          completion(nil, callResult)
        }
      }
      return self
  }

  /// Cancel the call.
  public func cancel() {
    call.cancel()
  }
}

/// Call methods of this class to make API calls.
public final class Bloombox_Schema_Services_Dash_V1Beta1_DashboardService {
  public var channel: Channel

  /// This metadata will be sent with all requests.
  public var metadata : Metadata

  /// This property allows the service host name to be overridden.
  /// For example, it can be used to make calls to "localhost:8080"
  /// appear to be to "example.com".
  public var host : String {
    get {
      return self.channel.host
    }
    set {
      self.channel.host = newValue
    }
  }

  /// Create a client.
  public init(address: String, secure: Bool = true) {
    gRPC.initialize()
    channel = Channel(address:address, secure:secure)
    metadata = Metadata()
  }

  /// Create a client that makes secure connections with a custom certificate and (optional) hostname.
  public init(address: String, certificates: String, host: String?) {
    gRPC.initialize()
    channel = Channel(address:address, certificates:certificates, host:host)
    metadata = Metadata()
  }

  /// Synchronous. Unary.
  public func partnersettings(_ request: Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Request)
    throws
    -> Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Response {
      return try Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsCall(channel).run(request:request, metadata:metadata)
  }
  /// Asynchronous. Unary.
  public func partnersettings(_ request: Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Request,
                  completion: @escaping (Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Response?, CallResult)->())
    throws
    -> Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsCall {
      return try Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsCall(channel).start(request:request,
                                                 metadata:metadata,
                                                 completion:completion)
  }
  /// Synchronous. Unary.
  public func partnersettingsupdate(_ request: Bloombox_Schema_Services_Dash_V1beta1_UpdatePartnerSettings.Request)
    throws
    -> SwiftProtobuf.Google_Protobuf_Empty {
      return try Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsUpdateCall(channel).run(request:request, metadata:metadata)
  }
  /// Asynchronous. Unary.
  public func partnersettingsupdate(_ request: Bloombox_Schema_Services_Dash_V1beta1_UpdatePartnerSettings.Request,
                  completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult)->())
    throws
    -> Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsUpdateCall {
      return try Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsUpdateCall(channel).start(request:request,
                                                 metadata:metadata,
                                                 completion:completion)
  }
  /// Synchronous. Unary.
  public func locationsettings(_ request: Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Request)
    throws
    -> Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Response {
      return try Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsCall(channel).run(request:request, metadata:metadata)
  }
  /// Asynchronous. Unary.
  public func locationsettings(_ request: Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Request,
                  completion: @escaping (Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Response?, CallResult)->())
    throws
    -> Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsCall {
      return try Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsCall(channel).start(request:request,
                                                 metadata:metadata,
                                                 completion:completion)
  }
  /// Synchronous. Unary.
  public func locationsettingsupdate(_ request: Bloombox_Schema_Services_Dash_V1beta1_UpdateLocationSettings.Request)
    throws
    -> SwiftProtobuf.Google_Protobuf_Empty {
      return try Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsUpdateCall(channel).run(request:request, metadata:metadata)
  }
  /// Asynchronous. Unary.
  public func locationsettingsupdate(_ request: Bloombox_Schema_Services_Dash_V1beta1_UpdateLocationSettings.Request,
                  completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult)->())
    throws
    -> Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsUpdateCall {
      return try Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsUpdateCall(channel).start(request:request,
                                                 metadata:metadata,
                                                 completion:completion)
  }
}


/// Type for errors thrown from generated server code.
public enum Bloombox_Schema_Services_Dash_V1Beta1_DashboardServerError : Error {
  case endOfStream
}

/// To build a server, implement a class that conforms to this protocol.
public protocol Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider {
  func partnersettings(request : Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Request, session : Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsSession) throws -> Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Response
  func partnersettingsupdate(request : Bloombox_Schema_Services_Dash_V1beta1_UpdatePartnerSettings.Request, session : Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsUpdateSession) throws -> SwiftProtobuf.Google_Protobuf_Empty
  func locationsettings(request : Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Request, session : Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsSession) throws -> Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Response
  func locationsettingsupdate(request : Bloombox_Schema_Services_Dash_V1beta1_UpdateLocationSettings.Request, session : Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsUpdateSession) throws -> SwiftProtobuf.Google_Protobuf_Empty
}

/// Common properties available in each service session.
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardSession {
  fileprivate var handler : gRPC.Handler
  public var requestMetadata : Metadata { return handler.requestMetadata }

  public var statusCode : Int = 0
  public var statusMessage : String = "OK"
  public var initialMetadata : Metadata = Metadata()
  public var trailingMetadata : Metadata = Metadata()

  fileprivate init(handler:gRPC.Handler) {
    self.handler = handler
  }
}

// PartnerSettings (Unary)
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsSession : Bloombox_Schema_Services_Dash_V1Beta1_DashboardSession {
  private var provider : Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Bloombox_Schema_Services_Dash_V1beta1_GetPartnerSettings.Request(serializedData:requestData)
        let replyMessage = try self.provider.partnersettings(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// PartnerSettingsUpdate (Unary)
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsUpdateSession : Bloombox_Schema_Services_Dash_V1Beta1_DashboardSession {
  private var provider : Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Bloombox_Schema_Services_Dash_V1beta1_UpdatePartnerSettings.Request(serializedData:requestData)
        let replyMessage = try self.provider.partnersettingsupdate(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// LocationSettings (Unary)
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsSession : Bloombox_Schema_Services_Dash_V1Beta1_DashboardSession {
  private var provider : Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Bloombox_Schema_Services_Dash_V1beta1_GetLocationSettings.Request(serializedData:requestData)
        let replyMessage = try self.provider.locationsettings(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}

// LocationSettingsUpdate (Unary)
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsUpdateSession : Bloombox_Schema_Services_Dash_V1Beta1_DashboardSession {
  private var provider : Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider

  /// Create a session.
  fileprivate init(handler:gRPC.Handler, provider: Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider) {
    self.provider = provider
    super.init(handler:handler)
  }

  /// Run the session. Internal.
  fileprivate func run(queue:DispatchQueue) throws {
    try handler.receiveMessage(initialMetadata:initialMetadata) {(requestData) in
      if let requestData = requestData {
        let requestMessage = try Bloombox_Schema_Services_Dash_V1beta1_UpdateLocationSettings.Request(serializedData:requestData)
        let replyMessage = try self.provider.locationsettingsupdate(request:requestMessage, session: self)
        try self.handler.sendResponse(message:replyMessage.serializedData(),
                                      statusCode:self.statusCode,
                                      statusMessage:self.statusMessage,
                                      trailingMetadata:self.trailingMetadata)
      }
    }
  }
}


/// Main server for generated service
public class Bloombox_Schema_Services_Dash_V1Beta1_DashboardServer {
  private var address: String
  private var server: gRPC.Server
  private var provider: Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider?

  /// Create a server that accepts insecure connections.
  public init(address:String,
              provider:Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    self.server = gRPC.Server(address:address)
  }

  /// Create a server that accepts secure connections.
  public init?(address:String,
               certificateURL:URL,
               keyURL:URL,
               provider:Bloombox_Schema_Services_Dash_V1Beta1_DashboardProvider) {
    gRPC.initialize()
    self.address = address
    self.provider = provider
    guard
      let certificate = try? String(contentsOf: certificateURL, encoding: .utf8),
      let key = try? String(contentsOf: keyURL, encoding: .utf8)
      else {
        return nil
    }
    self.server = gRPC.Server(address:address, key:key, certs:certificate)
  }

  /// Start the server.
  public func start(queue:DispatchQueue = DispatchQueue.global()) {
    guard let provider = self.provider else {
      fatalError() // the server requires a provider
    }
    server.run {(handler) in
      print("Server received request to " + handler.host
        + " calling " + handler.method
        + " from " + handler.caller
        + " with " + String(describing:handler.requestMetadata) )

      do {
        switch handler.method {
        case "/bloombox.schema.services.dash.v1beta1.Dashboard/PartnerSettings":
          try Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsSession(handler:handler, provider:provider).run(queue:queue)
        case "/bloombox.schema.services.dash.v1beta1.Dashboard/PartnerSettingsUpdate":
          try Bloombox_Schema_Services_Dash_V1Beta1_DashboardPartnerSettingsUpdateSession(handler:handler, provider:provider).run(queue:queue)
        case "/bloombox.schema.services.dash.v1beta1.Dashboard/LocationSettings":
          try Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsSession(handler:handler, provider:provider).run(queue:queue)
        case "/bloombox.schema.services.dash.v1beta1.Dashboard/LocationSettingsUpdate":
          try Bloombox_Schema_Services_Dash_V1Beta1_DashboardLocationSettingsUpdateSession(handler:handler, provider:provider).run(queue:queue)
        default:
          break // handle unknown requests
        }
      } catch (let error) {
        print("Server error: \(error)")
      }
    }
  }
}

