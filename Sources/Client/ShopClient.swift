//
//  ShopService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import gRPC


// Callback Types
public typealias ShopInfoCallback = (CallResult, ShopInfo.Response?) -> ()
public typealias CheckZipcodeCallback = (CallResult, CheckZipcode.Response?) -> ()
public typealias VerifyMemberCallback = (CallResult, VerifyMember.Response?) -> ()
public typealias EnrollMemberCallback = (CallResult, EnrollMember.Response?) -> ()
public typealias GetOrderCallback = (CallResult, GetOrder.Response?) -> ()
public typealias SubmitOrderCallback = (CallResult, SubmitOrder.Response?) -> ()


/**
 * Apply RPC Service compliance to Shop.
 */
extension Shop: RPCService {}


/**
 * Enumerates code-level errors in the Shop client.
 */
public enum ShopClientError: Error {
  case invalidPartnerCode
  case invalidLocationCode
}


/**
 * Provides functionality for the Shop API, which supports operations related to pickup or
 * delivery ordering, member verification and enrollment, and basic shop operations.
 */
public final class ShopClient: RemoteService {
  /**
   * Name of the Shop API, which is "shop".
   */
  let name = "shop"

  /**
   * Version of this service.
   */
  let version = "v1"

  // MARK: Internals

  /**
   * Generic event telemetry service.
   */
  internal let service: Shop

  /**
   * Client-wide settings.
   */
  internal let settings: BloomboxClient.Settings

  /**
   * Library-internal initializer.
   */
  internal init(settings: BloomboxClient.Settings) {
    self.settings = settings
    service = RPCServiceFactory<Shop>.factory(forService: Transport.config.services.shop)
  }

  /**
   * Resolve partner and location context, throwing an error if it cannot be figured out.
   */
  private func resolveContext(_ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil) throws -> (partner: PartnerCode, location: LocationCode) {
    let partnerCode: PartnerCode? = partner ?? settings.partner
    let locationCode: LocationCode? = location ?? settings.location

    // validate partner and location codes
    guard partnerCode != nil, locationCode != nil else {
      // throw error: we require a partner or location code from somewhere
      if (partnerCode == nil) {
        throw ShopClientError.invalidPartnerCode
      }
      throw ShopClientError.invalidPartnerCode
    }
    return (partner: partnerCode!, location: locationCode!)
  }

  /**
   * Prepare the shop service for use.
   */
  func prepare() {
  }

  // MARK: - Public API -

  // MARK: Shop Info
  /**
   * Retrieve info about a particular storefront, specifically, its open/closed status,
   * hours, and metadata.
   */
  public func shopInfo(partner: PartnerCode? = nil,
                       location: LocationCode? = nil) throws -> ShopInfo.Response {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.shopinfo(ShopInfo.Request.with { builder in
      builder.location = PartnerLocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /**
   * Retrieve info, asynchronously, about a particular storefront, specifically, its
   * open/closed status, hours, and metadata.
   */
  public func shopInfo(partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       callback: @escaping ShopInfoCallback) throws -> ShopInfoCall {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.shopinfo(ShopInfo.Request.with { builder in
      builder.location = PartnerLocationKey.with { builder in
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
  /**
   * Check a zipcode for delivery eligibility, including any order minimum required, if
   * specified by the server.
   */
  public func checkZipcode(zipcode: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil) throws -> CheckZipcode.Response {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.checkzipcode(CheckZipcode.Request.with { builder in
      builder.zipcode = zipcode
      builder.location = PartnerLocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /**
   * Check a zipcode, asynchronously, for delivery eligibility, including any order
   * minimum required, if specified by the server.
   */
  public func checkZipcode(zipcode: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           callback: @escaping CheckZipcodeCallback) throws -> CheckZipcodeCall {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.checkzipcode(CheckZipcode.Request.with { builder in
      builder.zipcode = zipcode
      builder.location = PartnerLocationKey.with { builder in
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
  /**
   * Verify a member account by their email address. "Verify" in this context checks that
   * they have a valid account, membership with the partner/location in question, and have
   * no expired documents, like medical recommendations and IDs.
   */
  public func verifyMember(email: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil) throws -> VerifyMember.Response {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.verifymember(VerifyMember.Request.with { builder in
      builder.emailAddress = email
      builder.location = PartnerLocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /**
   * Verify a member account, asynchronously, by their email address. "Verify" in this
   * context checks that they have a valid account, membership with the partner/location in
   * question, and have no expired documents, like medical recommendations and IDs.
   */
  public func verifyMember(email: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           callback: @escaping VerifyMemberCallback) throws -> VerifyMemberCall {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.verifymember(VerifyMember.Request.with { builder in
      builder.emailAddress = email
      builder.location = PartnerLocationKey.with { builder in
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
  /**
   * Enroll a member for a new account, and have them auto-join the enrolling partner
   * location. Under the hood, this creates an account, writes it to the partner systems,
   * and then auto-creates a membership.
   */
  public func enrollMember(enrollment: EnrollMember.Request) throws -> EnrollMember.Response {
    return try self.service.enrollmember(enrollment)
  }

  /**
   * Enroll a member for a new account, asynchronously, and have them auto-join the enrolling
   * partner location. Under the hood, this creates an account, writes it to the partner
   * systems, and then auto-creates a membership.
   */
  public func enrollMember(enrollment: EnrollMember.Request,
                           callback: @escaping EnrollMemberCallback) throws -> EnrollMemberCall {
    return try self.service.enrollmember(enrollment) { (response, callResult) in
      callback(callResult, response)
    }
  }

  // MARK: - Get Order
  /**
   * Retrieve information about a previously-submitted pickup or delivery order. Includes
   * status information and an action log.
   */
  public func getOrder(id: OrderID,
                       partner: PartnerCode? = nil,
                       location: LocationCode? = nil) throws -> GetOrder.Response {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.getorder(GetOrder.Request.with { builder in
      builder.orderID = id
      builder.location = PartnerLocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /**
   * Retrieve information, asynchronously, about a previously-submitted pickup or delivery
   * order. Includes status information and an action log.
   */
  public func getOrder(id: OrderID,
                       partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       callback: @escaping GetOrderCallback) throws -> GetOrderCall {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.getorder(GetOrder.Request.with { builder in
      builder.orderID = id
      builder.location = PartnerLocationKey.with { builder in
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
  /**
   * Submit a new order for pickup or delivery. Requires an existing member account,
   * acquireable via `enrollMember`, and valid item keys for each item desired as part
   * of the order.
   */
  public func submitOrder(order: Order,
                          orderID id: OrderID? = nil,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil) throws -> SubmitOrder.Response {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.submitorder(SubmitOrder.Request.with { builder in
      builder.order = order
      builder.location = PartnerLocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /**
   * Submit a new order, asynchronously, for pickup or delivery. Requires an existing
   * member account, acquireable via `enrollMember`, and valid item keys for each item
   * desired as part of the order.
   */
  public func submitOrder(order: Order,
                          orderID id: OrderID? = nil,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          callback: @escaping SubmitOrderCallback) throws -> SubmitOrderCall {
    let (locationCode, partnerCode) = try resolveContext(partner, location)

    return try self.service.submitorder(SubmitOrder.Request.with { builder in
      builder.order = order
      builder.location = PartnerLocationKey.with { builder in
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
