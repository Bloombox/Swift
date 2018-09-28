//
//  Bindings.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import Schema
import SwiftProtobuf


//// Devices Service

/**
 * Binding to the active DevicesService.
 */
public typealias DevicesService = Bloombox_Schema_Services_Devices_V1Beta1_DevicesService
public typealias DeviceError = Bloombox_Schema_Services_Devices_V1beta1_DeviceError
public typealias DevicesRPCError = Bloombox_Schema_Services_Devices_V1Beta1_DevicesClientError

/**
 * Method: `ping`.
 */
public typealias DevicesPing = Bloombox_Schema_Services_Devices_V1beta1_Ping

/**
 * Method: `activate`.
 */
public typealias DeviceActivation = Bloombox_Schema_Services_Devices_V1beta1_Activation
public typealias DeviceActivateCall = Bloombox_Schema_Services_Devices_V1Beta1_DevicesActivateCall


//// POS Service

/**
 * Binding to the active Point-of-Sale service.
 */
public typealias PointOfSaleService = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleService

// Error Types
public typealias POSError = Bloombox_Schema_Services_Pos_V1beta1_POSError

// Object Types
public typealias SessionToken = Bloombox_Schema_Services_Pos_V1beta1_RegisterSessionToken
public typealias SessionTokenGrant = Bloombox_Schema_Services_Pos_V1beta1_SessionTokenGrant
public typealias InventoryStreamEvent = Bloombox_Schema_Services_Pos_V1beta1_InventoryStreamEvent
public typealias StaffUser = Bloombox_Schema_Services_Pos_V1beta1_StaffUser

/**
 * Method `authorize`.
 */
public typealias POSAuthorize = Bloombox_Schema_Services_Pos_V1beta1_AuthorizeUser
public typealias POSAuthorizeCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleAuthorizeCall

/**
 * Method `openTicket`.
 */
public typealias POSOpenTicket = Bloombox_Schema_Services_Pos_V1beta1_OpenTicket
public typealias POSOpenTicketCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleTicketOpenCall

/**
 * Method `loadTicket`.
 */
public typealias POSLoadTicket = Bloombox_Schema_Services_Pos_V1beta1_LoadTicket
public typealias POSLoadTicketCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleTicketLoadCall

/**
 * Method `saveTicket`.
 */
public typealias POSSaveTicket = Bloombox_Schema_Services_Pos_V1beta1_SaveTicket
public typealias POSSaveTicketCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleTicketSaveCall

/**
 * Method `voidTicket`.
 */
public typealias POSVoidTicket = Bloombox_Schema_Services_Pos_V1beta1_VoidTicket
public typealias POSVoidTicketCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleTicketVoidCall

/**
 * Method `finalizeTicket`.
 */
public typealias POSFinalizeTicket = Bloombox_Schema_Services_Pos_V1beta1_FinalizeTicket
public typealias POSFinalizeTicketCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleTicketFinalizeCall

/**
 * Method `memberSearch`.
 */
public typealias POSMemberSearch = Bloombox_Schema_Services_Pos_V1beta1_MemberSearch
public typealias POSMemberSearchCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleSearchMembersCall

/**
 * Method `inventoryRetrieve`.
 */
public typealias POSInventoryQuery = Bloombox_Schema_Services_Pos_V1beta1_InventoryQuery
public typealias POSInventoryQueryCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleInventoryRetrieveCall

/**
 * Method `inventoryStream`.
 */
public typealias POSInventoryStream = Bloombox_Schema_Services_Pos_V1beta1_InventoryStream
public typealias POSInventoryStreamCall = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleInventoryStreamCall
public typealias POSInventoryStreamSession = Bloombox_Schema_Services_Pos_V1Beta1_PointOfSaleInventoryStreamSession


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
public typealias EventTelemetry = Bloombox_Schema_Services_Telemetry_V1Beta4_EventTelemetryService

/**
 * Method: `ping`.
 */
public typealias TelemetryPing = Bloombox_Schema_Services_Telemetry_V1beta4_TelemetryPing

/**
 * Method: `event`.
 */
public typealias TelemetryEvent = Bloombox_Schema_Services_Telemetry_V1beta4_Event
public typealias TelemetryEventCall = Bloombox_Schema_Services_Telemetry_V1Beta4_EventTelemetryEventCall

/**
 * Method: `batch`.
 */
public typealias TelemetryEventBatch = Bloombox_Schema_Services_Telemetry_V1beta4_Event.Batch
public typealias TelemetryEventBatchRequest = Bloombox_Schema_Services_Telemetry_V1beta4_Event.BatchRequest

