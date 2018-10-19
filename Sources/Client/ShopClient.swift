//
//  ShopService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import SwiftGRPC
import OpenCannabis


// Callback Types

/// Shop callback specificaion. Accepts a gRPC call result, and a shop info response which indicates the  status of an
/// online store.Two parameters are given and no return value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `ShopInfo.Response?`: If the call succeeded, the self reported status of the online shop
public typealias ShopInfoCallback = (CallResult, ShopInfo.Response?) -> ()

/// Check Zipcode callback specification. Accepts a gRPC call result, and a Zipcode to be validated
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `CheckZipcode.Response?`: If the call succeeded, the minimum order for the zipcode and if it's supported or not
public typealias CheckZipcodeCallback = (CallResult, CheckZipcode.Response?) -> ()

/// Verify Member callback specification. Accepts a gRPC call result, and a membership to be validated
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `VerifyMember.Response`: If the call succeeded, The verification status of the member
public typealias VerifyMemberCallback = (CallResult, VerifyMember.Response?) -> ()

/// Enroll Member callback specification. Accepts a gRPC call result, and a member to be enrolled
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `EnrollMember.Response`: If the call succeeded, the current enrollment status of the member
public typealias EnrollMemberCallback = (CallResult, EnrollMember.Response?) -> ()

/// Get Order callback specification. Accepts a gRPC call result, and an order ID to retrieve
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `GetOrder.Response`:  If the call succeeded, retrieves the order
public typealias GetOrderCallback = (CallResult, GetOrder.Response?) -> ()

/// Submit order callback specification. Accepts gRPC call result, and an order to be submitted
///
/// - Parameters:
///    - `CallResult`: gRPC call result, carrying the status of the call.
///    - `SubmitOrder.Response`:  If the call succeeded, submits the order
public typealias SubmitOrderCallback = (CallResult, SubmitOrder.Response?) -> ()


/// Enumerates code-level errors in the Shop client.
public enum ShopClientError: Error {
  /// The provided API key was found to be invalid.
  case invalidApiKey

  /// The provided partner account code was found to be invalid, or none could be resolved.
  case invalidPartnerCode
  /// The provided location account code was found to be invalid, or none could be resolved.
  case invalidLocationCode

  /// An internal error happened during a given request or request value.
  case internalError
}


/// Provides functionality for the Shop API, which supports operations related to pickup or delivery ordering, member
/// verification and enrollment, and basic shop operations.
public final class ShopClient: RemoteService {
  /// Name of the Shop API, which is "shop".
  let name = "shop"

  /// Version of this service.
  let version = "v1"

  // MARK: Internals

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Shop service.
  internal var svc: ShopService?

  /// Library-internal initializer.
  /// - Parameter settings: settings to initialize with.
  public init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Shop service.
  /// - Parameter apiKey: API key to use when invoking API calls.
  internal func service(_ apiKey: APIKey) throws -> ShopService {
    if let s = self.svc {
      return s
    }
    let svc = RPCServiceFactory<ShopService>.factory(
      forService: Transport.config.services.shop,
      withSettings: self.settings)

    try svc.metadata.add(key: "x-api-key", value: apiKey)
    self.svc = svc
    return svc
  }

  /// Resolve partner and location context, throwing an error if it cannot be figured out.
  ///
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apikey: API key to use when invoking API calls.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: `ShopClientError` codes related to the API or the circumstances of the order
  private func resolveContext(_ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil,
                              _ apiKey: APIKey? = nil) throws -> (partner: PartnerCode, location: LocationCode, apiKey: APIKey) {
    let partnerCode: PartnerCode? = partner ?? settings.partner
    let locationCode: LocationCode? = location ?? settings.location
    let apiKey: APIKey? = apiKey ?? settings.apiKey

    // must have an API key
    guard apiKey != nil else {
      throw ShopClientError.invalidApiKey
    }

    // validate partner and location codes
    guard partnerCode != nil, locationCode != nil else {
      // throw error: we require a partner or location code from somewhere
      if partnerCode == nil {
        throw ShopClientError.invalidPartnerCode
      }
      throw ShopClientError.invalidLocationCode
    }
    return (partner: partnerCode!, location: locationCode!, apiKey: apiKey!)
  }

