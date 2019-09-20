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

import Foundation
import SwiftGRPC
import OpenCannabis


// Callback Types

/// A `MemberID` is an opaque string which references a user's membership to a given retailer, via a
/// specific partner/location scope pair.
public typealias MemberID = String

/// Callback type definition for shop info, where the current shop status (`OPEN`/`CLOSED`) is returned
/// to invoking code. In some cases, a shop may express its open status as `DELIVERY_ONLY` or
/// `PICKUP_ONLY` if it does not accept a certain kind of orders at this time (but usually does).
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `ShopInfo.Response?`: If the call succeeded, a shop info response, otherwise `nil`.
public typealias ShopInfoCallback = (CallResult, ShopInfo.Response?) -> ()

/// Callback type definition for a shop zipcode check, which verifies whether a given zipcode is eligible
/// for delivery service from a given retailer.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `CheckZipcode.Response?`: If the call succeeded, a check-zipcode response, else `nil`.
public typealias CheckZipcodeCallback = (CallResult, CheckZipcode.Response?) -> ()

/// Callback type definition for a membership check, which usually occurs before order submission or
/// user enrollment. This check is usually conducted against either the user's phone number (in managed/
/// embedded contexts) or their email address (in web contexts).
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `VerifyMember.Response?`: If the call succeeded, a member verification response, else `nil`.
public typealias VerifyMemberCallback = (CallResult, VerifyMember.Response?) -> ()

/// Callback type definition for a member enrollment operation, which creates a new account from scratch for a
/// user who is present physically or digitally at a retail storefront. This end-user (consumer) account can then
/// be used to submit digital orders, check the status of existing digital orders, adjust preferences for texts or
/// emails from the retailer, and more.
///
/// When conducted from an embedded/managed context (i.e. onsite at a retail location), the flow can be cut
/// in half with the first portion consisting of only a phone number/first name pair. The flow then continues via
/// text message while the user presumably waits for an `ONSITE` order to be fulfilled.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `EnrollMember.Response?`: Member enrollment response if the operation was a success, or,
///      `nil` if no response was received due to some terminal error.
public typealias EnrollMemberCallback = (CallResult, EnrollMember.Response?) -> ()

/// Callback type definition for a status check on an existing order, either via the universal order ID (which
/// addresses an order globally across all systems and scopes), or an order number, which, when paired with
/// a given partner/location scope, can be mapped to an order ID.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `GetOrder.Response?`: Response, if the order could be found, otherwise `nil`.
public typealias GetOrderCallback = (CallResult, GetOrder.Response?) -> ()

/// Callback type definition for an operation that submits a commercial order, in a retail context, for a given
/// partner/location scope. This interface is inteded to be used from an end-user/consumer account, either
/// from a device they control and own, or from a managed device in a physical retail setting.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `SubmitOrder.Response?`: Response from the server, or `nil` if an error was returned.
public typealias SubmitOrderCallback = (CallResult, SubmitOrder.Response?) -> ()


/// Enumerates code-level errors in the Shop client.
public enum ShopClientError: Error {
  /// No API key could be resolved, or the given API key was invalid.
  case invalidApiKey

  /// No partner code could be resolved, or the given partner code was invalid.
  case invalidPartnerCode

  /// No location code could be resolved, or the given location code was invalid.
  case invalidLocationCode

  /// Failed to resolve a valid device name/UUID/serial number.
  case invalidDeviceName

  /// An unspecified internal error occurred.
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
  ///
  /// - Parameter settings: Library-level settings to fall-back to.
  public init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Shop service.
  ///
  /// - Parameter apiKey: API key to use with the shop service.
  /// - Throws: If required information cannot be resolved.
  /// - Returns: Instance of the Shop service.
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
  /// - Parameter partner: Partner code under which we should conduct an operation.
  /// - Parameter location: Location code under which we should conduct an operation.
  /// - Parameter apiKey: API key under which we should conduct an operation.
  /// - Throws: If required information cannot be resolved. See `ShopClientError`.
  /// - Returns: Tuple of the `(partner, location, apiKey)` that should be used.
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

