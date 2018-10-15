//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: platform/v1/PlatformService_v1.proto
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
import Foundation
import Dispatch
import SwiftGRPC
import SwiftProtobuf
import OpenCannabis

public protocol Bloombox_Schema_Services_Platform_V1_PlatformPingCall: ClientCallUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformPingCallBase: ClientCallUnaryBase<Bloombox_Schema_Services_Platform_V1_Ping.Request, Bloombox_Schema_Services_Platform_V1_Ping.Response>, Bloombox_Schema_Services_Platform_V1_PlatformPingCall {
  override class var method: String { return "/bloombox.schema.services.platform.v1.Platform/Ping" }
}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformHealthCall: ClientCallUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformHealthCallBase: ClientCallUnaryBase<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Schema_Services_Platform_V1_PlatformHealthCall {
  override class var method: String { return "/bloombox.schema.services.platform.v1.Platform/Health" }
}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformResolveCall: ClientCallUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformResolveCallBase: ClientCallUnaryBase<Bloombox_Schema_Services_Platform_V1_DomainResolve.Request, Bloombox_Schema_Services_Platform_V1_DomainResolve.Response>, Bloombox_Schema_Services_Platform_V1_PlatformResolveCall {
  override class var method: String { return "/bloombox.schema.services.platform.v1.Platform/Resolve" }
}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformDomainsCall: ClientCallUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformDomainsCallBase: ClientCallUnaryBase<Bloombox_Schema_Services_Platform_V1_DomainInfo.Request, Bloombox_Schema_Services_Platform_V1_DomainInfo.Response>, Bloombox_Schema_Services_Platform_V1_PlatformDomainsCall {
  override class var method: String { return "/bloombox.schema.services.platform.v1.Platform/Domains" }
}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformBrandCall: ClientCallUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformBrandCallBase: ClientCallUnaryBase<Bloombox_Schema_Services_Platform_V1_BrandInfo.Request, Bloombox_Schema_Services_Platform_V1_BrandInfo.Response>, Bloombox_Schema_Services_Platform_V1_PlatformBrandCall {
  override class var method: String { return "/bloombox.schema.services.platform.v1.Platform/Brand" }
}


