//
//  Bindings.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation
import SwiftProtobuf
import OpenCannabis
import BloomboxServices


//// Client Bindings

/// User identifier. Globally unique ID for a given user account.
public typealias UserID = String

/// API key for communicating to/from remote services.
public typealias APIKey = String

/// Session or group ID for the current telemetry event session.
public typealias GroupID = String

/// Partner account code. Accessible via the Bloombox Dashboard.
public typealias PartnerCode = String

/// Location account code. Accessible via the Bloombox Dashboard.
public typealias LocationCode = String


//// Auth Service

/// Binding to the active AuthService.
public typealias AuthService = Bloombox_Services_Auth_V1beta1_AuthServiceClient
public typealias AuthError = Bloombox_Services_Auth_V1beta1_AuthError
public typealias EmailPasswordAssertion = Bloombox_Services_Auth_V1beta1_EmailPasswordAssertion
public typealias FirebaseTokenAssertion = Bloombox_Services_Auth_V1beta1_FirebaseTokenAssertion
public typealias AccountAssertion = Bloombox_Services_Auth_V1beta1_AccountAssertion

/// Method: `nonce`
public typealias AuthNonce = Bloombox_Services_Auth_V1beta1_AuthNonce
public typealias AuthNonceCall = Bloombox_Services_Auth_V1beta1_AuthNonceCall

/// Method: `authenticate`
public typealias AuthenticateUser = Bloombox_Services_Auth_V1beta1_AuthenticateUser
public typealias AuthenticateUserCall = Bloombox_Services_Auth_V1beta1_AuthAuthenticateCall

/// Method: `connect`
public typealias IdentityConnect = Bloombox_Services_Auth_V1beta1_IdentityConnect
public typealias IdentityConnectCall = Bloombox_Services_Auth_V1beta1_AuthConnectCall

/// Method: `profile`
public typealias GetProfile = Bloombox_Services_Auth_V1beta1_GetProfile
public typealias GetProfileCall = Bloombox_Services_Auth_V1beta1_AuthProfileCall


//// Identity Service

/// Binding to the active IdentityService.
public typealias IdentityService = Bloombox_Services_Identity_V1beta1_IdentityServiceClient
public typealias IdentityError = Bloombox_Services_Identity_V1beta1_IdentityError
public typealias ResolveKey = Bloombox_Services_Identity_V1beta1_ResolveKey
public typealias KeyOwnership = Bloombox_Services_Identity_V1beta1_KeyOwnership
public typealias ResolveKeyCall = Bloombox_Services_Identity_V1beta1_IdentityKeyResolveCall


//// Platform Service

/// Binding to the active PlatformService.
public typealias PlatformService = Bloombox_Services_Platform_V1_PlatformServiceClient
public typealias PlatformError = Bloombox_Services_Platform_V1_PlatformError
public typealias PlatformServiceStatus = Bloombox_Services_Platform_V1_PlatformServiceStatus

/// Method: `ping`.
public typealias PlatformPing = Bloombox_Services_Platform_V1_Ping
public typealias PlatformPingCall = Bloombox_Services_Platform_V1_PlatformPingCall

/// Method: `health`.
public typealias Healthcheck = Bloombox_Services_Platform_V1_Healthcheck
public typealias HealthcheckCall = Bloombox_Services_Platform_V1_PlatformHealthCall

/// Method: `resolve`.
public typealias ResolveDomains = Bloombox_Services_Platform_V1_DomainResolve
public typealias ResolveDomainsCall = Bloombox_Services_Platform_V1_PlatformResolveCall

/// Method: `domains`.
public typealias DomainInfo = Bloombox_Services_Platform_V1_DomainInfo
public typealias DomainInfoCall = Bloombox_Services_Platform_V1_PlatformDomainsCall

/// Method: `brand`.
public typealias BrandInfo = Bloombox_Services_Platform_V1_BrandInfo
public typealias BrandInfoCall = Bloombox_Services_Platform_V1_PlatformBrandCall


//// Devices Service

