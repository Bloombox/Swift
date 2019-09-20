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


// Type Aliases
public typealias CheckinCallback = (CallResult, CheckinResponse?) -> ()
public typealias CheckinAPIContext = (partner: PartnerCode, location: LocationCode, deviceName: String, apiKey: APIKey)

// Callback Types


/// Enumerates code-level errors in the device client.
public enum CheckinClientError: Error {
  /// No partner code could be resolved, or the given partner code was invalid.
  case invalidPartnerCode

  /// No location code could be resolved, or the given location code was invalid.
  case invalidLocationCode

  /// No API key could be resolved, or the given API key was invalid.
  case invalidApiKey

  /// No device name was provided, or the provided device name was invalid..
  case invalidDeviceName

  /// An unknown client-side error occurred.
  case unknown
}


/// Provides functionality for the Checkin API, which allows users to check-in to a retial dispensary location with
/// their government-issued ID, or a Bloombox-issued digital checkin card, branded for the retailer. This includes
/// lobby-based checkin devices and tablet menu devices with personalization features enabled.
///
/// The main function of this API is checking the user into the location at which they are physically present. This
/// produces a (limited) user record an matching authentication token, which can be used by a managed device
/// to perform the following subsequent activities:
/// - Submit an order, of type `ONSITE`
/// - Check on an order, of type `ONSITE` or `PICKUP`
/// - Submit attributed profile events
/// - Retrieve personalized menus
///
/// These activities, where applicable and/or available, are provided by other API interfaces.
public final class CheckinClient: RemoteService {
  /// Name of the Checkin API, which is "checkin".
  let name = "checkin"

  /// Version of this service.
  let version = "v1beta1"

  // MARK: Internals

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Low-level checkin service.
  internal var svc: CheckinService?

  /// Library-internal initializer.
  ///
  /// - Parameter settings: Client-wide settings to apply.
  internal init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Checkin service. Retrieve an implementation of the checkin service, capable of checking a user
  /// in when they are physically present at a device located at a brick-and-mortar retail location.
  ///
  /// - Parameter apiKey: API key to use.
  /// - Parameter settings: Combined settings to use.
  /// - Returns: Prepared Checkin API service class.
  /// - Throws: Client-side errors. See: `CheckinClientError`.
  private func service(_ apiKey: APIKey) throws -> CheckinService {
    if let s = self.svc {
      return s
    }
    let svc = RPCServiceFactory<CheckinService>.factory(
      forService: Transport.config.services.checkin,
      withSettings: self.settings)

    try svc.metadata.add(key: "x-api-key", value: apiKey)
    self.svc = svc
    return svc
  }

  /// Resolve an API key, and partner/location context, throwing an error if it cannot be figured out. These items are
  /// required for all calls to the Checkin API. Check library defaults and fall back to them if overrides are not given.
  ///
  /// - Parameter deviceName: Name of the device checking the user in.
  /// - Parameter partner: Partner account code to use.
  /// - Parameter location: Location account code to use.
  /// - Parameter apiKey: API key to use with the service.
  /// - Returns: Tuple of partner, location, and API key to use.
  /// - Throws: `CheckinClientError` codes if items cannot be resolved.
  private func resolveContext(_ deviceName: String? = nil,
                              _ partner: PartnerCode? = nil,
                              _ location: LocationCode? = nil,
                              _ apiKey: APIKey? = nil) throws -> CheckinAPIContext {
    let partnerCode: PartnerCode? = partner ?? settings.partner
    let locationCode: LocationCode? = location ?? settings.location
    let apiKey: APIKey? = apiKey ?? settings.apiKey

    guard apiKey != nil else {
      throw MenuClientError.invalidApiKey
    }

    // check partnership scope
    guard partnerCode != nil, locationCode != nil else {
      // throw error: we require both values for all checkin ops
      if partnerCode == nil {
        throw CheckinClientError.invalidPartnerCode
      }
      throw CheckinClientError.invalidLocationCode
    }

    // check device name
    guard deviceName != nil && !deviceName!.isEmpty else {
      throw CheckinClientError.invalidDeviceName
    }
    return (
      partner: partnerCode!,
      location: locationCode!,
      deviceName: deviceName!,
      apiKey: apiKey!)
  }

