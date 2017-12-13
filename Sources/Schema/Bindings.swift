//
//  Bindings.swift
//  Schema
//
//  Created by James Clark on 12/12/17.
//

import Foundation


// -- Shop Service (v1) -- //

// Ping
public typealias Services_Shop_V1_Ping_Request = Services_Shop_V1_Ping.Request
public typealias Services_Shop_V1_Ping_Response = Services_Shop_V1_Ping.Response

// ShopInfo
public typealias Services_Shop_V1_ShopInfo_Request = Services_Shop_V1_ShopInfo.Response
public typealias Services_Shop_V1_ShopInfo_Response = Services_Shop_V1_ShopInfo.Response

// Zipcheck
public typealias Services_Shop_V1_CheckZipcode_Request = Services_Shop_V1_CheckZipcode.Response
public typealias Services_Shop_V1_CheckZipcode_Response = Services_Shop_V1_CheckZipcode.Response

// VerifyMember
public typealias Services_Shop_V1_VerifyMember_Request = Services_Shop_V1_VerifyMember.Response
public typealias Services_Shop_V1_VerifyMember_Response = Services_Shop_V1_VerifyMember.Response

// EnrollMember
public typealias Services_Shop_V1_EnrollMember_Request = Services_Shop_V1_EnrollMember.Response
public typealias Services_Shop_V1_EnrollMember_Response = Services_Shop_V1_EnrollMember.Response

// GetOrder
public typealias Services_Shop_V1_GetOrder_Request = Services_Shop_V1_GetOrder.Response
public typealias Services_Shop_V1_GetOrder_Response = Services_Shop_V1_GetOrder.Response

// GetOrder
public typealias Services_Shop_V1_SubmitOrder_Request = Services_Shop_V1_SubmitOrder.Response
public typealias Services_Shop_V1_SubmitOrder_Response = Services_Shop_V1_SubmitOrder.Response


// -- Telemetry Service (v1beta3) -- //

// Generic Telemetry
public typealias Services_Telemetry_V1beta3_TelemetryPing_Request = Services_Telemetry_V1beta3_TelemetryPing.Request
public typealias Services_Telemetry_V1beta3_TelemetryPing_Response = Services_Telemetry_V1beta3_TelemetryPing.Response
public typealias Services_Telemetry_V1beta3_Event_Request = Services_Telemetry_V1beta3_Event.Request
public typealias Services_Telemetry_V1beta3_Event_Batch = Services_Telemetry_V1beta3_Event.Batch
public typealias Services_Telemetry_V1beta3_Event_BatchRequest = Services_Telemetry_V1beta3_Event.BatchRequest

// Commercial Telemetry
public typealias Services_Telemetry_V1beta3_CommercialEvent_Impression = Services_Telemetry_V1beta3_CommercialEvent.Impression
public typealias Services_Telemetry_V1beta3_CommercialEvent_View = Services_Telemetry_V1beta3_CommercialEvent.View
public typealias Services_Telemetry_V1beta3_CommercialEvent_Action = Services_Telemetry_V1beta3_CommercialEvent.Action

// Identity Telemetry
public typealias Services_Telemetry_V1beta3_IdentityEvent_Action = Services_Telemetry_V1beta3_IdentityEvent.Action