/// Binding to the active DevicesService.
public typealias DevicesService = Bloombox_Services_Devices_V1beta1_DevicesServiceClient
public typealias DeviceError = Bloombox_Services_Devices_V1beta1_DeviceError

/// Method: `ping`.
public typealias DevicesPing = Bloombox_Services_Devices_V1beta1_Ping
public typealias DevicesPingCall = Bloombox_Services_Devices_V1beta1_DevicesPingCall

/// Method: `activate`.
public typealias DeviceActivation = Bloombox_Services_Devices_V1beta1_Activation
public typealias DeviceActivateCall = Bloombox_Services_Devices_V1beta1_DevicesActivateCall


//// Shop Service

/// Binding to the active ShopService.
public typealias ShopService = Bloombox_Services_Shop_V1_ShopServiceClient

/// Error Types
public typealias VerifyError = Bloombox_Services_Shop_V1_VerifyError
public typealias EnrollmentError = Bloombox_Services_Shop_V1_EnrollmentError

/// Method `ping`.
public typealias ShopPing = Bloombox_Services_Shop_V1_Ping
public typealias ShopPingCall = Bloombox_Services_Shop_V1_ShopPingCall

/// Method: `shopInfo`.
public typealias ShopInfo = Bloombox_Services_Shop_V1_ShopInfo
public typealias ShopInfoCall = Bloombox_Services_Shop_V1_ShopShopInfoCall

/// Method: `checkZipcode`.
public typealias CheckZipcode = Bloombox_Services_Shop_V1_CheckZipcode
public typealias CheckZipcodeCall = Bloombox_Services_Shop_V1_ShopCheckZipcodeCall

/// Method: `verifyMember`.
public typealias VerifyMember = Bloombox_Services_Shop_V1_VerifyMember
public typealias VerifyMemberCall = Bloombox_Services_Shop_V1_ShopVerifyMemberCall

/// Method: `enrollMember`.
public typealias EnrollMember = Bloombox_Services_Shop_V1_EnrollMember
public typealias EnrollMemberCall = Bloombox_Services_Shop_V1_ShopEnrollMemberCall

/// Method: `getOrder`.
public typealias GetOrder = Bloombox_Services_Shop_V1_GetOrder
public typealias GetOrderCall = Bloombox_Services_Shop_V1_ShopGetOrderCall

/// Method: `submitOrder`.
public typealias SubmitOrder = Bloombox_Services_Shop_V1_SubmitOrder
public typealias SubmitOrderCall = Bloombox_Services_Shop_V1_ShopSubmitOrderCall


//// Telemetry Service

/// Binding to the active EventTelemetryService.
public typealias EventTelemetry = Bloombox_Services_Telemetry_V1beta4_EventTelemetryServiceClient

/// Method: `ping`.
public typealias TelemetryPing = Bloombox_Services_Telemetry_V1beta4_TelemetryPing
public typealias TelemetryPingCall = Bloombox_Services_Telemetry_V1beta4_EventTelemetryPingCall

/// Method: `event`.
public typealias TelemetryEvent = Bloombox_Services_Telemetry_V1beta4_Event
public typealias TelemetryEventCall = Bloombox_Services_Telemetry_V1beta4_EventTelemetryEventCall

/// Method: `batch`.
public typealias TelemetryEventBatch = Bloombox_Services_Telemetry_V1beta4_Event.Batch
public typealias TelemetryEventBatchRequest = Bloombox_Services_Telemetry_V1beta4_Event.BatchRequest

/// Method: `error`.
public typealias TelemetryException = Bloombox_Services_Telemetry_V1beta4_Exception


//// Menu Service

/// Binding to the active MenuService.
public typealias MenuService = Bloombox_Services_Menu_V1beta1_MenuServiceClient

/// Method: `retrieve`.
public typealias GetMenu = Bloombox_Services_Menu_V1beta1_GetMenu
public typealias GetMenuCall = Bloombox_Services_Menu_V1beta1_MenuRetrieveCall


//// Checkin Service