  // MARK: - Public API -

  // MARK: ID Checkin

  /// Submits a request to check a user into a physical retail location, at which they are physically present, attesting
  /// to their identity with a government-issued identification credential in their posession. This method should be
  /// used to submit the information scanned or read from the ID. The response given should govern the subsequent
  /// behavior of a device used to control the retail check-in flow - as in, warnings from the response should be
  /// adhered to, because they signify mismatches or invalid information server-side, which must be corrected either
  /// by the user or staff.
  ///
  /// This method operates synchronously. For async operation, see the matching method by the same name on this
  /// API interface.
  ///
  /// - Parameter scan: Scanned value from the card. If binary data is specified, it must be base64-encoded.
  /// - Parameter partner: Partner to use for this check-in request. If unspecified, settings are consulted.
  /// - Parameter location: Location at which to checkin the user. If unspecified, settings are consulted.
  /// - Parameter deviceName: Serial number or name of the managed device checking the user in.
  /// - Parameter fingerprint: Unique hardware fingerprint assigned to the specified managed device.
  /// - Parameter apiKey: API key to use for this operation. If unspecified, settings are consulted.
  /// - Returns: Checkin operation result, from the server, as a synchronous response.
  /// - Throws: Client-side errors only. Server-side errors are surfaced in the callback.
  public func checkinByID(scan: String,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          deviceName: String? = nil,
                          fingerprint: String? = nil,
                          apiKey: APIKey? = nil) throws -> CheckinResponse {
    let (partnerCode, locationCode, deviceName, apiKey) = try resolveContext(partner, location, deviceName, apiKey)
    let service = try self.service(apiKey)

    return try service.identification(CheckinByID.Request.with { builder in
      builder.raw = scan
      builder.serialNumber = deviceName
      builder.scope = "partner/\(partnerCode)/location/\(locationCode)"
      if let f = fingerprint {
        builder.fingerprint = f
      }
    })
  }

  /// Submits a request to check a user into a physical retail location, at which they are physically present, attesting
  /// to their identity with a government-issued identification credential in their posession. This method should be
  /// used to submit the information scanned or read from the ID. The response given should govern the subsequent
  /// behavior of a device used to control the retail check-in flow - as in, warnings from the response should be
  /// adhered to, because they signify mismatches or invalid information server-side, which must be corrected either
  /// by the user or staff.
  ///
  /// This method operates asynchronously. See the other method, by the same name, which operates synchronously
  /// by waiting for, and then returning, a response (if needed).
  ///
  /// - Parameter scan: Scanned value from the card. If binary data is specified, it must be base64-encoded.
  /// - Parameter partner: Partner to use for this check-in request. If unspecified, settings are consulted.
  /// - Parameter location: Location at which to checkin the user. If unspecified, settings are consulted.
  /// - Parameter deviceName: Serial number or name of the managed device checking the user in.
  /// - Parameter fingerprint: Unique hardware fingerprint assigned to the specified managed device.
  /// - Parameter apiKey: API key to use for this operation. If unspecified, settings are consulted.
  /// - Returns: RPC call object, which can be observed to track call status, or used to cancel the call.
  /// - Throws: Client-side errors only. Server-side errors are surfaced in the callback.
  public func checkinByID(scan: String,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          deviceName: String? = nil,
                          fingerprint: String? = nil,
                          apiKey: APIKey? = nil,
                          callback: @escaping CheckinCallback) throws -> CheckinByIDCall {
    let (partnerCode, locationCode, deviceName, apiKey) = try resolveContext(partner, location, deviceName, apiKey)

    return try self.service(apiKey).identification(CheckinByID.Request.with { builder in
      builder.raw = scan
      builder.serialNumber = deviceName
      builder.scope = "partner/\(partnerCode)/location/\(locationCode)"
      if let f = fingerprint {
        builder.fingerprint = f
      }
    }) { (response, callResult) in
      callback(callResult, response)
    }
  }

