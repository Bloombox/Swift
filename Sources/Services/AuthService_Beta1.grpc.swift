//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: auth/v1beta1/AuthService_Beta1.proto
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

public protocol Bloombox_Services_Auth_V1beta1_AuthNonceCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthNonceCallBase: ClientCallUnaryBase<SwiftProtobuf.Google_Protobuf_Empty, Bloombox_Services_Auth_V1beta1_AuthNonce>, Bloombox_Services_Auth_V1beta1_AuthNonceCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Nonce" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthAuthenticateCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthAuthenticateCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_AuthenticateUser.Request, Bloombox_Services_Auth_V1beta1_AuthenticateUser.Response>, Bloombox_Services_Auth_V1beta1_AuthAuthenticateCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Authenticate" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthConsentCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthConsentCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_ConsentFlow.Request, Bloombox_Services_Auth_V1beta1_ConsentFlow.Response>, Bloombox_Services_Auth_V1beta1_AuthConsentCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Consent" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthTokenCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthTokenCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_ResolveToken.Request, Bloombox_Services_Auth_V1beta1_ResolveToken.Response>, Bloombox_Services_Auth_V1beta1_AuthTokenCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Token" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthAcceptCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthAcceptCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_ConsentDecision.Accept, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Auth_V1beta1_AuthAcceptCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Accept" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthRejectCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthRejectCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_ConsentDecision.Reject, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Auth_V1beta1_AuthRejectCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Reject" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthConnectCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthConnectCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_IdentityConnect.Request, Bloombox_Services_Auth_V1beta1_IdentityConnect.Response>, Bloombox_Services_Auth_V1beta1_AuthConnectCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Connect" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthContextCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthContextCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_UserContext.Request, Bloombox_Services_Auth_V1beta1_UserContext.Response>, Bloombox_Services_Auth_V1beta1_AuthContextCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Context" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthProfileCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthProfileCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_GetProfile.Request, Bloombox_Services_Auth_V1beta1_GetProfile.Response>, Bloombox_Services_Auth_V1beta1_AuthProfileCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/Profile" }
}

public protocol Bloombox_Services_Auth_V1beta1_AuthUpdateProfileCall: ClientCallUnary {}

fileprivate final class Bloombox_Services_Auth_V1beta1_AuthUpdateProfileCallBase: ClientCallUnaryBase<Bloombox_Services_Auth_V1beta1_ProfileUpdate.Request, SwiftProtobuf.Google_Protobuf_Empty>, Bloombox_Services_Auth_V1beta1_AuthUpdateProfileCall {
  override class var method: String { return "/bloombox.services.auth.v1beta1.Auth/UpdateProfile" }
}


