//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: platform/v1/PlatformService_v1.proto
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
**/
import Dispatch
import Foundation
import SwiftGRPC
import SwiftProtobuf
import OpenCannabis

public protocol Bloombox_Services_Platform_V1_PlatformPingCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Platform_V1_PlatformPingCallBase: ClientCallUnaryBase<Bloombox_Services_Platform_V1_Ping.Request, Bloombox_Services_Platform_V1_Ping.Response>, Bloombox_Services_Platform_V1_PlatformPingCall {
  override class var method: String { return "/bloombox.services.platform.v1.Platform/Ping" }
}

public protocol Bloombox_Services_Platform_V1_PlatformHealthCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Platform_V1_PlatformHealthCallBase: ClientCallUnaryBase<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Platform_V1_PlatformHealthCall {
  override class var method: String { return "/bloombox.services.platform.v1.Platform/Health" }
}

public protocol Bloombox_Services_Platform_V1_PlatformResolveCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Platform_V1_PlatformResolveCallBase: ClientCallUnaryBase<Bloombox_Services_Platform_V1_DomainResolve.Request, Bloombox_Services_Platform_V1_DomainResolve.Response>, Bloombox_Services_Platform_V1_PlatformResolveCall {
  override class var method: String { return "/bloombox.services.platform.v1.Platform/Resolve" }
}

public protocol Bloombox_Services_Platform_V1_PlatformDomainsCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Platform_V1_PlatformDomainsCallBase: ClientCallUnaryBase<Bloombox_Services_Platform_V1_DomainInfo.Request, Bloombox_Services_Platform_V1_DomainInfo.Response>, Bloombox_Services_Platform_V1_PlatformDomainsCall {
  override class var method: String { return "/bloombox.services.platform.v1.Platform/Domains" }
}

public protocol Bloombox_Services_Platform_V1_PlatformSiteInfoCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Platform_V1_PlatformSiteInfoCallBase: ClientCallUnaryBase<Bloombox_Services_Platform_V1_SiteInfo.Request, Bloombox_Services_Platform_V1_SiteInfo.Response>, Bloombox_Services_Platform_V1_PlatformSiteInfoCall {
  override class var method: String { return "/bloombox.services.platform.v1.Platform/SiteInfo" }
}

public protocol Bloombox_Services_Platform_V1_PlatformBrandCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Platform_V1_PlatformBrandCallBase: ClientCallUnaryBase<Bloombox_Services_Platform_V1_BrandInfo.Request, Bloombox_Services_Platform_V1_BrandInfo.Response>, Bloombox_Services_Platform_V1_PlatformBrandCall {
  override class var method: String { return "/bloombox.services.platform.v1.Platform/Brand" }
}


