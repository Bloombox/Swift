//
//  Bindings.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import Schema
import SwiftProtobuf


//// Shop Service

/**
 * Binding to the active ShopService.
 */
public typealias ShopService = Bloombox_Schema_Services_Shop_V1_ShopService

// Error Types
public typealias ShopRPCError = Bloombox_Schema_Services_Shop_V1_ShopClientError
public typealias VerifyError = Bloombox_Schema_Services_Shop_V1_VerifyError
public typealias EnrollmentError = Bloombox_Schema_Services_Shop_V1_EnrollmentError

/**
 * Method `ping`.
 */
public typealias ShopPing = Bloombox_Schema_Services_Shop_V1_Ping
public typealias ShopPingCall = Bloombox_Schema_Services_Shop_V1_ShopPingCall

/**
 * Method: `shopInfo`.
 */
public typealias ShopInfo = Bloombox_Schema_Services_Shop_V1_ShopInfo
public typealias ShopInfoCall = Bloombox_Schema_Services_Shop_V1_ShopShopInfoCall

/**
 * Method: `checkZipcode`.
 */
public typealias CheckZipcode = Bloombox_Schema_Services_Shop_V1_CheckZipcode
public typealias CheckZipcodeCall = Bloombox_Schema_Services_Shop_V1_ShopCheckZipcodeCall

/**
 * Method: `verifyMember`.
 */
public typealias VerifyMember = Bloombox_Schema_Services_Shop_V1_VerifyMember
public typealias VerifyMemberCall = Bloombox_Schema_Services_Shop_V1_ShopVerifyMemberCall

/**
 * Method: `enrollMember`.
 */
public typealias EnrollMember = Bloombox_Schema_Services_Shop_V1_EnrollMember
public typealias EnrollMemberCall = Bloombox_Schema_Services_Shop_V1_ShopEnrollMemberCall

/**
 * Method: `getOrder`.
 */
public typealias GetOrder = Bloombox_Schema_Services_Shop_V1_GetOrder
public typealias GetOrderCall = Bloombox_Schema_Services_Shop_V1_ShopGetOrderCall

/**
 * Method: `submitOrder`.
 */
public typealias SubmitOrder = Bloombox_Schema_Services_Shop_V1_SubmitOrder
public typealias SubmitOrderCall = Bloombox_Schema_Services_Shop_V1_ShopSubmitOrderCall


//// Telemetry Service

/**
 * Binding to the active EventTelemetryService.
 */
public typealias EventTelemetry = Bloombox_Schema_Services_Telemetry_V1Beta3_EventTelemetryService

/**
 * Method: `ping`.
 */
public typealias TelemetryPing = Bloombox_Schema_Services_Telemetry_V1beta3_TelemetryPing

/**
 * Method: `event`.
 */
public typealias TelemetryEvent = Bloombox_Schema_Services_Telemetry_V1beta3_Event
public typealias TelemetryEventCall = Bloombox_Schema_Services_Telemetry_V1Beta3_EventTelemetryEventCall

/**
 * Method: `batch`.
 */
public typealias TelemetryEventBatch = Bloombox_Schema_Services_Telemetry_V1beta3_Event_Batch
public typealias TelemetryEventBatchRequest = Bloombox_Schema_Services_Telemetry_V1beta3_Event_BatchRequest

/**
 * Method: `error`.
 */
public typealias TelemetryException = Bloombox_Schema_Services_Telemetry_V1beta3_Exception

/**
 * Enumerated errors from EventTelemetryService.
 */
public typealias EventTelemetryClientError = Bloombox_Schema_Services_Telemetry_V1Beta3_EventTelemetryClientError


//// Menu Service

/**
 * Binding to the active MenuService.
 */
public typealias MenuService = Bloombox_Schema_Services_Menu_V1Beta1_MenuService
public typealias MenuRPCError = Bloombox_Schema_Services_Menu_V1Beta1_MenuClientError

/**
 * Method: `ping`.
 */
public typealias MenuPing = Bloombox_Schema_Services_Menu_V1beta1_Ping
public typealias MenuPingCall = Bloombox_Schema_Services_Menu_V1Beta1_MenuPingCall

/**
 * Method: `retrieve`.
 */
public typealias GetMenu = Bloombox_Schema_Services_Menu_V1beta1_GetMenu
public typealias GetMenuCall = Bloombox_Schema_Services_Menu_V1Beta1_MenuRetrieveCall


//// Objects
public typealias User = Bloombox_Schema_Identity_User
public typealias UserKey = Bloombox_Schema_Identity_UserKey
public typealias PartnerKey = Bloombox_Schema_Partner_PartnerKey
public typealias PartnerDeviceKey = Bloombox_Schema_Partner_PartnerDeviceKey
public typealias PartnerLocationKey = Bloombox_Schema_Partner_PartnerLocationKey
public typealias Event = Bloombox_Schema_Services_Telemetry_V1beta3_Event
public typealias GenericEvent = Bloombox_Schema_Analytics_Generic_Event
public typealias AnalyticsContext = Bloombox_Schema_Analytics_Context
public typealias AnalyticsScope = Bloombox_Schema_Analytics_Scope
public typealias AnalyticsCollection = Bloombox_Schema_Analytics_Context_Collection
public typealias TelemetryResponse = Bloombox_Schema_Services_Telemetry_V1beta3_TelemetryResponse
public typealias LibraryContext = Bloombox_Schema_Analytics_Context_DeviceLibrary
public typealias ApplicationContext = Bloombox_Schema_Analytics_Context_DeviceApplication
public typealias NativeDeviceContext = Bloombox_Schema_Analytics_Context_NativeDeviceContext
public typealias APIClient = Bloombox_Schema_Analytics_Context_APIClient
public typealias EventType = Bloombox_Schema_Analytics_Context_EventType
public typealias Order = Opencannabis_Commerce_Order
public typealias OrderKey = Opencannabis_Commerce_OrderKey
public typealias MenuSection = Opencannabis_Products_Menu_Section_Section
public typealias VersionSpec = Opencannabis_Structs_VersionSpec
public typealias TemporalInstant = Opencannabis_Temporal_Instant

//// Protobuf Types
public typealias ProtobufValue = Google_Protobuf_Value
public typealias ProtobufStruct = Google_Protobuf_Struct