  /// Resolve partner and location context, throwing an error if it cannot be figured out, this time
  /// including a device name, where required.
  ///
  /// - Parameter partner: Partner code under which we should conduct an operation.
  /// - Parameter location: Location code under which we should conduct an operation.
  /// - Parameter deviceName: Name of the device, or serial number of the device, submitting
  ///   the retail shop operation to the server.
  /// - Parameter apiKey: API key under which we should conduct an operation.
  /// - Throws: If required information cannot be resolved. See `ShopClientError`.
  /// - Returns: Tuple of the `(partner, location, apiKey)` that should be used.
  private func resolveContext(_ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil,
                              _ deviceName: DeviceCode? = nil,
                              _ apiKey: APIKey? = nil) throws -> (
          partner: PartnerCode, location: LocationCode, apiKey: APIKey, deviceName: DeviceCode) {
    let partnerCode: PartnerCode? = partner ?? settings.partner
    let locationCode: LocationCode? = location ?? settings.location
    let deviceName: DeviceCode? = deviceName ?? settings.deviceUUID
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

    // validate device name
    guard deviceName != nil else {
      throw ShopClientError.invalidDeviceName
    }

    return (partner: partnerCode!, location: locationCode!, apiKey: apiKey!, deviceName: deviceName!)
  }

  //
  //
  // MARK: - Public API -
  //
  //

  // MARK: Shop Info

  /// Retrieve info about a particular storefront, specifically, its open/closed status, hours, and metadata.
  ///
  /// - Parameter partner: Partner code we should check current status for. Uses settings if unspecified.
  /// - Parameter location: Location code we should check current status for. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: Shop info response, if one could be resolved.
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
  /// - Parameter partner: Partner code we should check current status for. Uses settings if unspecified.
  /// - Parameter location: Location code we should check current status for. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Parameter callback: Callback to dispatch with the resulting information, or error.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: RPC call operation, which can be observed or used to cancel the call.
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
  /// - Parameter zipcode: Zip-code to check for delivery support.
  /// - Parameter partner: Partner code we should check zip-code status for. Uses settings if unspecified.
  /// - Parameter location: Location code we should check zip-code status for. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: Zipcode check response, if one could be resolved.
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
  /// - Parameter zipcode: Zip-code to check for delivery support.
  /// - Parameter partner: Partner code we should check zip-code status for. Uses settings if unspecified.
  /// - Parameter location: Location code we should check zip-code status for. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Parameter callback: Callback to dispatch with the resulting information, or error.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: RPC call operation, which can be observed or used to cancel the call.
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