/// Instantiate Bloombox_Services_Auth_V1beta1_AuthServiceClient, then call methods of this protocol to make API calls.
public protocol Bloombox_Services_Auth_V1beta1_AuthService: ServiceClient {
  /// Synchronous. Unary.
  func nonce(_ request: SwiftProtobuf.Google_Protobuf_Empty, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_AuthNonce
  /// Asynchronous. Unary.
  @discardableResult
  func nonce(_ request: SwiftProtobuf.Google_Protobuf_Empty, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_AuthNonce?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthNonceCall

  /// Synchronous. Unary.
  func authenticate(_ request: Bloombox_Services_Auth_V1beta1_AuthenticateUser.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_AuthenticateUser.Response
  /// Asynchronous. Unary.
  @discardableResult
  func authenticate(_ request: Bloombox_Services_Auth_V1beta1_AuthenticateUser.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_AuthenticateUser.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthAuthenticateCall

  /// Synchronous. Unary.
  func consent(_ request: Bloombox_Services_Auth_V1beta1_ConsentFlow.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_ConsentFlow.Response
  /// Asynchronous. Unary.
  @discardableResult
  func consent(_ request: Bloombox_Services_Auth_V1beta1_ConsentFlow.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_ConsentFlow.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthConsentCall

  /// Synchronous. Unary.
  func token(_ request: Bloombox_Services_Auth_V1beta1_ResolveToken.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_ResolveToken.Response
  /// Asynchronous. Unary.
  @discardableResult
  func token(_ request: Bloombox_Services_Auth_V1beta1_ResolveToken.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_ResolveToken.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthTokenCall

  /// Synchronous. Unary.
  func accept(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Accept, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func accept(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Accept, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthAcceptCall

  /// Synchronous. Unary.
  func reject(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Reject, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func reject(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Reject, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthRejectCall

  /// Synchronous. Unary.
  func connect(_ request: Bloombox_Services_Auth_V1beta1_IdentityConnect.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_IdentityConnect.Response
  /// Asynchronous. Unary.
  @discardableResult
  func connect(_ request: Bloombox_Services_Auth_V1beta1_IdentityConnect.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_IdentityConnect.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthConnectCall

  /// Synchronous. Unary.
  func context(_ request: Bloombox_Services_Auth_V1beta1_UserContext.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_UserContext.Response
  /// Asynchronous. Unary.
  @discardableResult
  func context(_ request: Bloombox_Services_Auth_V1beta1_UserContext.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_UserContext.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthContextCall

  /// Synchronous. Unary.
  func profile(_ request: Bloombox_Services_Auth_V1beta1_GetProfile.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_GetProfile.Response
  /// Asynchronous. Unary.
  @discardableResult
  func profile(_ request: Bloombox_Services_Auth_V1beta1_GetProfile.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_GetProfile.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthProfileCall

  /// Synchronous. Unary.
  func updateProfile(_ request: Bloombox_Services_Auth_V1beta1_ProfileUpdate.Request, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty
  /// Asynchronous. Unary.
  @discardableResult
  func updateProfile(_ request: Bloombox_Services_Auth_V1beta1_ProfileUpdate.Request, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthUpdateProfileCall

}

public extension Bloombox_Services_Auth_V1beta1_AuthService {
  /// Synchronous. Unary.
  func nonce(_ request: SwiftProtobuf.Google_Protobuf_Empty) throws -> Bloombox_Services_Auth_V1beta1_AuthNonce {
    return try self.nonce(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func nonce(_ request: SwiftProtobuf.Google_Protobuf_Empty, completion: @escaping (Bloombox_Services_Auth_V1beta1_AuthNonce?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthNonceCall {
    return try self.nonce(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func authenticate(_ request: Bloombox_Services_Auth_V1beta1_AuthenticateUser.Request) throws -> Bloombox_Services_Auth_V1beta1_AuthenticateUser.Response {
    return try self.authenticate(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func authenticate(_ request: Bloombox_Services_Auth_V1beta1_AuthenticateUser.Request, completion: @escaping (Bloombox_Services_Auth_V1beta1_AuthenticateUser.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthAuthenticateCall {
    return try self.authenticate(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func consent(_ request: Bloombox_Services_Auth_V1beta1_ConsentFlow.Request) throws -> Bloombox_Services_Auth_V1beta1_ConsentFlow.Response {
    return try self.consent(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func consent(_ request: Bloombox_Services_Auth_V1beta1_ConsentFlow.Request, completion: @escaping (Bloombox_Services_Auth_V1beta1_ConsentFlow.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthConsentCall {
    return try self.consent(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func token(_ request: Bloombox_Services_Auth_V1beta1_ResolveToken.Request) throws -> Bloombox_Services_Auth_V1beta1_ResolveToken.Response {
    return try self.token(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func token(_ request: Bloombox_Services_Auth_V1beta1_ResolveToken.Request, completion: @escaping (Bloombox_Services_Auth_V1beta1_ResolveToken.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthTokenCall {
    return try self.token(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func accept(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Accept) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.accept(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func accept(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Accept, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthAcceptCall {
    return try self.accept(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func reject(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Reject) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.reject(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func reject(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Reject, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthRejectCall {
    return try self.reject(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func connect(_ request: Bloombox_Services_Auth_V1beta1_IdentityConnect.Request) throws -> Bloombox_Services_Auth_V1beta1_IdentityConnect.Response {
    return try self.connect(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func connect(_ request: Bloombox_Services_Auth_V1beta1_IdentityConnect.Request, completion: @escaping (Bloombox_Services_Auth_V1beta1_IdentityConnect.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthConnectCall {
    return try self.connect(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func context(_ request: Bloombox_Services_Auth_V1beta1_UserContext.Request) throws -> Bloombox_Services_Auth_V1beta1_UserContext.Response {
    return try self.context(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func context(_ request: Bloombox_Services_Auth_V1beta1_UserContext.Request, completion: @escaping (Bloombox_Services_Auth_V1beta1_UserContext.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthContextCall {
    return try self.context(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func profile(_ request: Bloombox_Services_Auth_V1beta1_GetProfile.Request) throws -> Bloombox_Services_Auth_V1beta1_GetProfile.Response {
    return try self.profile(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func profile(_ request: Bloombox_Services_Auth_V1beta1_GetProfile.Request, completion: @escaping (Bloombox_Services_Auth_V1beta1_GetProfile.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthProfileCall {
    return try self.profile(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func updateProfile(_ request: Bloombox_Services_Auth_V1beta1_ProfileUpdate.Request) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try self.updateProfile(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func updateProfile(_ request: Bloombox_Services_Auth_V1beta1_ProfileUpdate.Request, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthUpdateProfileCall {
    return try self.updateProfile(request, metadata: self.metadata, completion: completion)
  }

}

public final class Bloombox_Services_Auth_V1beta1_AuthServiceClient: ServiceClientBase, Bloombox_Services_Auth_V1beta1_AuthService {
  /// Synchronous. Unary.
  public func nonce(_ request: SwiftProtobuf.Google_Protobuf_Empty, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_AuthNonce {
    return try Bloombox_Services_Auth_V1beta1_AuthNonceCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func nonce(_ request: SwiftProtobuf.Google_Protobuf_Empty, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_AuthNonce?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthNonceCall {
    return try Bloombox_Services_Auth_V1beta1_AuthNonceCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func authenticate(_ request: Bloombox_Services_Auth_V1beta1_AuthenticateUser.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_AuthenticateUser.Response {
    return try Bloombox_Services_Auth_V1beta1_AuthAuthenticateCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func authenticate(_ request: Bloombox_Services_Auth_V1beta1_AuthenticateUser.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_AuthenticateUser.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthAuthenticateCall {
    return try Bloombox_Services_Auth_V1beta1_AuthAuthenticateCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func consent(_ request: Bloombox_Services_Auth_V1beta1_ConsentFlow.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_ConsentFlow.Response {
    return try Bloombox_Services_Auth_V1beta1_AuthConsentCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func consent(_ request: Bloombox_Services_Auth_V1beta1_ConsentFlow.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_ConsentFlow.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthConsentCall {
    return try Bloombox_Services_Auth_V1beta1_AuthConsentCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func token(_ request: Bloombox_Services_Auth_V1beta1_ResolveToken.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_ResolveToken.Response {
    return try Bloombox_Services_Auth_V1beta1_AuthTokenCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func token(_ request: Bloombox_Services_Auth_V1beta1_ResolveToken.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_ResolveToken.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthTokenCall {
    return try Bloombox_Services_Auth_V1beta1_AuthTokenCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func accept(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Accept, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Auth_V1beta1_AuthAcceptCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func accept(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Accept, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthAcceptCall {
    return try Bloombox_Services_Auth_V1beta1_AuthAcceptCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func reject(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Reject, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Auth_V1beta1_AuthRejectCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func reject(_ request: Bloombox_Services_Auth_V1beta1_ConsentDecision.Reject, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthRejectCall {
    return try Bloombox_Services_Auth_V1beta1_AuthRejectCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func connect(_ request: Bloombox_Services_Auth_V1beta1_IdentityConnect.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_IdentityConnect.Response {
    return try Bloombox_Services_Auth_V1beta1_AuthConnectCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func connect(_ request: Bloombox_Services_Auth_V1beta1_IdentityConnect.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_IdentityConnect.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthConnectCall {
    return try Bloombox_Services_Auth_V1beta1_AuthConnectCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func context(_ request: Bloombox_Services_Auth_V1beta1_UserContext.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_UserContext.Response {
    return try Bloombox_Services_Auth_V1beta1_AuthContextCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func context(_ request: Bloombox_Services_Auth_V1beta1_UserContext.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_UserContext.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthContextCall {
    return try Bloombox_Services_Auth_V1beta1_AuthContextCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func profile(_ request: Bloombox_Services_Auth_V1beta1_GetProfile.Request, metadata customMetadata: Metadata) throws -> Bloombox_Services_Auth_V1beta1_GetProfile.Response {
    return try Bloombox_Services_Auth_V1beta1_AuthProfileCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func profile(_ request: Bloombox_Services_Auth_V1beta1_GetProfile.Request, metadata customMetadata: Metadata, completion: @escaping (Bloombox_Services_Auth_V1beta1_GetProfile.Response?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthProfileCall {
    return try Bloombox_Services_Auth_V1beta1_AuthProfileCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  public func updateProfile(_ request: Bloombox_Services_Auth_V1beta1_ProfileUpdate.Request, metadata customMetadata: Metadata) throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try Bloombox_Services_Auth_V1beta1_AuthUpdateProfileCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  public func updateProfile(_ request: Bloombox_Services_Auth_V1beta1_ProfileUpdate.Request, metadata customMetadata: Metadata, completion: @escaping (SwiftProtobuf.Google_Protobuf_Empty?, CallResult) -> Void) throws -> Bloombox_Services_Auth_V1beta1_AuthUpdateProfileCall {
    return try Bloombox_Services_Auth_V1beta1_AuthUpdateProfileCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