/// Binding to the active CheckinService.
public typealias CheckinService = Bloombox_Services_Checkin_V1beta1_CheckinServiceClient
public typealias CheckinResponse = Bloombox_Services_Checkin_V1beta1_CheckinResponse

/// Method: `ping`
public typealias CheckinPing = Bloombox_Services_Checkin_V1beta1_Ping
public typealias CheckinPingCall = Bloombox_Services_Checkin_V1beta1_CheckinPingCall

/// Method: `identification`
public typealias CheckinByID = Bloombox_Services_Checkin_V1beta1_IDCheckin
public typealias CheckinByIDCall = Bloombox_Services_Checkin_V1beta1_CheckinIdentificationCall

/// Method: `card`
public typealias CheckinByCard = Bloombox_Services_Checkin_V1beta1_CardCheckin
public typealias CheckinByCardCall = Bloombox_Services_Checkin_V1beta1_CheckinCardCall


//// Generic

//// Objects
public typealias Language = Opencannabis_Base_Language
public typealias Compression = Opencannabis_Base_Compression
public typealias Color = Opencannabis_Content_Color
public typealias ColorScheme = Opencannabis_Content_ColorScheme
public typealias Hash = Opencannabis_Crypto_Hash
public typealias HashAlgorithm = Opencannabis_Crypto_HashAlgorithm
public typealias Keypair = Opencannabis_Crypto_Keypair
public typealias KeyMaterial = Opencannabis_Crypto_KeyMaterial
public typealias KeyingScheme = Opencannabis_Crypto_KeyingScheme
public typealias KeyParameters = Opencannabis_Crypto_KeyParameters
public typealias KeyType = Opencannabis_Crypto_KeyType
public typealias BlockMode = Opencannabis_Crypto_BlockMode
public typealias KeyAgreement = Opencannabis_Crypto_KeyAgreement
public typealias HashedData = Opencannabis_Crypto_HashedData
public typealias Signature = Opencannabis_Crypto_Signature
public typealias StreamCipher = Opencannabis_Crypto_StreamCipher
public typealias SymmetricKey = Opencannabis_Crypto_SymmetricKey
public typealias KeyDisposition = Opencannabis_Crypto_KeyDisposition
public typealias InitializationVector = Opencannabis_Crypto_InitializationVector
public typealias EncryptedData = Opencannabis_Crypto_EncryptedData
public typealias BlockCipher = Opencannabis_Crypto_BlockCipher
public typealias BlockCipherParameters = Opencannabis_Crypto_BlockCipherParameters
public typealias AuthToken = Bloombox_Security_AuthToken
public typealias IdentityToken = Bloombox_Security_IdentityToken
public typealias IdentityTokenIssuer = Bloombox_Security_IdentityTokenIssuer
public typealias User = Bloombox_Identity_User
public typealias UserKey = Bloombox_Identity_UserKey
public typealias PartnerKey = Bloombox_Partner_PartnerKey
public typealias PartnerDeviceKey = Bloombox_Partner_PartnerDeviceKey
public typealias LocationKey = Bloombox_Partner_LocationKey
public typealias Event = Bloombox_Services_Telemetry_V1beta4_Event
public typealias GenericEvent = Bloombox_Analytics_Generic_Event
public typealias AnalyticsContext = Bloombox_Analytics_Context
public typealias AnalyticsScope = Bloombox_Analytics_Scope
public typealias AnalyticsCollection = Bloombox_Analytics_Context_Collection
public typealias TelemetryResponse = Bloombox_Services_Telemetry_V1beta4_TelemetryResponse
public typealias LibraryContext = Bloombox_Analytics_Context_DeviceLibrary
public typealias ApplicationContext = Bloombox_Analytics_Context_DeviceApplication
public typealias NativeDeviceContext = Bloombox_Analytics_Context_NativeDeviceContext
public typealias DeviceApplication = Bloombox_Analytics_Context_DeviceApplication
public typealias APIClient = Bloombox_Analytics_Context_APIClient
public typealias EventType = Bloombox_Analytics_Context_EventType
public typealias Order = Opencannabis_Commerce_Order
public typealias OrderKey = Opencannabis_Commerce_OrderKey
public typealias ProductVariant = Opencannabis_Commerce_ProductVariant
public typealias VariantSpec = Opencannabis_Commerce_VariantSpec
public typealias MenuSection = Opencannabis_Products_Menu_Section_Section
public typealias VersionSpec = Opencannabis_Structs_VersionSpec
public typealias TemporalInstant = Opencannabis_Temporal_Instant
public typealias Menu = Opencannabis_Products_Menu_Menu
public typealias Genetics = Opencannabis_Structs_Genetics
public typealias Grow = Opencannabis_Structs_Grow
public typealias Species = Opencannabis_Structs_Species
public typealias Shelf = Opencannabis_Structs_Shelf
public typealias ProductKey = Opencannabis_Base_ProductKey
public typealias ProductKind = Opencannabis_Base_ProductKind
public typealias Content = Opencannabis_Content_Content
public typealias Encoding = Opencannabis_Content_Encoding
public typealias Brand = Opencannabis_Content_Brand
public typealias BrandAsset = Opencannabis_Content_BrandAsset
public typealias Name = Opencannabis_Content_Name
public typealias MaterialsData = Opencannabis_Content_MaterialsData
public typealias ProductContent = Opencannabis_Content_ProductContent
public typealias ProductTimestamps = Opencannabis_Content_ProductTimestamps
public typealias ProductReference = Opencannabis_Base_ProductReference
public typealias DistributionPolicy = Opencannabis_Products_Distribution_DistributionPolicy
public typealias DistributionChannel = Opencannabis_Products_Distribution_Channel
public typealias DistributionChannelType = Opencannabis_Products_Distribution_ChannelType
public typealias FiatCurrency = Opencannabis_Commerce_FiatCurrency
public typealias CurrencyValue = Opencannabis_Commerce_CurrencyValue
public typealias Flower = Opencannabis_Products_Flower
public typealias Edible = Opencannabis_Products_Edible
public typealias EdibleType = Opencannabis_Products_Edible.TypeEnum
public typealias Extract = Opencannabis_Products_Extract
public typealias ExtractType = Opencannabis_Products_Extract.TypeEnum
public typealias Preroll = Opencannabis_Products_Preroll
public typealias Apothecary = Opencannabis_Products_Apothecary
public typealias ApothecaryType = Opencannabis_Products_Apothecary.TypeEnum
public typealias Cartridge = Opencannabis_Products_Cartridge
public typealias CartridgeType = Opencannabis_Products_Cartridge.TypeEnum
public typealias Merchandise = Opencannabis_Products_Merchandise
public typealias MerchandiseType = Opencannabis_Products_Merchandise.TypeEnum
public typealias Plant = Opencannabis_Products_Plant
public typealias PlantType = Opencannabis_Products_Plant.TypeEnum
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
public typealias PurchaseStatus = Opencannabis_Commerce_PurchaseStatus
public typealias PurchaseTimestamps = Opencannabis_Commerce_PurchaseTimestamps
public typealias PurchaseFacilitator = Opencannabis_Commerce_PurchaseFacilitator
public typealias PurchaseCustomer = Opencannabis_Commerce_PurchaseCustomer
public typealias BillOfCharges = Opencannabis_Commerce_BillOfCharges
public typealias StaffUser = Bloombox_Identity_StaffUser
public typealias PricingWeightTier = Opencannabis_Structs_Pricing_PricingWeightTier
public typealias PricingTierAvailability = Opencannabis_Structs_Pricing_PricingTierAvailability
public typealias PricingType = Opencannabis_Structs_Pricing_PricingType
public typealias ProductPricing = Opencannabis_Structs_Pricing_ProductPricing
public typealias Pricing = Opencannabis_Structs_Pricing_PricingDescriptor
public typealias SaleType = Opencannabis_Structs_Pricing_SaleType
public typealias SaleDescriptor = Opencannabis_Structs_Pricing_SaleDescriptor
public typealias BOGODiscount = Opencannabis_Structs_Pricing_BOGODiscount
public typealias LoyaltyDiscount = Opencannabis_Structs_Pricing_LoyaltyDiscount
public typealias PercentageDiscount = Opencannabis_Structs_Pricing_PercentageDiscount
public typealias UnitPricing = Opencannabis_Structs_Pricing_UnitPricingDescriptor
public typealias WeightedPricing = Opencannabis_Structs_Pricing_WeightedPricingDescriptor
public typealias TestResults = Opencannabis_Structs_Labtesting_TestResults
public typealias Metals = Opencannabis_Structs_Labtesting_Metals
public typealias Feeling = Opencannabis_Structs_Labtesting_Feeling
public typealias Terpene = Opencannabis_Structs_Labtesting_Terpene
public typealias Terpenes = Opencannabis_Structs_Labtesting_Terpenes
public typealias Moisture = Opencannabis_Structs_Labtesting_Moisture
public typealias TasteNote = Opencannabis_Structs_Labtesting_TasteNote
public typealias TestMedia = Opencannabis_Structs_Labtesting_TestMedia
public typealias TestMediaType = Opencannabis_Structs_Labtesting_TestMediaType
public typealias TestSuite = Opencannabis_Structs_Labtesting_TestSuite
public typealias TestValue = Opencannabis_Structs_Labtesting_TestValue
public typealias TestValueType = Opencannabis_Structs_Labtesting_TestValueType
public typealias MoldMildew = Opencannabis_Structs_Labtesting_MoldMildew
public typealias Pesticides = Opencannabis_Structs_Labtesting_Pesticides
public typealias Subjective = Opencannabis_Structs_Labtesting_Subjective
public typealias Cannabinoid = Opencannabis_Structs_Labtesting_Cannabinoid
public typealias Cannabinoids = Opencannabis_Structs_Labtesting_Cannabinoids
public typealias Contaminants = Opencannabis_Structs_Labtesting_Contaminants
public typealias TestErrorType = Opencannabis_Structs_Labtesting_TestErrorType
public typealias TestMethod = Opencannabis_Structs_Labtesting_TestMethod
public typealias PotencyEstimate = Opencannabis_Structs_Labtesting_PotencyEstimate
public typealias TestCoordinates = Opencannabis_Structs_Labtesting_TestCoordinates
public typealias CannabinoidRatio = Opencannabis_Structs_Labtesting_CannabinoidRatio
public typealias OtherContaminants = Opencannabis_Structs_Labtesting_OtherContaminants
public typealias MediaItem = Opencannabis_Media_MediaItem
public typealias MediaType = Opencannabis_Media_MediaType
public typealias MediaStatus = Opencannabis_Media_MediaStatus
public typealias MediaKey = Opencannabis_Media_MediaKey
public typealias MediaUpload = Opencannabis_Media_MediaUpload
public typealias MediaPrivacy = Opencannabis_Media_MediaPrivacy
public typealias MediaSubject = Opencannabis_Media_MediaSubject
public typealias MediaReference = Opencannabis_Media_MediaReference
public typealias MediaOrientation = Opencannabis_Media_MediaOrientation
public typealias PersonName = Opencannabis_Person_Name
public typealias PhoneNumber = Opencannabis_Contact_PhoneNumber
public typealias EmailAddress = Opencannabis_Contact_EmailAddress
public typealias Passport = Bloombox_Identity_Ids_Passport
public typealias ID = Bloombox_Identity_ID
public typealias IDType = Bloombox_Identity_IDType
public typealias USDL = Bloombox_Identity_Ids_USDL
public typealias USDLField = Bloombox_Identity_Ids_USDLField
public typealias TemporalDate = Opencannabis_Temporal_Date
public typealias USDLFieldValue = Bloombox_Identity_Ids_USDLFieldValue

@available(*, deprecated)
public typealias PartnerLocationKey = Bloombox_Partner_LocationKey

//// Protobuf Types
public typealias Empty = Google_Protobuf_Empty
public typealias ProtobufValue = Google_Protobuf_Value
public typealias ProtobufStruct = Google_Protobuf_Struct
