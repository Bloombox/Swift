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
typealias Shop = Services_Shop_V1_ShopService

/**
 * Method: `shopInfo`.
 */
typealias ShopInfo = Services_Shop_V1_ShopInfo

/**
 * Method: `checkZipcode`.
 */
typealias CheckZipcode = Services_Shop_V1_CheckZipcode

/**
 * Method: `verifyMember`.
 */
typealias VerifyMember = Services_Shop_V1_VerifyMember

/**
 * Method: `enrollMember`.
 */
typealias EnrollMember = Services_Shop_V1_EnrollMember

/**
 * Method: `getOrder`.
 */
typealias GetOrder = Services_Shop_V1_GetOrder

/**
 * Method: `submitOrder`.
 */
typealias SubmitOrder = Services_Shop_V1_SubmitOrder


//// Telemetry Service

/**
 * Binding to the active EventTelemetryService.
 */
typealias EventTelemetry = Services_Telemetry_V1Beta3_EventTelemetryService

/**
 * Method: `ping`.
 */
typealias TelemetryPing = Services_Telemetry_V1beta3_TelemetryPing

/**
 * Method: `event`.
 */
typealias TelemetryEvent = Services_Telemetry_V1beta3_Event

/**
 * Method: `error`.
 */
typealias TelemetryException = Services_Telemetry_V1beta3_Exception

/**
 * Enumerated errors from EventTelemetryService.
 */
typealias EventTelemetryClientError =  Services_Telemetry_V1Beta3_EventTelemetryClientError