/**
 * Method: `error`.
 */
public typealias TelemetryException = Bloombox_Schema_Services_Telemetry_V1beta4_Exception

/**
 * Enumerated errors from EventTelemetryService.
 */
public typealias EventTelemetryClientError = Bloombox_Schema_Services_Telemetry_V1Beta4_EventTelemetryClientError


//// Menu Service

/**
 * Binding to the active MenuService.
 */
public typealias MenuService = Bloombox_Schema_Services_Menu_V1Beta1_MenuService
public typealias MenuRPCError = Bloombox_Schema_Services_Menu_V1Beta1_MenuClientError

/**
 * Method: `retrieve`.
 */
public typealias GetMenu = Bloombox_Schema_Services_Menu_V1beta1_GetMenu
public typealias GetMenuCall = Bloombox_Schema_Services_Menu_V1Beta1_MenuRetrieveCall


//// Objects
public typealias Hash = Opencannabis_Crypto_Primitives_Integrity_Hash
public typealias Keypair = Opencannabis_Crypto_Primitives_Pki_Keypair
public typealias KeyMaterial = Opencannabis_Crypto_Primitives_Pki_KeyMaterial
public typealias KeyingScheme = Opencannabis_Crypto_Primitives_Pki_KeyingScheme
public typealias KeyParameters = Opencannabis_Crypto_Primitives_Pki_KeyParameters
public typealias IdentityToken = Bloombox_Schema_Security_IdentityToken
public typealias IdentityTokenIssuer = Bloombox_Schema_Security_IdentityTokenIssuer
public typealias User = Bloombox_Schema_Identity_User
public typealias UserKey = Bloombox_Schema_Identity_UserKey
public typealias PartnerKey = Bloombox_Schema_Partner_PartnerKey
public typealias PartnerDeviceKey = Bloombox_Schema_Partner_PartnerDeviceKey
public typealias PartnerLocationKey = Bloombox_Schema_Partner_LocationKey
public typealias Event = Bloombox_Schema_Services_Telemetry_V1beta4_Event
public typealias GenericEvent = Bloombox_Schema_Analytics_Generic_Event
public typealias AnalyticsContext = Bloombox_Schema_Analytics_Context
public typealias AnalyticsScope = Bloombox_Schema_Analytics_Scope
public typealias AnalyticsCollection = Bloombox_Schema_Analytics_Context_Collection
public typealias TelemetryResponse = Bloombox_Schema_Services_Telemetry_V1beta4_TelemetryResponse
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
public typealias Menu = Opencannabis_Products_Menu_Menu
public typealias StaticMenu = Opencannabis_Products_Menu_StaticMenu
public typealias SectionedMenu = Opencannabis_Products_Menu_SectionedMenu
public typealias SectionData = Opencannabis_Products_Menu_SectionData
public typealias SectionSpec = Opencannabis_Products_Menu_Section_SectionSpec
public typealias MenuProduct = Opencannabis_Products_Menu_MenuProduct
public typealias MenuSettings = Opencannabis_Products_Menu_MenuSettings
public typealias InventoryKey = Opencannabis_Inventory_InventoryKey
public typealias InventoryState = Opencannabis_Inventory_InventoryState
public typealias InventoryAmount = Opencannabis_Inventory_InventoryAmount
public typealias InventoryBinding = Opencannabis_Inventory_InventoryBinding
public typealias InventoryProduct = Opencannabis_Inventory_InventoryProduct
public typealias InventoryLocation = Opencannabis_Inventory_InventoryLocation
public typealias InventoryCoordinates = Opencannabis_Inventory_InventoryCoordinates
public typealias InventoryLocationKey = Opencannabis_Inventory_InventoryLocationKey
public typealias InventoryLocationType = Opencannabis_Inventory_InventoryLocationType
public typealias PurchaseKey = Opencannabis_Commerce_PurchaseKey
public typealias PurchaseTicket = Opencannabis_Commerce_PurchaseTicket
public typealias PurchaseStatus = Opencannabis_Commerce_PurchaseStatus
public typealias PurchaseTimestamps = Opencannabis_Commerce_PurchaseTimestamps
public typealias PurchaseFacilitator = Opencannabis_Commerce_PurchaseFacilitator
public typealias PurchaseCustomer = Opencannabis_Commerce_PurchaseCustomer
public typealias BillOfCharges = Opencannabis_Commerce_BillOfCharges

//// Protobuf Types
public typealias Empty = Google_Protobuf_Empty
public typealias ProtobufValue = Google_Protobuf_Value
public typealias ProtobufStruct = Google_Protobuf_Struct
