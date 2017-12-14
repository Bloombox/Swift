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
public typealias ShopPing = Services_Shop_V1_Ping
public typealias ShopPingCall = Services_Shop_V1_ShopPingCall

/**
 * Method: `shopInfo`.
 */
public typealias ShopInfo = Services_Shop_V1_ShopInfo
public typealias ShopInfoCall = Services_Shop_V1_ShopShopInfoCall

/**
 * Method: `checkZipcode`.
 */
public typealias CheckZipcode = Services_Shop_V1_CheckZipcode
public typealias CheckZipcodeCall = Services_Shop_V1_ShopCheckZipcodeCall

/**
 * Method: `verifyMember`.
 */
public typealias VerifyMember = Services_Shop_V1_VerifyMember
public typealias VerifyMemberCall = Services_Shop_V1_ShopVerifyMemberCall

/**
 * Method: `enrollMember`.
 */
public typealias EnrollMember = Services_Shop_V1_EnrollMember
public typealias EnrollMemberCall = Services_Shop_V1_ShopEnrollMemberCall

/**
 * Method: `getOrder`.
 */
public typealias GetOrder = Services_Shop_V1_GetOrder
public typealias GetOrderCall = Services_Shop_V1_ShopGetOrderCall

/**
 * Method: `submitOrder`.
 */
public typealias SubmitOrder = Services_Shop_V1_SubmitOrder
public typealias SubmitOrderCall = Services_Shop_V1_ShopSubmitOrderCall


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


//// Objects

public typealias User = Identity_User
public typealias Order = Commerce_Order
public typealias UserKey = Identity_UserKey
public typealias OrderKey = Commerce_OrderKey
public typealias PartnerKey = Partner_PartnerKey
public typealias PartnerDeviceKey = Partner_PartnerDeviceKey
public typealias PartnerLocationKey = Partner_PartnerLocationKey
public typealias AnalyticsContext = Analytics_Context
public typealias AnalyticsScope = Analytics_Scope
public typealias AnalyticsCollection = Analytics_Context_Collection
public typealias LibraryContext = Analytics_Context_DeviceLibrary
public typealias ApplicationContext = Analytics_Context_DeviceApplication
public typealias NativeDeviceContext = Analytics_Context_NativeDeviceContext
public typealias APIClient = Analytics_Context_APIClient
public typealias EventType = Analytics_Context_EventType
public typealias MenuSection = Products_Menu_Section_Section
public typealias VersionSpec = Structs_VersionSpec
