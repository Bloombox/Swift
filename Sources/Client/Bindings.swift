//
//  Bindings.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import Schema


//// Telemetry Service

/**
 * Binding to the active EventTelemetryService.
 */
typealias EventTelemetryService = Services_Telemetry_V1Beta3_EventTelemetryService

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