  // MARK: Digital Checkin

  /// Submits a request to check a user into a physical retial location, at which they are physically present, attesting
  /// to their identity with a digital card, issued to them by Bloombox after previously verifying their identity through
  /// a qualified retail partner. This method should be used to submit the information scanned or read from the
  /// digital card, verbatim, and the response given should govern the subsequent behavior of a device used to
  /// control the check-in flow - as in, warnings from the response should be heeded, because they signify mismatches
  /// or invalid information server-side, which must be corrected either by the user or staff.
  ///
  /// This method operates synchronously. For async operation, see the matching method of the same name on this
  /// API interface.
  ///
  /// - Parameter cardType: Type of card being used for check-in. Reverse-domain style.
  /// - Parameter payload: Payload specified on the card, verbatim, encoded in base64.
  /// - Parameter signature: Hex-encoded payload signature, if present.
  /// - Parameter partner: Partner ID to use for this checkin flow. If unspecified, settings are consulted.
  /// - Parameter location: Location at which to checkin the user. If unspecified, settings are consulted.
  /// - Returns: Checkin operation result, as a synchronous response from the server.
  /// - Throws: Client-side errors only. Server-side errors are surfaced in the callback.
  public func checkinByCard(cardType: String,
                            payload: String,
                            signature: String? = nil,
                            partner: PartnerCode? = nil,
                            location: LocationCode? = nil,
                            deviceName: String? = nil,
                            apiKey: APIKey? = nil) throws -> CheckinResponse {
    let (partnerCode, locationCode, deviceName, apiKey) = try resolveContext(partner, location, deviceName, apiKey)
    let service = try self.service(apiKey)

    return try service.card(CheckinByCard.Request.with { builder in
      builder.cardType = cardType
      builder.payload = payload
      builder.agent = deviceName
      builder.scope = "partner/\(partnerCode)/location/\(locationCode)"
      if let s = signature {
        builder.signature = s
      }
    })
  }

  /// Submits a request to check a user into a physical retial location, at which they are physically present, attesting
  /// to their identity with a digital card, issued to them by Bloombox after previously verifying their identity through
  /// a qualified retail partner. This method should be used to submit the information scanned or read from the
  /// digital card, verbatim, and the response given should govern the subsequent behavior of a device used to
  /// control the check-in flow - as in, warnings from the response should be heeded, because they signify mismatches
  /// or invalid information server-side, which must be corrected either by the user or staff.
  ///
  /// This method operates asynchronously. See the other method, by the same name, which operates synchronously
  /// by waiting for, and then returning, a response (if needed).
  ///
  /// - Parameter cardType: Type of card being used for check-in. Reverse-domain style.
  /// - Parameter payload: Payload specified on the card, verbatim, encoded in base64.
  /// - Parameter signature: Hex-encoded payload signature, if present.
  /// - Parameter partner: Partner ID to use for this checkin flow. If unspecified, settings are consulted.
  /// - Parameter location: Location at which to checkin the user. If unspecified, settings are consulted.
  /// - Returns: RPC call object, which can be observed to track call status, or used to cancel the call.
  /// - Throws: Client-side errors only. Server-side errors are surfaced in the callback.
  public func checkinByCard(cardType: String,
                            payload: String,
                            signature: String? = nil,
                            partner: PartnerCode? = nil,
                            location: LocationCode? = nil,
                            deviceName: String? = nil,
                            apiKey: APIKey? = nil,
                            callback: @escaping CheckinCallback) throws -> CheckinByCardCall {
    let (partnerCode, locationCode, deviceName, apiKey) = try resolveContext(partner, location, deviceName, apiKey)

    return try self.service(apiKey).card(CheckinByCard.Request.with { builder in
      builder.cardType = cardType
      builder.payload = payload
      builder.agent = deviceName
      builder.scope = "partner/\(partnerCode)/location/\(locationCode)"
      if let s = signature {
        builder.signature = s
      }
    }) { (response, callResult) in
      callback(callResult, response)
    }
  }
}