/// Instantiate Bloombox_Services_Platform_V1_PlatformServiceClient, then call methods of this protocol to make API calls.
public protocol Bloombox_Services_Platform_V1_PlatformService: ServiceClient {
  /// Synchronous. Unary.
  func ping(_ request: Bloombox_Services_Platform_V1_Ping.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_Ping.Response
  /// Asynchronous. Unary.
  @discardableResult
  func ping(_ request: Bloombox_Services_Platform_V1_Ping.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformPingCall

  /// Synchronous. Unary.
  func health(_ request: SwiftProtobuf.Google_Protobuf_Empty, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func health(_ request: SwiftProtobuf.Google_Protobuf_Empty, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformHealthCall

  /// Synchronous. Unary.
  func resolve(_ request: Bloombox_Services_Platform_V1_DomainResolve.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_DomainResolve.Response
  /// Asynchronous. Unary.
  @discardableResult
  func resolve(_ request: Bloombox_Services_Platform_V1_DomainResolve.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_DomainResolve.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformResolveCall

  /// Synchronous. Unary.
  func domains(_ request: Bloombox_Services_Platform_V1_DomainInfo.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_DomainInfo.Response
  /// Asynchronous. Unary.
  @discardableResult
  func domains(_ request: Bloombox_Services_Platform_V1_DomainInfo.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_DomainInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformDomainsCall

  /// Synchronous. Unary.
  func siteInfo(_ request: Bloombox_Services_Platform_V1_SiteInfo.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_SiteInfo.Response
  /// Asynchronous. Unary.
  @discardableResult
  func siteInfo(_ request: Bloombox_Services_Platform_V1_SiteInfo.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_SiteInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformSiteInfoCall

  /// Synchronous. Unary.
  func brand(_ request: Bloombox_Services_Platform_V1_BrandInfo.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_BrandInfo.Response
  /// Asynchronous. Unary.
  @discardableResult
  func brand(_ request: Bloombox_Services_Platform_V1_BrandInfo.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_BrandInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformBrandCall

}

public extension Bloombox_Services_Platform_V1_PlatformService {
  /// Synchronous. Unary.
  func ping(_ request: Bloombox_Services_Platform_V1_Ping.Request) throws -> Bloombox_Services_Platform_V1_Ping.Response {
    return try self.ping(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func ping(_ request: Bloombox_Services_Platform_V1_Ping.Request, completion: @escaping (Bloombox_Services_Platform_V1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformPingCall {
    return try self.ping(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func health(_ request: SwiftProtobuf.Google_Protobuf_Empty) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.health(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func health(_ request: SwiftProtobuf.Google_Protobuf_Empty, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformHealthCall {
    return try self.health(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func resolve(_ request: Bloombox_Services_Platform_V1_DomainResolve.Request) throws -> Bloombox_Services_Platform_V1_DomainResolve.Response {
    return try self.resolve(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func resolve(_ request: Bloombox_Services_Platform_V1_DomainResolve.Request, completion: @escaping (Bloombox_Services_Platform_V1_DomainResolve.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformResolveCall {
    return try self.resolve(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func domains(_ request: Bloombox_Services_Platform_V1_DomainInfo.Request) throws -> Bloombox_Services_Platform_V1_DomainInfo.Response {
    return try self.domains(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func domains(_ request: Bloombox_Services_Platform_V1_DomainInfo.Request, completion: @escaping (Bloombox_Services_Platform_V1_DomainInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformDomainsCall {
    return try self.domains(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func siteInfo(_ request: Bloombox_Services_Platform_V1_SiteInfo.Request) throws -> Bloombox_Services_Platform_V1_SiteInfo.Response {
    return try self.siteInfo(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func siteInfo(_ request: Bloombox_Services_Platform_V1_SiteInfo.Request, completion: @escaping (Bloombox_Services_Platform_V1_SiteInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformSiteInfoCall {
    return try self.siteInfo(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func brand(_ request: Bloombox_Services_Platform_V1_BrandInfo.Request) throws -> Bloombox_Services_Platform_V1_BrandInfo.Response {
    return try self.brand(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func brand(_ request: Bloombox_Services_Platform_V1_BrandInfo.Request, completion: @escaping (Bloombox_Services_Platform_V1_BrandInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformBrandCall {
    return try self.brand(request, metadata: self.metadata, completion: completion)
  }

}

public final class Bloombox_Services_Platform_V1_PlatformServiceClient: ServiceClientBase, Bloombox_Services_Platform_V1_PlatformService {
  /// Synchronous. Unary.
  public func ping(_ request: Bloombox_Services_Platform_V1_Ping.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_Ping.Response {
    return try Bloombox_Services_Platform_V1_PlatformPingCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func ping(_ request: Bloombox_Services_Platform_V1_Ping.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_Ping.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformPingCall {
    return try Bloombox_Services_Platform_V1_PlatformPingCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func health(_ request: SwiftProtobuf.Google_Protobuf_Empty, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Platform_V1_PlatformHealthCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func health(_ request: SwiftProtobuf.Google_Protobuf_Empty, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformHealthCall {
    return try Bloombox_Services_Platform_V1_PlatformHealthCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func resolve(_ request: Bloombox_Services_Platform_V1_DomainResolve.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_DomainResolve.Response {
    return try Bloombox_Services_Platform_V1_PlatformResolveCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func resolve(_ request: Bloombox_Services_Platform_V1_DomainResolve.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_DomainResolve.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformResolveCall {
    return try Bloombox_Services_Platform_V1_PlatformResolveCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func domains(_ request: Bloombox_Services_Platform_V1_DomainInfo.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_DomainInfo.Response {
    return try Bloombox_Services_Platform_V1_PlatformDomainsCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func domains(_ request: Bloombox_Services_Platform_V1_DomainInfo.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_DomainInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformDomainsCall {
    return try Bloombox_Services_Platform_V1_PlatformDomainsCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func siteInfo(_ request: Bloombox_Services_Platform_V1_SiteInfo.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_SiteInfo.Response {
    return try Bloombox_Services_Platform_V1_PlatformSiteInfoCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func siteInfo(_ request: Bloombox_Services_Platform_V1_SiteInfo.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_SiteInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformSiteInfoCall {
    return try Bloombox_Services_Platform_V1_PlatformSiteInfoCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func brand(_ request: Bloombox_Services_Platform_V1_BrandInfo.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Platform_V1_BrandInfo.Response {
    return try Bloombox_Services_Platform_V1_PlatformBrandCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func brand(_ request: Bloombox_Services_Platform_V1_BrandInfo.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Platform_V1_BrandInfo.Response?, CallResult) -> Void) throws -> Bloombox_Services_Platform_V1_PlatformBrandCall {
    return try Bloombox_Services_Platform_V1_PlatformBrandCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

