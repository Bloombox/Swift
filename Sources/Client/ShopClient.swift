//
//  ShopService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import SwiftGRPC
import Schema


// Callback Types
public typealias ShopInfoCallback = (CallResult, ShopInfo.Response?) -> ()
public typealias CheckZipcodeCallback = (CallResult, CheckZipcode.Response?) -> ()
public typealias VerifyMemberCallback = (CallResult, VerifyMember.Response?) -> ()
public typealias EnrollMemberCallback = (CallResult, EnrollMember.Response?) -> ()
public typealias GetOrderCallback = (CallResult, GetOrder.Response?) -> ()
public typealias SubmitOrderCallback = (CallResult, SubmitOrder.Response?) -> ()


/// Enumerates code-level errors in the Shop client.
public enum ShopClientError: Error {
  case invalidApiKey
  case invalidPartnerCode
  case invalidLocationCode
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

  /// Library-internal initializer.
  ///
  public init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Shop service.
  ///
  internal func service(_ apiKey: APIKey) throws -> ShopService {
    let svc = RPCServiceFactory<ShopService>.factory(forService: Transport.config.services.shop)
    do {
      try svc.metadata.add(key: "x-api-key", value: apiKey)
    } catch {
      // unable to mount API key
      throw ShopClientError.invalidApiKey
    }
    return svc
  }

  /// Resolve partner and location context, throwing an error if it cannot be figured out.
  ///
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
      throw ShopClientError.invalidPartnerCode
    }
    return (partner: partnerCode!, location: locationCode!, apiKey: apiKey!)
  }

  // MARK: - Public API -

  // MARK: Shop Info

  /// Retrieve info about a particular storefront, specifically, its open/closed status, hours, and metadata.
  ///
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
  public func checkZipcode(zipcode: String,
                           partner: PartnerCode? = nil,
                           apiKey: APIKey? = nil,
                           location: LocationCode? = nil) throws -> CheckZipcode.Response {
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
