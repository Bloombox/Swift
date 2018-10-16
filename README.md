# Bloombox for Swift

![Build](https://img.shields.io/travis/bloombox/swift.svg?style=flat-square) [![Maintainability](https://api.codeclimate.com/v1/badges/726f360df7dbf653931f/maintainability)](https://codeclimate.com/github/Bloombox/Swift/maintainability) ![Coverage](https://img.shields.io/codecov/c/github/bloombox/swift.svg?style=flat-square) ![Version](https://img.shields.io/cocoapods/v/Bloombox.svg?style=flat-square) ![Support](https://img.shields.io/cocoapods/p/Bloombox.svg?style=flat-square) [![Carthage](https://img.shields.io/badge/carthage-compatible-green.svg?style=flat-square)](https://github.com/Carthage/Carthage) ![License](https://img.shields.io/github/license/bloombox/swift.svg?style=flat-square)

This Swift package provides an API client for [Bloombox](https://bloombox.io) Cloud APIs. Bloombox APIs are built and served using [gRPC](https://grpc.io) and exposed in client libraries like this one with a more fluid interface to work with. Bloombox systems are [OpenCannabis](https://rfc.opencannabis.info)-compliant, and expose, for instance, an `OpenCannabis` pod that can be used independent of the API client.

You can always opt to use the lower level APIs instead of the client libraries, either via [gRPC+protobuf or JSON-REST](https://console.api.bloombox.cloud).

In terms of iOS land, this library client is built in native Swift, and packaged as a Cocoapod and Swift Package. It is built on [Apple's Protobuf for Swift](https://github.com/apple/swift-protobuf) and the new native [gRPC for Swift](https://github.com/grpc/grpc-swift). It is tested on macOS 11, and iOS 11, although the underlying tools are still under active development, and so YMMV.


### Using the code

Via **CocoaPods**:
```ruby
project 'YourProject.xcodeproj/'

source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
inhibit_all_warnings!

target 'YourProject' do
  use_frameworks!

  pod 'OpenCannabis', '~> 0.1.0'
  pod 'Bloombox', '~> 0.1.0'
end
```

Via **Swift Package Manager**:
```swift
// swift-tools-version:4.0
  
import PackageDescription

let package = Package(
    name: "YourProject",

    /// ...

    dependencies: [
        .package(url: "https://github.com/bloombox/swift", .upToNextMinor(from: "0.1.0"))])
```

Via **Carthage**:
```
github "bloombox/swift" ~> 0.1.0
```


### Schema Pods

The Bloombox Swift SDK is broken into three pods, to make lower-level structures usable directly with a hand-rolled gRPC implementation. They are laid out like so (roughly in reverse-abstraction-order):

| Pod | Version | Platforms | Description |
| --- | ------- | --------- | ----------- |
| `Bloombox` | ![Version](https://img.shields.io/cocoapods/v/Bloombox.svg?style=flat-square) | ![Platforms](https://img.shields.io/cocoapods/p/Bloombox.svg?style=flat-square) | Full client-library facade, example apps, documentation and guides. |
| `BloomboxServices` | ![Version](https://img.shields.io/cocoapods/v/BloomboxServices.svg?style=flat-square) | ![Platforms](https://img.shields.io/cocoapods/p/BloomboxServices.svg?style=flat-square) | Low-level gRPC services for interacting with Bloombox APIs. |
| `OpenCannabis` | ![Version](https://img.shields.io/cocoapods/v/OpenCannabis.svg?style=flat-square) | ![Platforms](https://img.shields.io/cocoapods/p/OpenCannabis.svg?style=flat-square) | [OpenCannabis](https://rfc.opencannabis.info)-compatible object tree in Swift. |


### Building the code

Building the code is easy and follows standard Swift packaging conventions. There is also a `Makefile` packaged with various useful routines - you'll use `make` if you are developing on the code.

**Tooling:**
- Xcode 10/Swift 4.2 (for version `0.1.0` and above, previously Xcode 9 / Swift 3.2)
- `make` and other CLI tools for XCode
- Code access to private schema repos for Bloombox


## Services

To get started with API services, setup an API client somewhere in your app:

```swift
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: "[your-api-key]",
      partner: "[your-partner-id]",
      location: "[your-location-id]"))

```

Information about these settings, in detail:
- *API Key*: Identifies your app/project to the Bloombox API. You can provision these from your Bloombox Dashboard.
- *Partner ID*: Identifies your partner account by a short string code. Can be found in your Bloombox Dashboard.
- *Location ID*: Identifies the partner location for which you want to transact/interact. Can also be found in your Bloombox Dashboard, under the location you wish to use.

*NOTE:* Make sure you retain the `Bloombox` client instance somewhere, or you risk the client (and associated callbacks, etc) getting de-allocated in the middle of a request:


#### Architecture

For nearly every method in the SDK, there is both a sync variant which returns its response directly, and an async variant that responds via callback rather than returning a response directly. When using the synchronous API, errors are thrown, whether they are encountered on the client-side (for instance, a missing API key), or on the server-side (e.g. an authorization failure). The async API, by comparison, only throws client-side errors, and reports server-side errors via the provided callback.

Each service has an accompanying client-side error enumeration, which provides each error that may be thrown for a request before it leaves for the server.

To make cross-location usage easy, most, if not all, methods support overriding the partner, location, or API key on a per-call basis. If you choose not to provide these override values, they're gathered from the `Bloombox.Settings` object instead.


### Shop API

> [Try this API or browse the docs in the API console](https://console.api.bloombox.cloud/docs/shop.api.bloombox.cloud/g/introduction)

| Property  | Value |
| ------------- | ------------- |
| Service  | `shop` |
| Version  | `v1` |
| Endpoint | `api.bloombox.cloud` |
| Domain   | `shop.rpc.bloombox.cloud` |

Bloombox Shop services allow interaction with ordering, user enrollment and verification, and more. The included sample checks a shop's "info," which includes its open/closed status, and a few other top-of-the-fold details. The full set of available shop methods includes:

- `info`: Retrieve `OPEN`/`CLOSED` status and other top-of-the-fold details.
- `verifyMember`: Perform membership verification on a given user account.
- `enrollMember`: Enroll a user as a member of a dispensary location, and potentially for a new account.
- `zipcheck`: Check a given USPS zipcode for delivery eligibility (and applicable minimums).
- `submitOrder`: Submit an online/commercial order, for `PICKUP` or `DELIVERY`.
- `getOrder`: Retrieve an existing online/commercial order. 

Synchronous:
```swift
  do {
    let info: ShopInfo.Response = try client.shop.info()

    switch status.shopStatus {
    case .open:
      // the shop is open
    case .closed:
      // the shop is entirely closed
    case .deliveryOnly:
      // the shop is only open for delivery
    case .pickupOnly:
      // the shop is only open for pickup
    default: fatalError("unrecognized shop status")
    }

  } catch {
    fatalError("some error occurred: \(error)")
  }
```


### Platform API

> [Try this API or browse the docs in the API console](https://console.api.bloombox.cloud/docs/platform.api.bloombox.cloud/g/introduction)

| Property  | Value |
| ------------- | ------------- |
| Service  | `platform` |
| Version  | `v1` |
| Endpoint | `api.bloombox.cloud` |
| Domain   | `platform.rpc.bloombox.cloud` |

The Platform API provides basic account and domain lookup methods, in addition to miscellaneous methods unrelated to any specific partner or location account. This includes health checks, system pings, domain resolution, and domain info fetching:

- `ping`: Send a simple message to the server asking it to respond.
- `healthcheck`: Ask the system to report its current status.
- `resolve`: Resolve a partner account code and location code for a given domain.
- `domains`: Resolve a set of domains for a given partner account code and location code.
- `brand`: Retrieve branding information for a given partner account code and location code.

Synchronous:
```swift
  do {
    let assignment: ResolveDomains.Response = try client.platform.resolve("domain.com:443")

  } catch {
    fatalError("some client-side or server-side error occurred: \(error)")
  }
```

Asynchronous:
```swift
  do {
    try client.platform.resolve("domain.com:443") { result, response in
      // result is the call result from gRPC, response is the RPC response, if available
      if let assignment = response {
        // assignment.partner and assignment.location
      } else {
        // do something about the error state
        fatalError("some error happened: \(result.statusCode)")
      }
    }
  } catch {
    // only client-side errors will show up here (i.e. missing API key, or unresolved partner ID)
    fatalError("client-side error")
  }
```


### Devices API  ![Beta](https://img.shields.io/badge/BETA-yellow.svg?style=flat-square)

> [Try this API or browse the docs in the API console](https://console.api.bloombox.cloud/docs/devices.api.bloombox.cloud/g/introduction)

| Property  | Value |
| ------------- | ------------- |
| Service  | `devices` |
| Version  | `v1beta1` |
| Endpoint | `api.bloombox.cloud` |
| Domain   | `devices.rpc.bloombox.cloud` |

Performs activation of partner-side devices. For menu tablets and other items, the Devices API provides tools to reach out and discover any assignment and role information bound to the invoking device.

In some circumstances (usually goverened by the assigned device role), a `fingerprint` or `publicKey` value may be required. Device activation may be restricted based on the value of these properties, or, they may need to match the first activation that ever took place for the device in question. Other restrictions may apply to device activation, again, by role, such as enforcement of client-side certificates, IP restrictions, and more.

Synchronous:
```swift
  do {
    let manifest: DeviceActivation.Response = try client.devices.activate(
        deviceSerial: "ABC-123",
        withFingerprint: "[device-hardware-fingerprint]",
        withPublicKey: "[device-public-key]")

  } catch {
    fatalError("some client-side or server-side error occurred: \(error)")
  }
```

Asynchronous:
```swift
  do {
    try client.devices.activate(
        deviceSerial: "ABC-123",
        withFingerprint: "[device-hardware-fingerprint]",
        withPublicKey: "[device-public-key]") { callResult, response in

      // handle the call result and response
      if let manifest = response {
        // the device was able to activate
      } else {
        fatalError("the device was not able to activate: \(call.statusCode)")
      }
    } 
  } catch {
    fatalError("some client-side error occurred: \(error)")
  }
```


### Menu API  ![Beta](https://img.shields.io/badge/BETA-yellow.svg?style=flat-square)

> [Try this API or browse the docs in the API console](https://console.api.bloombox.cloud/docs/menu.api.bloombox.cloud/g/introduction)

| Property  | Value |
| ------------- | ------------- |
| Service  | `menu` |
| Version  | `v1beta1` |
| Endpoint | `api.bloombox.cloud` |
| Domain   | `menu.rpc.bloombox.cloud` |

The Menu API provides tools for interacting with product data, in a read-only manner, with an eye towards showcasing/selling products. This is distinguished from more detailed product catalog solutions and Bloombox APIs, in that:

- Items that are out-of-stock or currently not-offered at a given location are withheld by default
- Items without pricing, or marked as not-fit-for-sale, are withheld by default
- Items marked for suppressed distribution on retail channels are withheld by default

Some Menu API methods provide flags for overriding the above behavior, but, by and large, the Menu API is designed to provide product catalog data that is then showcased to a potential retail customer.

The simplest example (shown below) of using the Menu API is retrieving an entire menu for a given partner location. The full set of methods includs:

- `retrieve`: Retrieve the entire menu catalog for a given partner location.
- `section`: Retrieve a single section of a given location's menu. Menus are sectioned by `ProductKind`.
- `featured`: Retrieve the current set of featured products on a given location's menu.
- `products`: Retrieve one or more product data records.
- `search`: Perform a fulltext search over products currently listed on a given location's menu.
- `create`: Create a new product record from scratch.
- `update`: Update an existing product record with new data.
- `remove`: Remove an existing product record from a location's menu.
- `productStatus`: Retrieve the current status of a given product record on a location's menu.
- `inStock`: Mark an existing product record as currently-in-stock on a given location's menu.
- `outOfStock`: Mark an existing product record as currently-out-of-stock on a given location's menu.


Synchronous:
```swift
  do {
    let menu: GetMenu.Response = try client.menu.retrieve()

  } catch {
    fatalError("some client-side or server-side error occurred: \(error)")
  }
```

Asynchronous:
```swift
  do {
    try client.menu.retrieve() { callResult, response in
      // handle the call result and response
      if let menu = response {
        // the catalog will be at `menu.catalog`
      } else {
        fatalError("unable to fetch the menu: \(call.statusCode)")
      }
    }
  } catch {
    fatalError("some client-side error occurred: \(error)")
  }
```


### Telemetry API  ![Beta](https://img.shields.io/badge/BETA-yellow.svg?style=flat-square)

> [Try this API or browse the docs in the API console](https://console.api.bloombox.cloud/docs/telemetry.api.bloombox.cloud/g/introduction)

| Property  | Value |
| ------------- | ------------- |
| Service  | `telemetry` |
| Version  | `v1beta4` |
| Endpoint | `api.bloombox.cloud` |
| Domain   | `telemetry.rpc.bloombox.cloud` |

The Telemetry API allows you to relay events as they happen, so they may be attributed in user flows and other Bloombox-provided metrics. Bloombox partners may also record arbitrary events with their own meaning, and optionally have these included in built-in event flows.

Bloombox telemetry systems distinguish events by category, with three major categories supported for external use:

- `EventTelemetry`: Generic event-based telemetry, with arbitrary event payloads.
- `CommercialTelemetry`: Retail-style funnel-compatible telemetry, broken into *impressions*, *views*, and *actions*.
- `IdentityTelemetry`: User-identity-related telemetry events. Not directly usable by partners, but consumable in analytics flows.

*Full enumeration and guide for use of these methods is coming soon.*


### Auth API  ![Coming Soon](https://img.shields.io/badge/Coming%20Soon-lightgray.svg?style=flat-square)

| Property  | Value |
| ------------- | ------------- |
| Service  | `auth` |
| Version  | `v1beta1` |
| Endpoint | `api.bloombox.cloud` |
| Domain   | `auth.rpc.bloombox.cloud` |


*Full docs and guide coming soon.*


### Checkin API  ![Coming Soon](https://img.shields.io/badge/Coming%20Soon-lightgray.svg?style=flat-square)

| Property  | Value |
| ------------- | ------------- |
| Service  | `checkin` |
| Version  | `v1beta1` |
| Endpoint | `api.bloombox.cloud` |
| Domain   | `checkin.rpc.bloombox.cloud` |


*Full docs and guide coming soon.*


### Media API  ![Coming Soon](https://img.shields.io/badge/Coming%20Soon-lightgray.svg?style=flat-square)

| Property  | Value |
| ------------- | ------------- |
| Service  | `media` |
| Version  | `v1beta1` |
| Endpoint | `api.bloombox.cloud` |
| Domain   | `media.rpc.bloombox.cloud` |


*Full docs and guide coming soon.*


## Licensing

Copyright © 2018 Momentum Ideas Co.

A copy of the Apache 2.0 license is enclosed at `LICENSE.txt`, along with additional notices in `NOTICE.txt`. Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the license.

