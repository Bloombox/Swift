//
//  ShopService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


// Callback Types
typealias ShopInfoCallback = (ShopInfo.Response?) -> ()
typealias CheckZipcodeCallback = (CheckZipcode.Response?) -> ()


internal final class ShopImpl: Shop, RPCService {
  /**
   * Client-wide settings.
   */
  internal let settings: BloomboxClient.Settings

  /**
   * Initialize the Shop service with a plaintext endpoint.
   */
  required init(endpoint: RPCEndpoint,
                settings: BloomboxClient.Settings) {
    self.settings = settings
    super.init(
      address: "\(endpoint.host):\(endpoint.port)")
  }

  /**
   * Initialize the Shop service with a secure endpoint.
   */
  required init(endpoint: SecureRPCEndpoint,
                settings: BloomboxClient.Settings) {
    self.settings = settings
    super.init(
      address: "\(endpoint.host):\(endpoint.port)",
      certificates: endpoint.chain,
      host: endpoint.hostname ?? endpoint.host)
  }
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
    service = RPCServiceFactory<ShopImpl>.factory(
      forService: Transport.config.services.shop,
      settings: settings)
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
  public func shopInfo(request: ShopInfo.Request) -> ShopInfo.Response {
    return ShopInfo.Response()
  }

  /**
   * Retrieve info, asynchronously, about a particular storefront, specifically, its
   * open/closed status, hours, and metadata.
   */
  public func shopInfo(request: ShopInfo.Request,
                       callback: ShopInfoCallback) {
  }

  // MARK: - Check Zipcode
  /**
   * Check a zipcode for delivery eligibility, including any order minimum required, if
   * specified by the server.
   */
  public func checkZipcode(request: CheckZipcode.Request) -> CheckZipcode.Response {
    return CheckZipcode.Response()
  }

  /**
   * Check a zipcode, asynchronously, for delivery eligibility, including any order
   * minimum required, if specified by the server.
   */
  public func checkZipcode(request: CheckZipcode.Request,
                           callback: CheckZipcodeCallback) {
  }

  // MARK: - Verify Member
  /**
   * Verify a member account by their email address. "Verify" in this context checks that
   * they have a valid account, membership with the partner/location in question, and have
   * no expired documents, like medical recommendations and IDs.
   */
  public func verifyMember() -> VerifyMember.Response {
    return VerifyMember.Response()
  }

  // MARK: - Enroll Member
  /**
   * Enroll a member for a new account, and have them auto-join the enrolling partner
   * location. Under the hood, this creates an account, writes it to the partner systems,
   * and then auto-creates a membership.
   */
  public func enrollMember() -> EnrollMember.Response {
    return EnrollMember.Response()
  }

  // MARK: - Get Order
  /**
   * Retrieve information about a previously-submitted pickup or delivery order. Includes
   * status information and an action log.
   */
  public func getOrder() -> GetOrder.Response {
    return GetOrder.Response()
  }

  // MARK: - Submit Order
  /**
   * Submit a new order for pickup or delivery. Requires an existing member account,
   * acquireable via `enrollMember`, and valid item keys for each item desired as part
   * of the order.
   */
  public func submitOrder() -> SubmitOrder.Response {
    return SubmitOrder.Response()
  }
}
