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

/// Device serial number.
public typealias DeviceSerial = String

/// Device public key, in raw hex-encoded form.
public typealias DevicePublicKey = String

/// Hardware fingerprint value, usually a UUID.
public typealias DeviceFingerprint = String

// Callback Types

/// Callback type definition for a device activation operation, where a partner co-located device provides its serial
/// number and hardware fingerprint, in exchange for an assignment manifest describing the device's partner, location,
/// and operating role. The callback accepts 3 parameters and no return value is expected.
///
/// - Parameters:
///    - `CallResult`: gRPC call result object, which includes a status code.
///    - `DeviceActivation.Response?`: If the call succeeded, a device activation response, including a manifest.
///    - `Error?`: If an error occurred before request transmission, or server-side, it is provided here.
public typealias DeviceActivateCallback = (CallResult?, DeviceActivation.Response?, Error?) -> ()


/// Enumerates code-level errors in the device client.
public enum DevicesClientError: Error {
  /// No partner code could be resolved, or the given partner code was invalid.
  case invalidPartnerCode

  /// No location code could be resolved, or the given location code was invalid.
  case invalidLocationCode

  /// No API key could be resolved, or the given API key was invalid.
  case invalidApiKey

  /// An unknown client-side error occurred.
  case unknown
}

/// Provides functionality for the Device API, which supports operations related to activating, coordinating, managing,
/// and observing managed or second-party-colocated devices. This includes tablet and TV menus, checkin devices, and
/// point-of-sale devices, from Bloombox's point of view, along with any additional partner-hosted devices eventually
/// provided to retailers.
///
/// The main function of the Devices API is to supply partner-side devices with their "assignment" information, which
/// consists of a "partner" and "location" code, which combine to reference the retail location for which the device
/// should boot and begin its work. Menus use this to know which menu catalog to download, checkin uses this to
/// determine which lobby to check-in users to, and so on.
public final class DevicesClient: RemoteService {
  /// Name of the Device API, which is "devices".
  let name = "devices"

  /// Version of this service.
  let version = "v1beta1"

  // MARK: Internals

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Low-level devices service.
  internal var svc: DevicesService?

  /// Library-internal initializer.
  ///
  /// - Parameter settings: Client-wide settings to apply.
  internal init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /// Devices service. Retrieve an implementation of the devices service, capable of communicating with server-side
  /// methods for managing devices.
  ///
  /// - Parameter apiKey: API Key to use.
  /// - Parameter settings: Combined settings to use.
  /// - Returns: Prepared Devices API service class.
  /// - Throws: Client-side errors. See: `DevicesClientError`.
  private func service(_ apiKey: APIKey) throws -> DevicesService {
    if let s = self.svc {
      return s
    }
    let svc = RPCServiceFactory<DevicesService>.factory(
      forService: Transport.config.services.devices,
      withSettings: self.settings)

    try svc.metadata.add(key: "x-api-key", value: apiKey)
    self.svc = svc
    return svc
  }

  /// Resolve method context, throwing an error if it cannot be figured out. Where devices are concerned, this only
  /// includes the API key with which we should connect to the service.
  ///
  /// - Parameter apiKey: API key to connect to the service with.
  /// - Returns: API key to use, based either on the override or library-default value.
  /// - Throws: Client-side errors. See: `DevicesClientError`.
  private func resolveContext(_ apiKey: APIKey? = nil) throws -> APIKey {
    let apiKey: APIKey? = apiKey ?? settings.apiKey

    guard apiKey != nil else {
      throw DevicesClientError.invalidApiKey
    }
    return apiKey!
  }

  // MARK: - Public API -

  // MARK: Device Activation

  /// Activate a device by name. Given the device's serial number ("name"), this returns any active assignment
  /// information, which includes the device's operating role, and the partner and location account codes under which
  /// the device should operate. How these values are used is determined by the device performing activation.
  ///
  /// - Parameter name: Device serial number, usually referred to as the "device name."
  /// - Parameter fingerprint: Unique hardware fingerprint for this device.
  /// - Parameter publicKey: Device's identity public key, used to authenticate messages received from this device.
  /// - Parameter apiKey: Override the API key set in library defaults.
  /// - Returns: Device activation response. This method is synchronous, so a response is returned directly.
  /// - Throws: `DevicesClientError` codes related to the API key or other circumstances.
  public func activate(deviceSerial name: DeviceSerial,
                       withFingerprint fingerprint: DeviceFingerprint? = nil,
                       withPublicKey publicKey: DevicePublicKey? = nil,
                       authorizedBy apiKey: APIKey? = nil) throws -> DeviceActivation.Response {
    let service = try self.service(try resolveContext(apiKey))

    return try service.activate(DeviceActivation.Request.with { builder in
      builder.serial = name

      if let f = fingerprint {
        builder.fingerprint = f
      }
      if let p = publicKey {
        builder.publicKey = p
      }
    })
  }

  /// Activate a device by name, asynchronously. Given the device's serial number ("name"), this returns any active
  /// assignment information, which includes the device's operating role, and the partner and location account codes
  /// under which the device should operate. How these values are used is determined by the device performing
  /// activation.
  ///
  /// - Parameter name: Device serial number, usually referred to as the "device name."
  /// - Parameter fingerprint: Unique hardware fingerprint for this device.
  /// - Parameter publicKey: Device's identity public key, used to authenticate messages received from this device.
  /// - Parameter apiKey: Override the API key set in library defaults.
  /// - Parameter callback: Callable to dispatch once either a response or terminal error is available.
  /// - Returns: RPC call object, which can be observed or cancelled.
  /// - Throws: `DevicesClientError` codes related to the API key or other circumstances.
  @discardableResult
  public func activate(deviceSerial name: DeviceSerial,
                       withFingerprint fingerprint: DeviceFingerprint? = nil,
                       withPublicKey publicKey: DevicePublicKey? = nil,
                       authorizedBy apiKey: APIKey? = nil,
                       _ callback: @escaping DeviceActivateCallback) throws -> DeviceActivateCall {
    let service = try self.service(try resolveContext(apiKey))

    return try service.activate(DeviceActivation.Request.with { builder in
      builder.serial = name

      if let f = fingerprint {
        builder.fingerprint = f
      }
      if let p = publicKey {
        builder.publicKey = p
      }
    }) { (response, callResult) in
      callback(callResult, response, nil)
    }
  }

}