/// Instantiate Bloombox_Schema_Services_Platform_V1_PlatformServiceClient, then call methods of this protocol to make API calls.
public protocol Bloombox_Schema_Services_Platform_V1_PlatformService: ServiceClient {
  /// Synchronous. Unary.
  func ping(_ request: Bloombox_Schema_Services_Platform_V1_Ping.Request) throws -> Bloombox_Schema_Services_Platform_V1_Ping.Response
  /// Asynchronous. Unary.
  func ping(_ request: Bloombox_Schema_Services_Platform_V1_Ping.Request, completion: @escaping (Bloombox_Schema_Services_Platform_V1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformPingCall

  /// Synchronous. Unary.
  func health(_ request: SwiftProtobuf.Google_Protobuf_Empty) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  func health(_ request: SwiftProtobuf.Google_Protobuf_Empty, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformHealthCall

  /// Synchronous. Unary.
  func resolve(_ request: Bloombox_Schema_Services_Platform_V1_DomainResolve.Request) throws -> Bloombox_Schema_Services_Platform_V1_DomainResolve.Response
  /// Asynchronous. Unary.
  func resolve(_ request: Bloombox_Schema_Services_Platform_V1_DomainResolve.Request, completion: @escaping (Bloombox_Schema_Services_Platform_V1_DomainResolve.Response?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformResolveCall

  /// Synchronous. Unary.
  func domains(_ request: Bloombox_Schema_Services_Platform_V1_DomainInfo.Request) throws -> Bloombox_Schema_Services_Platform_V1_DomainInfo.Response
  /// Asynchronous. Unary.
  func domains(_ request: Bloombox_Schema_Services_Platform_V1_DomainInfo.Request, completion: @escaping (Bloombox_Schema_Services_Platform_V1_DomainInfo.Response?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformDomainsCall

  /// Synchronous. Unary.
  func brand(_ request: Bloombox_Schema_Services_Platform_V1_BrandInfo.Request) throws -> Bloombox_Schema_Services_Platform_V1_BrandInfo.Response
  /// Asynchronous. Unary.
  func brand(_ request: Bloombox_Schema_Services_Platform_V1_BrandInfo.Request, completion: @escaping (Bloombox_Schema_Services_Platform_V1_BrandInfo.Response?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformBrandCall

}

public final class Bloombox_Schema_Services_Platform_V1_PlatformServiceClient: ServiceClientBase, Bloombox_Schema_Services_Platform_V1_PlatformService {
  /// Synchronous. Unary.
  public func ping(_ request: Bloombox_Schema_Services_Platform_V1_Ping.Request) throws -> Bloombox_Schema_Services_Platform_V1_Ping.Response {
    return try Bloombox_Schema_Services_Platform_V1_PlatformPingCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  public func ping(_ request: Bloombox_Schema_Services_Platform_V1_Ping.Request, completion: @escaping (Bloombox_Schema_Services_Platform_V1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformPingCall {
    return try Bloombox_Schema_Services_Platform_V1_PlatformPingCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func health(_ request: SwiftProtobuf.Google_Protobuf_Empty) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Schema_Services_Platform_V1_PlatformHealthCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  public func health(_ request: SwiftProtobuf.Google_Protobuf_Empty, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformHealthCall {
    return try Bloombox_Schema_Services_Platform_V1_PlatformHealthCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func resolve(_ request: Bloombox_Schema_Services_Platform_V1_DomainResolve.Request) throws -> Bloombox_Schema_Services_Platform_V1_DomainResolve.Response {
    return try Bloombox_Schema_Services_Platform_V1_PlatformResolveCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  public func resolve(_ request: Bloombox_Schema_Services_Platform_V1_DomainResolve.Request, completion: @escaping (Bloombox_Schema_Services_Platform_V1_DomainResolve.Response?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformResolveCall {
    return try Bloombox_Schema_Services_Platform_V1_PlatformResolveCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func domains(_ request: Bloombox_Schema_Services_Platform_V1_DomainInfo.Request) throws -> Bloombox_Schema_Services_Platform_V1_DomainInfo.Response {
    return try Bloombox_Schema_Services_Platform_V1_PlatformDomainsCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  public func domains(_ request: Bloombox_Schema_Services_Platform_V1_DomainInfo.Request, completion: @escaping (Bloombox_Schema_Services_Platform_V1_DomainInfo.Response?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformDomainsCall {
    return try Bloombox_Schema_Services_Platform_V1_PlatformDomainsCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func brand(_ request: Bloombox_Schema_Services_Platform_V1_BrandInfo.Request) throws -> Bloombox_Schema_Services_Platform_V1_BrandInfo.Response {
    return try Bloombox_Schema_Services_Platform_V1_PlatformBrandCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  public func brand(_ request: Bloombox_Schema_Services_Platform_V1_BrandInfo.Request, completion: @escaping (Bloombox_Schema_Services_Platform_V1_BrandInfo.Response?, CallResult) -> Void) throws -> Bloombox_Schema_Services_Platform_V1_PlatformBrandCall {
    return try Bloombox_Schema_Services_Platform_V1_PlatformBrandCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
public protocol Bloombox_Schema_Services_Platform_V1_PlatformProvider: ServiceProvider {
  func ping(request: Bloombox_Schema_Services_Platform_V1_Ping.Request, session: Bloombox_Schema_Services_Platform_V1_PlatformPingSession) throws -> Bloombox_Schema_Services_Platform_V1_Ping.Response
  func health(request: SwiftProtobuf.Google_Protobuf_Empty, session: Bloombox_Schema_Services_Platform_V1_PlatformHealthSession) throws -> SwiftProtobuf.Google_Protobuf_Empty
  func resolve(request: Bloombox_Schema_Services_Platform_V1_DomainResolve.Request, session: Bloombox_Schema_Services_Platform_V1_PlatformResolveSession) throws -> Bloombox_Schema_Services_Platform_V1_DomainResolve.Response
  func domains(request: Bloombox_Schema_Services_Platform_V1_DomainInfo.Request, session: Bloombox_Schema_Services_Platform_V1_PlatformDomainsSession) throws -> Bloombox_Schema_Services_Platform_V1_DomainInfo.Response
  func brand(request: Bloombox_Schema_Services_Platform_V1_BrandInfo.Request, session: Bloombox_Schema_Services_Platform_V1_PlatformBrandSession) throws -> Bloombox_Schema_Services_Platform_V1_BrandInfo.Response
}

extension Bloombox_Schema_Services_Platform_V1_PlatformProvider {
  public var serviceName: String { return "bloombox.schema.services.platform.v1.Platform" }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  public func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    switch method {
    case "/bloombox.schema.services.platform.v1.Platform/Ping":
      return try Bloombox_Schema_Services_Platform_V1_PlatformPingSessionBase(
        handler: handler,
        providerBlock: { try self.ping(request: $0, session: $1 as! Bloombox_Schema_Services_Platform_V1_PlatformPingSessionBase) })
          .run()
    case "/bloombox.schema.services.platform.v1.Platform/Health":
      return try Bloombox_Schema_Services_Platform_V1_PlatformHealthSessionBase(
        handler: handler,
        providerBlock: { try self.health(request: $0, session: $1 as! Bloombox_Schema_Services_Platform_V1_PlatformHealthSessionBase) })
          .run()
    case "/bloombox.schema.services.platform.v1.Platform/Resolve":
      return try Bloombox_Schema_Services_Platform_V1_PlatformResolveSessionBase(
        handler: handler,
        providerBlock: { try self.resolve(request: $0, session: $1 as! Bloombox_Schema_Services_Platform_V1_PlatformResolveSessionBase) })
          .run()
    case "/bloombox.schema.services.platform.v1.Platform/Domains":
      return try Bloombox_Schema_Services_Platform_V1_PlatformDomainsSessionBase(
        handler: handler,
        providerBlock: { try self.domains(request: $0, session: $1 as! Bloombox_Schema_Services_Platform_V1_PlatformDomainsSessionBase) })
          .run()
    case "/bloombox.schema.services.platform.v1.Platform/Brand":
      return try Bloombox_Schema_Services_Platform_V1_PlatformBrandSessionBase(
        handler: handler,
        providerBlock: { try self.brand(request: $0, session: $1 as! Bloombox_Schema_Services_Platform_V1_PlatformBrandSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformPingSession: ServerSessionUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformPingSessionBase: ServerSessionUnaryBase<Bloombox_Schema_Services_Platform_V1_Ping.Request, Bloombox_Schema_Services_Platform_V1_Ping.Response>, Bloombox_Schema_Services_Platform_V1_PlatformPingSession {}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformHealthSession: ServerSessionUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformHealthSessionBase: ServerSessionUnaryBase<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Schema_Services_Platform_V1_PlatformHealthSession {}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformResolveSession: ServerSessionUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformResolveSessionBase: ServerSessionUnaryBase<Bloombox_Schema_Services_Platform_V1_DomainResolve.Request, Bloombox_Schema_Services_Platform_V1_DomainResolve.Response>, Bloombox_Schema_Services_Platform_V1_PlatformResolveSession {}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformDomainsSession: ServerSessionUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformDomainsSessionBase: ServerSessionUnaryBase<Bloombox_Schema_Services_Platform_V1_DomainInfo.Request, Bloombox_Schema_Services_Platform_V1_DomainInfo.Response>, Bloombox_Schema_Services_Platform_V1_PlatformDomainsSession {}

public protocol Bloombox_Schema_Services_Platform_V1_PlatformBrandSession: ServerSessionUnary {}

fileprivate final class Bloombox_Schema_Services_Platform_V1_PlatformBrandSessionBase: ServerSessionUnaryBase<Bloombox_Schema_Services_Platform_V1_BrandInfo.Request, Bloombox_Schema_Services_Platform_V1_BrandInfo.Response>, Bloombox_Schema_Services_Platform_V1_PlatformBrandSession {}
