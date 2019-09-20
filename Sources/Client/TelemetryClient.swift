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


// Callback Types

/// Specifies a callback for a `ping` operation. It is passed one parameter, which is the observed latency of PING to
/// PONG.
public typealias PingCallback = (Double) -> ()

/// Specifies a callback for an `event` submission operation. It is passed two parameters - the call result object, and
/// the telemetry response.
public typealias GenericEventCallback = (CallResult) -> ()


/// Enumerates errors that may be thrown when resolving basic event context.
public enum EventContextError: Error {
  /// Failed to resolve the partner code, or it was deemed invalid, when it was required.
  case invalidPartnerCode

  /// Failed to resolve the location code, or it was deemed invalid, when it was required.
  case invalidLocationCode

  /// Failed to resolve the device code, or it was deemed invalid, when it was required.
  case invalidDeviceCode

  /// Failed to resolve a valid API key, when it was required.
  case invalidApiKey

  /// An unspecified internal error occurred.
  case internalError
}


// MARK: Telemetry Service

/// Provides functionality for the Telemetry API, which supports sending event analytics data as it happens, to be
/// recorded and stored, and later analyzed.
public class TelemetryClient: RemoteService {
  /// Name of the telemtry service, which is "telemetry."
  let name = "telemetry"

  /// Version of this service with which we intend to communicate.
  let version = "v1beta4"

  // MARK: Internals

  /// Generic event telemetry service.
  internal let events: EventTelemetry

  /// Commercial event telemetry service.
  internal let commercial: CommercialTelemetry

  /// Search event telemetry service.
  internal let search: SearchTelemetry

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Library-internal initializer.
  public init(settings: Bloombox.Settings) {
    self.settings = settings

    // initialize events service
    events = RPCServiceFactory<EventTelemetry>.factory(
      forService: Transport.config.services.telemetry,
      withSettings: self.settings)

    // initialize commercial events service
    commercial = RPCServiceFactory<CommercialTelemetry>.factory(
      forService: Transport.config.services.telemetry,
      withSettings: self.settings)

    // initialize search events service
    search = RPCServiceFactory<SearchTelemetry>.factory(
      forService: Transport.config.services.telemetry,
      withSettings: self.settings)
  }

  /// Resolve partner and location context, throwing an error if it cannot be figured out, this time
  /// including a device name, where required.
  ///
  /// - Parameter partner: Partner code under which we should conduct an operation.
  /// - Parameter location: Location code under which we should conduct an operation.
  /// - Parameter deviceName: Name of the device, or serial number of the device, submitting
  ///   the retail shop operation to the server.
  /// - Parameter apiKey: API key under which we should conduct an operation.
  /// - Throws: If required information cannot be resolved. See `EventContextError`.
  /// - Returns: Tuple of the `(partner, location, apiKey, deviceName)` that should be used.
  internal func resolveContext(_ partner: PartnerCode? = nil,
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
      throw EventContextError.invalidApiKey
    }

    // validate partner and location codes
    guard partnerCode != nil, locationCode != nil else {
      // throw error: we require a partner or location code from somewhere
      if partnerCode == nil {
        throw EventContextError.invalidPartnerCode
      }
      throw EventContextError.invalidLocationCode
    }

    // validate device name
    guard deviceName != nil else {
      throw EventContextError.invalidDeviceCode
    }

    return (partner: partnerCode!, location: locationCode!, apiKey: apiKey!, deviceName: deviceName!)
  }
}