  // MARK: - Public API -

  // MARK: Shop Info

  /// Retrieve info about a particular storefront, specifically, its open/closed status, hours, and metadata.
  ///
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: `ShopClientError` codes related to the API or the circumstances of the order
  public func info(partner: PartnerCode? = nil,
                   location: LocationCode? = nil,
                   apiKey: APIKey? = nil) throws -> ShopInfo.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).shopInfo(ShopInfo.Request.with { builder in
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /// Retrieve info, asynchronously, about a particular storefront, specifically, its open/closed status, hours, and
  /// metadata.
  ///
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Parameter callback:
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: Client side errors. see: `ShopClientError`
  @discardableResult
  public func info(partner: PartnerCode? = nil,
                   location: LocationCode? = nil,
                   apiKey: APIKey? = nil,
                   callback: @escaping ShopInfoCallback) throws -> ShopInfoCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).shopInfo(ShopInfo.Request.with { builder in
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    }) { (response, callResult) in
      callback(callResult, response)
    }
  }

  // MARK: - Check Zipcode

  /// Check a zipcode for delivery eligibility, including any order minimum required, if specified by the server.
  ///
  /// - Parameter zipcode: US postal zipcode.
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: `ShopClientError` codes related to the API or the circumstances of the order
  public func checkZipcode(zipcode: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           apiKey: APIKey? = nil) throws -> CheckZipcode.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).checkZipcode(CheckZipcode.Request.with { builder in
      builder.zipcode = zipcode
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /// Check a zipcode, asynchronously, for delivery eligibility, including any order minimum required, if specified by
  /// the server.
  ///
  /// - Parameter zipcode: US postal zipcode.
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Parameter callback:
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: Client side errors. see: `ShopClientError`
  @discardableResult
  public func checkZipcode(zipcode: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           apiKey: APIKey? = nil,
                           callback: @escaping CheckZipcodeCallback) throws -> CheckZipcodeCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).checkZipcode(CheckZipcode.Request.with { builder in
      builder.zipcode = zipcode
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    }) { (response, callResult) in
      callback(callResult, response)
    }
  }

  // MARK: - Verify Member

  /// Verify a member account by their email address. "Verify" in this context checks that they have a valid account,
  /// membership with the partner/location in question, and have no expired documents, like medical recommendations and
  /// IDs.
  ///
  /// - Parameter email: Consumer email address
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: `ShopClientError` codes related to the API or the circumstances of the order
  public func verifyMember(email: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           apiKey: APIKey? = nil) throws -> VerifyMember.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    guard let base64EncodedEmail = email.data(using: .utf8)?.base64EncodedString() else {
      throw ShopClientError.internalError
    }

    return try self.service(apiKey).verifyMember(VerifyMember.Request.with { builder in
      builder.emailAddress = base64EncodedEmail.replacingOccurrences(of: "=", with: "")
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /// Verify a member account, asynchronously, by their email address. "Verify" in this context checks that they have a
  /// valid account, membership with the partner/location in question, and have no expired documents, like medical
  /// recommendations and IDs.
  ///
  /// - Parameter email: Consumer email address
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Parameter callback:
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: Client side errors. see: `ShopClientError`
  @discardableResult
  public func verifyMember(email: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           apiKey: APIKey? = nil,
                           callback: @escaping VerifyMemberCallback) throws -> VerifyMemberCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).verifyMember(VerifyMember.Request.with { builder in
      builder.emailAddress = email
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
      }) { (response, callResult) in
        callback(callResult, response)
    }
  }

  // MARK: - Enroll Member

  /// Enroll a member for a new account, and have them auto-join the enrolling partner location. Under the hood, this
  /// creates an account, writes it to the partner systems, and then auto-creates a membership.
  ///
  /// - Parameter enrollment: Information required in order to enroll/onboard a new user as a member of a retail
  /// dispensary.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: `ShopClientError` codes related to the API or the circumstances of the order
  public func enrollMember(enrollment: EnrollMember.Request,
                           apiKey: APIKey? = nil) throws -> EnrollMember.Response {
    let apiKey = apiKey ?? settings.apiKey
    guard apiKey != nil else {
      throw ShopClientError.invalidApiKey
    }
    return try self.service(apiKey!).enrollMember(enrollment)
  }

  /// Enroll a member for a new account, asynchronously, and have them auto-join the enrolling partner location. Under
  /// the hood, this creates an account, writes it to the partner systems, and then auto-creates a membership.
  ///
  /// - Parameter enrollment: Information required in order to enroll/onboard a new user as a member of a retail
  /// dispensary.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Parameter callback: Callable to dispatch once either a terminal error or response are available.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: Client side errors. see: `ShopClientError`
  @discardableResult
  public func enrollMember(enrollment: EnrollMember.Request,
                           apiKey: APIKey? = nil,
                           callback: @escaping EnrollMemberCallback) throws -> EnrollMemberCall {
    let apiKey = apiKey ?? settings.apiKey
    guard apiKey != nil else {
      throw ShopClientError.invalidApiKey
    }
    return try self.service(apiKey!).enrollMember(enrollment) { (response, callResult) in
      callback(callResult, response)
    }
  }

  // MARK: - Get Order

  /// Retrieve information about a previously-submitted pickup or delivery order. Includes status information and an
  /// action log.
  ///
  /// - Parameter id: Order ID to send with events
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Returns: Information about an existing express pickup or delivery order
  /// - Throws: `ShopClientError` codes related to the API or the circumstances of the order
  public func getOrder(id: OrderID,
                       partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       apiKey: APIKey? = nil) throws -> GetOrder.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).getOrder(GetOrder.Request.with { builder in
      builder.orderID = id
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /// Retrieve information, asynchronously, about a previously-submitted pickup or delivery order. Includes status
  /// information and an action log.
  ///
  /// - Parameter id: Order ID to send with events
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Parameter callback: Callable to dispatch once either a terminal error or response are available.
  /// - Returns: RPC call object, which can be used to observe state or cancel the call.
  /// - Throws: Client side errors. see: `ShopClientError`
  @discardableResult
  public func getOrder(id: OrderID,
                       partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       apiKey: APIKey? = nil,
                       callback: @escaping GetOrderCallback) throws -> GetOrderCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).getOrder(GetOrder.Request.with { builder in
      builder.orderID = id
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    }) { (response, callResult) in
      callback(callResult, response)
    }
  }

  // MARK: - Submit Order

  /// Submit a new order for pickup or delivery. Requires an existing member account, acquireable via `enrollMember`,
  /// and valid item keys for each item desired as part of the order.
  ///
  /// - Parameter order: Represents a full order submitted to the server for fulfillment
  /// - Parameter orderID: Order ID to send with events
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Returns: Confirmation of submission of an express pickup or delivery order.
  /// - Throws: `ShopClientError` codes related to the API or the circumstances of the order
  public func submitOrder(order: Order,
                          orderID id: OrderID? = nil,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          apiKey: APIKey? = nil) throws -> SubmitOrder.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).submitOrder(SubmitOrder.Request.with { builder in
      builder.order = order
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /// Submit a new order, asynchronously, for pickup or delivery. Requires an existing member account, acquireable via
  /// `enrollMember`, and valid item keys for each item desired as part of the order.
  ///
  /// - Parameter order: Represents a full order submitted to the server for fulfillment
  /// - Parameter orderID: Order ID to send with events
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Partner location account code to invoke under.
  /// - Parameter apiKey: API key to use when invoking API calls.
  /// - Parameter callback: Callable to dispatch once either a terminal error or response are available.
  /// - Returns: Confirmation of submission of an express pickup or delivery order.
  /// - Throws: Client side errors. see: `ShopClientError`
  @discardableResult
  public func submitOrder(order: Order,
                          orderID id: OrderID? = nil,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          apiKey: APIKey? = nil,
                          callback: @escaping SubmitOrderCallback) throws -> SubmitOrderCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).submitOrder(SubmitOrder.Request.with { builder in
      builder.order = order
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
      }) { (response, callResult) in
        callback(callResult, response)
    }
  }

}