  /// Verify a member account by their phone number. "Verify" in this context checks that they have a valid account,
  /// membership with the partner/location in question, and have no expired documents, like medical recommendations and
  /// IDs.
  ///
  /// - Parameter phone: Phone number to verify the user's account with.
  /// - Parameter partner: Partner code we should check for an account in. Uses settings if unspecified.
  /// - Parameter location: Location code we should check for an account in. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: Verification result, as a synchronous response.
  public func verifyMember(phone: PhoneNumber,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           apiKey: APIKey? = nil) throws -> VerifyMember.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).verifyMember(VerifyMember.Request.with { builder in
      builder.phone = phone
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /// Verify a member account by their email address. "Verify" in this context checks that they have a valid account,
  /// membership with the partner/location in question, and have no expired documents, like medical recommendations and
  /// IDs.
  ///
  /// - Parameter email: Email address to verify the user's account with.
  /// - Parameter partner: Partner code we should check for an account in. Uses settings if unspecified.
  /// - Parameter location: Location code we should check for an account in. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: Verification result, as a synchronous response.
  public func verifyMember(email: String,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           apiKey: APIKey? = nil) throws -> VerifyMember.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)
    let base64EncodedEmail = email.data(using: .utf8)!.base64EncodedString()

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

  /// Verify a member account, asynchronously, by their phone number. "Verify" in this context checks that they have a
  /// valid account, membership with the partner/location in question, and have no expired documents, like medical
  /// recommendations and IDs.
  ///
  /// - Parameter phone: Phone number to verify the user's account with.
  /// - Parameter partner: Partner code we should check for an account in. Uses settings if unspecified.
  /// - Parameter location: Location code we should check for an account in. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Parameter callback: Callback to dispatch with the resulting information, or error.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: RPC call operation, which can be observed or used to cancel the call.
  @discardableResult
  public func verifyMember(phone: PhoneNumber,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           apiKey: APIKey? = nil,
                           callback: @escaping VerifyMemberCallback) throws -> VerifyMemberCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).verifyMember(VerifyMember.Request.with { builder in
      builder.phone = phone
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

  /// Verify a member account, asynchronously, by their email address. "Verify" in this context checks that they have a
  /// valid account, membership with the partner/location in question, and have no expired documents, like medical
  /// recommendations and IDs.
  ///
  /// - Parameter email: Email address to verify the user's account with.
  /// - Parameter partner: Partner code we should check for an account in. Uses settings if unspecified.
  /// - Parameter location: Location code we should check for an account in. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Parameter callback: Callback to dispatch with the resulting information, or error.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: RPC call operation, which can be observed or used to cancel the call.
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

  /// Begin an enrollment flow for a new user account. In this flow, the user is only prompted for contact info and
  /// a first-name with which to address them. The enrollment proceeds, optionally, at the user's discretion,
  /// resumed by a tap on a texted link to their phone.
  ///
  /// If the user opts to proceed with enrollment, they are issued a digital card under their name to use for future
  /// checkins at supporting retail locations.
  ///
  /// - Parameter phone: Phone number to begin enrollment with.
  /// - Parameter name: Person's name, to address them with.
  /// - Parameter source: Source for this enrollment activity.
  /// - Parameter channel: Origin channel to assign to this enrollment record.
  /// - Parameter preOrder: Indicate that this enrollment is happening before an order.
  /// - Parameter partner: Partner code we should use for this enrollment record.
  /// - Parameter location: Location code we should use for this enrollment record.
  /// - Parameter deviceName: Name of the device that is signing up this user.
  /// - Parameter apiKey: API key to use for this operation.
  /// - Throws: Errors that occur client-side, see `ShopClientError`.
  /// - Returns: Result of the begin-enrollment call, as a synchronous response from the server.
  public func beginEnrollment(phone: PhoneNumber,
                              name: PersonName,
                              source: EnrollmentSource,
                              channel: String? = nil,
                              preOrder: Bool = false,
                              partner: PartnerCode? = nil,
                              location: LocationCode? = nil,
                              deviceName: DeviceCode? = nil,
                              apiKey: APIKey? = nil) throws -> EnrollMember.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).enrollMember(EnrollMember.Request.with { builder in
      builder.early = true
      builder.preOrder = preOrder
      builder.source = source
      if let c = channel {
        builder.channel = c
      }
      if let device = deviceName {
        builder.deviceID = device
      }
      builder.person = Person.with { builder in
        builder.name = name
      }
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /// Begin an enrollment flow for a new user account. In this flow, the user is only prompted for contact info and
  /// a first-name with which to address them. The enrollment proceeds, optionally, at the user's discretion,
  /// resumed by a tap on a texted link to their phone.
  ///
  /// If the user opts to proceed with enrollment, they are issued a digital card under their name to use for future
  /// checkins at supporting retail locations.
  ///
  /// - Parameter phone: Phone number to begin enrollment with.
  /// - Parameter name: Person's name, to address them with.
  /// - Parameter source: Source for this enrollment activity.
  /// - Parameter channel: Origin channel to assign to this enrollment record.
  /// - Parameter preOrder: Indicate that this enrollment is happening before an order.
  /// - Parameter partner: Partner code we should use for this enrollment record.
  /// - Parameter location: Location code we should use for this enrollment record.
  /// - Parameter deviceName: Name of the device that is signing up this user.
  /// - Parameter apiKey: API key to use for this operation.
  /// - Parameter callback: Callback to dispatch once the operation is complete, or errors.
  /// - Throws: Errors that occur client-side, see `ShopClientError`.
  /// - Returns: RPC call operation, which can be observed or used to cancel the call.
  @discardableResult
  public func beginEnrollment(phone: PhoneNumber,
                              name: PersonName,
                              source: EnrollmentSource,
                              channel: String? = nil,
                              preOrder: Bool = false,
                              partner: PartnerCode? = nil,
                              location: LocationCode? = nil,
                              deviceName: DeviceCode? = nil,
                              apiKey: APIKey? = nil,
                              callback: @escaping EnrollMemberCallback) throws -> EnrollMemberCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)
    return try self.service(apiKey).enrollMember(EnrollMember.Request.with { builder in
      builder.early = true
      builder.preOrder = preOrder
      builder.source = source
      if let c = channel {
        builder.channel = c
      }
      if let device = deviceName {
        builder.deviceID = device
      }
      builder.person = Person.with { builder in
        builder.name = name
      }
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    }) { (callResult, response) in

    }
  }

  // MARK: - Get Order

  /// Retrieve information about a previously-submitted pickup or delivery order. Includes status information and an
  /// action log.
  ///
  /// - Parameter id: ID with which to retrieve an order's status.
  /// - Parameter isLocal: Flag indicating whether the ID is a local order number, or a global ID.
  /// - Parameter partner: Partner code we should check for an order in. Uses settings if unspecified.
  /// - Parameter location: Location code we should check for an order in. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: Order result, as a synchronous response.
  public func getOrder(id: OrderID,
                       isLocal: Bool = false,
                       partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       apiKey: APIKey? = nil) throws -> GetOrder.Response {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).getOrder(GetOrder.Request.with { builder in
      if isLocal {
        builder.orderNumber = id
      } else {
        builder.orderID = id
      }
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
  /// - Parameter id: ID with which to retrieve an order's status.
  /// - Parameter isLocal: Flag indicating whether the ID is a local order number, or a global ID.
  /// - Parameter partner: Partner code we should check for an order in. Uses settings if unspecified.
  /// - Parameter location: Location code we should check for an order in. Uses settings if unspecified.
  /// - Parameter apiKey: API key we should use for this operation. Uses settings if unspecified.
  /// - Parameter callback: Callback to dispatch with the resulting information, or error.
  /// - Throws: If any required information is missing and cannot be resolved from settings.
  /// - Returns: RPC call operation, which can be observed or used to cancel the call.
  @discardableResult
  public func getOrder(id: OrderID,
                       isLocal: Bool = false,
                       partner: PartnerCode? = nil,
                       location: LocationCode? = nil,
                       apiKey: APIKey? = nil,
                       callback: @escaping GetOrderCallback) throws -> GetOrderCall {
    let (partnerCode, locationCode, apiKey) = try resolveContext(partner, location, apiKey)

    return try self.service(apiKey).getOrder(GetOrder.Request.with { builder in
      if isLocal {
        builder.orderNumber = id
      } else {
        builder.orderID = id
      }
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

  /// Submit a prepared order to the server for consideration for fulfillment. Order submitted via this
  /// endpoint are retail-commercial orders for a physically-present or digitally-present customer. The
  /// order is directed to the appropriate retail location, and the staff at that location are notified, via
  /// email/SMS/Web Dashboard. In some cases, order tickets may also print from on-site receipt
  /// printers, via Blomobox's integration with Google Cloud Print.
  ///
  /// In order to submit an order, a user must be enrolled and active, with a membership record
  /// present at the retail location at which the order is being submitted. At the time of order
  /// submission, the user must not have an expired ID or medical recommendation (if they are a
  /// medical patient), otherwise the order is rejected.
  ///
  /// - Parameter order: Digital order specification to submit on behalf of this user.
  /// - Parameter partner: Partner code under which to submit this digital order. If left
  ///   unspecified, settings are consulted.
  /// - Parameter location: Location code under which to submit this digital order. If left
  ///   unspecifeid, settings are consulted.
  /// - Parameter deviceName: Name or serial number of the device submitting the order.
  /// - Parameter apiKey: API key to use for this operation.
  /// - Throws: Client-side errors, if encountered (see `ShopClientError`).
  /// - Returns: Result of the order submission call, as a synchronous response.
  public func submitOrder(order: Order,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          deviceName: DeviceCode? = nil,
                          apiKey: APIKey? = nil) throws -> SubmitOrder.Response {
    let (partnerCode, locationCode, apiKey, deviceName) = try resolveContext(partner, location, deviceName, apiKey)

    return try self.service(apiKey).submitOrder(SubmitOrder.Request.with { builder in
      builder.order = order
      builder.device = deviceName
      builder.location = LocationKey.with { builder in
        builder.code = locationCode
        builder.partner = PartnerKey.with { builder in
          builder.code = partnerCode
        }
      }
    })
  }

  /// Submit a prepared order to the server for consideration for fulfillment. Order submitted via this
  /// endpoint are retail-commercial orders for a physically-present or digitally-present customer. The
  /// order is directed to the appropriate retail location, and the staff at that location are notified, via
  /// email/SMS/Web Dashboard. In some cases, order tickets may also print from on-site receipt
  /// printers, via Blomobox's integration with Google Cloud Print.
  ///
  /// In order to submit an order, a user must be enrolled and active, with a membership record
  /// present at the retail location at which the order is being submitted. At the time of order
  /// submission, the user must not have an expired ID or medical recommendation (if they are a
  /// medical patient), otherwise the order is rejected.
  ///
  /// - Parameter order: Digital order specification to submit on behalf of this user.
  /// - Parameter partner: Partner code under which to submit this digital order. If left
  ///   unspecified, settings are consulted.
  /// - Parameter location: Location code under which to submit this digital order. If left
  ///   unspecifeid, settings are consulted.
  /// - Parameter deviceName: Name or serial number of the device submitting the order.
  /// - Parameter apiKey: API key to use for this operation.
  /// - Throws: Client-side errors, if encountered (see `ShopClientError`).
  /// - Returns: RPC call operation, which can be observed or used to cancel the call.
  @discardableResult
  public func submitOrder(order: Order,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          deviceName: DeviceCode? = nil,
                          apiKey: APIKey? = nil,
                          callback: @escaping SubmitOrderCallback) throws -> SubmitOrderCall {
    let (partnerCode, locationCode, apiKey, deviceName) = try resolveContext(partner, location, deviceName, apiKey)

    return try self.service(apiKey).submitOrder(SubmitOrder.Request.with { builder in
      builder.order = order
      builder.device = deviceName
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
