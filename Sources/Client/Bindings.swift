//
//  Bindings.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import Schema


//// Shop Service

/**
 * Binding to the active ShopService.
 */
public typealias Shop = Services_Shop_V1_ShopService

/**
 * Method `ping`.
 */
public typealias Ping = Services_Shop_V1_Ping

/**
 * Method: `shopInfo`.
 */
public typealias ShopInfo = Services_Shop_V1_ShopInfo

/**
 * Method: `checkZipcode`.
 */
public typealias CheckZipcode = Services_Shop_V1_CheckZipcode

/**
 * Method: `verifyMember`.
 */
public typealias VerifyMember = Services_Shop_V1_VerifyMember

/**
 * Method: `enrollMember`.
 */
public typealias EnrollMember = Services_Shop_V1_EnrollMember

/**
 * Method: `getOrder`.
 */
public typealias GetOrder = Services_Shop_V1_GetOrder

/**
 * Method: `submitOrder`.
 */
public typealias SubmitOrder = Services_Shop_V1_SubmitOrder


//// Telemetry Service

/**
 * Binding to the active EventTelemetryService.
 */
public typealias EventTelemetry = Services_Telemetry_V1Beta3_EventTelemetryService

/**
 * Method: `ping`.
 */
public typealias TelemetryPing = Services_Telemetry_V1beta3_TelemetryPing

/**
 * Method: `event`.
 */
public typealias TelemetryEvent = Services_Telemetry_V1beta3_Event

/**
 * Method: `batch`.
 */
public typealias TelemetryEventBatch = Services_Telemetry_V1beta3_Event_Batch
public typealias TelemetryEventBatchRequest = Services_Telemetry_V1beta3_Event_BatchRequest

/**
 * Method: `error`.
 */
public typealias TelemetryException = Services_Telemetry_V1beta3_Exception

/**
 * Enumerated errors from EventTelemetryService.
 */
public typealias EventTelemetryClientError = Services_Telemetry_V1Beta3_EventTelemetryClientError
