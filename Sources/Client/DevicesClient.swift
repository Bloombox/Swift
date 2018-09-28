//
//  DevicesClient.swift
//  Client
//
//  Created by James Clark on 3/31/18.
//

import Foundation
import gRPC


// Callback Types
public typealias DeviceSerial = String
public typealias DeviceFingerprint = String
public typealias DeviceActivateCallback = (CallResult?, DeviceActivation.Response?, Error?) -> ()


/**
 * Apply RPC Service compliance to the Device Service.
 */
extension DevicesService: RPCService {}


/**
 * Enumerates code-level errors in the device client.
 */
public enum DevicesClientError: Error {
  case invalidPartnerCode
  case invalidLocationCode
  case invalidApiKey
  case unknown
}


/**
 * Provides functionality for the Device API, which supports operations related to activating,
 * coordinating, managing, and observing managed or second-party-colocated devices.
 */
public final class DevicesClient: RemoteService {
  /**
   * Name of the Device API, which is "devices".
   */
  let name = "devices"

  /**
   * Version of this service.
   */
  let version = "v1beta1"

  // MARK: Internals

  /**
   * Client-wide settings.
   */
  internal let settings: Bloombox.Settings

  /**
   * Library-internal initializer.
   */
  public init(settings: Bloombox.Settings) {
    self.settings = settings
  }

  /**
   * Devices service.
   */
  internal func service(_ apiKey: APIKey) -> DevicesService {
    let svc = RPCServiceFactory<DevicesService>.factory(forService: Transport.config.services.devices)
    svc.metadata.add(key: "x-api-key", value: apiKey)
    return svc
  }

  /**
   * Resolve method context, throwing an error if it cannot be figured out.
   */
  private func resolveContext(_ apiKey: APIKey? = nil) throws -> APIKey {
    let apiKey: APIKey? = apiKey ?? settings.apiKey

    guard apiKey != nil else {
      throw DevicesClientError.invalidApiKey
    }
    return apiKey!
  }

  /**
   * Prepare the shop service for use.
   */
  func prepare() {
  }

  // MARK: - Public API -

  // MARK: Device Activation
  /**
   * Activate a device by name.
   */
  public func activate(deviceSerial name: DeviceSerial,
                       withFingerprint fingerprint: DeviceFingerprint,
                       authorizedBy apiKey: APIKey? = nil) throws -> DeviceActivation.Response {
    let service = self.service(try resolveContext(apiKey))

    do {
      return try service.activate(DeviceActivation.Request.with { builder in
        builder.serial = name
        builder.fingerprint = fingerprint
      })
    } catch DevicesRPCError.invalidMessageReceived {
      print("error: invalid message")
      throw DevicesRPCError.invalidMessageReceived

    } catch DevicesRPCError.endOfStream {
      print("error: unexpected end of stream")
      throw DevicesRPCError.endOfStream

    } catch DevicesRPCError.error(let result) {
      print("error: got result \(result)")
      throw DevicesRPCError.error(c: result)

    } catch {
      print("error: unknown error occurred")
      throw DevicesClientError.unknown
    }
  }

  /**
   * Activate a device by name, asynchronously.
   */
  public func activate(deviceSerial name: DeviceSerial,
                       withFingerprint fingerprint: DeviceFingerprint,
                       authorizedBy apiKey: APIKey? = nil,
                       _ callback: @escaping DeviceActivateCallback) throws -> DeviceActivateCall {
    let service = self.service(try resolveContext(apiKey))

    return try service.activate(DeviceActivation.Request.with { builder in
      builder.serial = name
      builder.fingerprint = fingerprint
    }) { (response, callResult) in
      callback(callResult, response, nil)
    }
  }
}
