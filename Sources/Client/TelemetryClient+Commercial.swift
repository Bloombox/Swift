/**
* Copyright 2019, Momentum Ideas, Co. All rights reserved.
* Source and object computer code contained herein is the private intellectual
* property of Momentum Ideas Co., a Delaware Corporation. Use of this
* code in source form requires permission in writing before use or the
* assembly, distribution, or publishing of derivative works, for commercial
* purposes or any other purpose, from a duly authorized officer of Momentum
* Ideas Co.
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

import Foundation


/// Enumerates errors that may be thrown during operations related to commercial events.
public enum CommercialEventError: Error {
  /// An unspecified internal error occurred.
  case internalError

  /// The specified section did not match the specified product type.
  case sectionMismatch
}


/// Extends the base `TelemetryClient` with so-called *Commercial Telemetry* features. Commercial
/// events are specialized telemetry payloads which present an interface that models a standard
/// *marketing funnel*, with stages like *Impression*, *View*, and *Action*. Using these payloads for
/// for corresponding event types, rather than *Generic Telemetry*, enables rich analysis features and
/// funnel-style reporting.
///
/// ### Event Context
/// Commercial telemetry events still carry standard event telemetry, along with some extra support for
/// commercially-relevant properties. These include, where applicable:
/// - *Active user*: The active user ID can be assigned in commercial event context.
/// - *Active order*: The active order ID can be assigned in commercial event context, enabling correlation
///   between events that relate to the same order.
///
/// ### Explicit UUIDs
/// Explicit event UUIDs allow the telemetry data originator to assign unique IDs to events before they are ingested.
/// This feature enables de-duplication of events server-side, making event submission an idempotent activity. If IDs
/// are not assigned by the client, the server assigns IDs during event ingest.
///
/// ### Commercial Events
/// Commercial telemetry methods are broken up into three categories:
/// - *Section-based*: Section-level objects include *View* and *Action*.  *View* events refer to product master
///   listings, and usually accompany product impressions. Section-level *Action* events might include sorting,
///   filtering, or searching a master listing of products.
/// - *Product-based*: Product-level objects include *Impression*, *View* and *Action*. *Impression* events for
///   products specify a product that was shown as an option to a consumer, amongst other products, usually as
///   part of a master listing of products. Product *Action* events refer to occurrences like:
///   - `CART`: Adding a product to a bag or cart
///   - `ZOOM`: Zooming in on a product's photo
///   - `SHARE`: Sharing a product socially
///   - `REPORTS`: Examining detailed reports for a product
/// - *Order-based*: Order-level events are *Actions* only, and include occurrences such as:
///   - `ADD_TO_CART`: Order event corresponding to adding an item to a cart
///   - `REMOVE_FROM_CART`: Removing an item from an order's cart
///   - `RESTORE_CART`: Restoring some previous cart
///   - `ORDER_SUBMIT`: Submission of an order to a retailer
///   - `ORDER_STATUS`: Check order status from an app, kiosk, or site
///   - `ORDER_CANCEL`: Order was cancelled by the user for some reason
///
/// ### API Reference
/// Methods provided include:
///
/// #### Section Events
/// - `sectionImpression`: Record an impression for a product section.
/// - `sectionView`: Record a product master listing view event.
/// - `sectionAction`: Record an action taken on a section master listing.
///
/// #### Product Events
/// - `productImpression`: Record an impression for an individual product.
/// - `productView`: Record a view event for an individual product.
/// - `productAction`: Record an action taken on an individual product record.
///
/// #### Order Events
/// - `orderAction`: Record an action taken by a user on an order.
extension TelemetryClient {
  fileprivate func resolveCommercialContext(type: CommercialEvent,
                                            section: MenuSection? = nil,
                                            product: ProductKey? = nil,
                                            activeUser: UserKey? = nil,
                                            activeOrder: OrderID? = nil,
                                            partner: PartnerCode? = nil,
                                            location: LocationCode? = nil,
                                            deviceName: DeviceCode? = nil,
                                            apiKey: APIKey? = nil,
                                            context: EventContext? = nil) throws -> AnalyticsContext {
    let (partnerCode, locationCode, deviceCode, _) = try self.resolveContext(
      partner, location, deviceName, apiKey)

    // merge/resolve event context
    var merged: AnalyticsContext
    if let c = context {
      var exported = c.export()
      let globalContext = settings.export()
      let serialized = try globalContext.serializedData()
      try exported.merge(serializedData: serialized)
      merged = exported
    } else {
      merged = settings.export()
    }
    merged.collection = EventCollection.commercial(type).export()
    if let user = activeUser {
      merged.userKey = user
    }
    if let order = activeOrder {
      merged.scope.order = order
    }
    if let s = section?.name {
      if let p = product, let ps = p.type.section?.name {
        if ps != s {
          throw CommercialEventError.sectionMismatch
        }
        merged.scope.commercial = "section/\(ps)/product/\(p.id)"
      } else {
        merged.scope.commercial = "section/\(s)"
      }
    } else if let p = product, let ps = p.type.section?.name {
      merged.scope.commercial = "section/\(ps)/product/\(p.id)"
    }
    merged.scope.partner = "partner/\(partnerCode)/location/\(locationCode)/device/\(deviceCode)"
    return merged
  }

  // MARK: - Section Events

  /// Submit an *Impression* event for a menu section, describing an occurrence where a menu
  /// section was presented to a user as an option for navigation. The user does not have to
  /// perform any affirmative action to trigger this event.
  ///
  /// - Parameter section: Section that was shown to the user.
  /// - Parameter uuid: Explicit event UUID to affix before transmission.
  /// - Parameter activeUser: Active user at the time the section was shown.
  /// - Parameter activeOrder: Active order at the time the section was shown.
  /// - Parameter partner: Code for the partner under which this event occurred.
  /// - Parameter location: Code for the location at, or under, which this event occurred.
  /// - Parameter deviceName: Name or serial number of the reporting device.
  /// - Parameter apiKey: API key to use for this event submission operation.
  /// - Parameter context: Explicit context to merge and apply to the event.
  /// - Parameter callback: Callback to dispatch after we're done, or encounter an error.
  /// - Throws: Client-side errors for missing data (see: `CommercialEventError`).
  /// - Returns: gRPC call, which can be used to observe or cancel the in-flight operation.
  @discardableResult
  public func sectionImpression(section: MenuSection,
                                uuid: UUID? = nil,
                                activeUser: UserKey? = nil,
                                activeOrder: OrderID? = nil,
                                partner: PartnerCode? = nil,
                                location: LocationCode? = nil,
                                deviceName: DeviceCode? = nil,
                                apiKey: APIKey? = nil,
                                context: EventContext? = nil,
                                callback: GenericEventCallback? = nil) throws -> TelemetryImpressionCall {
    let eventContext = try self.resolveCommercialContext(
      type: .impression(.section),
      section: section,
      activeUser: activeUser,
      activeOrder: activeOrder,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.commercial.impression(CommercialTelemetryEvent.Impression.with { builder in
      if let id = uuid {
        builder.uuid = id.uuidString.uppercased()
      }
      builder.context = eventContext
      builder.section = SectionImpression.with { builder in
        builder.spec = SectionSpec.with { builder in
          builder.section = section
        }
        builder.occurred = TemporalInstant.now()
      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

  /// Submit a *View* event for a menu section, describing an occurrence where a user chose
  /// a given section for navigation after being presented with a set of menu sections. This event
  /// involves affirmative user action - i.e. navigating to a given menu section. It should not be
  /// sent for sections shown by default.
  ///
  /// - Parameter section: Section that was navigated to by the user.
  /// - Parameter uuid: Explicit event UUID to affix before transmission.
  /// - Parameter activeUser: Active user at the time the section was chosen.
  /// - Parameter activeOrder: Active order at the time the section was chosen.
  /// - Parameter partner: Code for the partner under which this event occurred.
  /// - Parameter location: Code for the location at, or under, which this event occurred.
  /// - Parameter deviceName: Name or serial number of the reporting device.
  /// - Parameter apiKey: API key to use for this event submission operation.
  /// - Parameter context: Explicit context to merge and apply to the event.
  /// - Parameter callback: Callback to dispatch after we're done, or encounter an error.
  /// - Throws: Client-side errors for missing data (see: `CommercialEventError`).
  /// - Returns: gRPC call, which can be used to observe or cancel the in-flight operation.
  @discardableResult
  public func sectionView(section: MenuSection,
                          uuid: UUID? = nil,
                          activeUser: UserKey? = nil,
                          activeOrder: OrderID? = nil,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          deviceName: DeviceCode? = nil,
                          apiKey: APIKey? = nil,
                          context: EventContext? = nil,
                          callback: GenericEventCallback? = nil) throws -> TelemetryViewCall {
    let eventContext = try self.resolveCommercialContext(
      type: .view(.section),
      section: section,
      activeUser: activeUser,
      activeOrder: activeOrder,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.commercial.view(CommercialTelemetryEvent.View.with { builder in
      if let id = uuid {
        builder.uuid = id.uuidString.uppercased()
      }
      builder.context = eventContext
      builder.section = SectionView.with { builder in
        builder.spec = SectionSpec.with { builder in
          builder.section = section
        }
        builder.occurred = TemporalInstant.now()
      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

  /// Submit an *Action* event for a menu section, describing an occurrence where a user
  /// performed some action within a given master-listing, bound to a menu section. This event
  /// is necessarily after a section *View*, and always involves affirmative user action.
  ///
  /// - Parameter section: Section that was acted upon to by the user.
  /// - Parameter uuid: Explicit event UUID to affix before transmission.
  /// - Parameter action: Action that was taken on the section by the user.
  /// - Parameter activeUser: Active user at the time the section was acted upon.
  /// - Parameter activeOrder: Active order at the time the section was acted upon.
  /// - Parameter partner: Code for the partner under which this event occurred.
  /// - Parameter location: Code for the location at, or under, which this event occurred.
  /// - Parameter deviceName: Name or serial number of the reporting device.
  /// - Parameter apiKey: API key to use for this event submission operation.
  /// - Parameter context: Explicit context to merge and apply to the event.
  /// - Parameter callback: Callback to dispatch after we're done, or encounter an error.
  /// - Throws: Client-side errors for missing data (see: `CommercialEventError`).
  /// - Returns: gRPC call, which can be used to observe or cancel the in-flight operation.
  @discardableResult
  public func sectionAction(section: MenuSection,
                            action: SectionActionType,
                            uuid: UUID? = nil,
                            activeUser: UserKey? = nil,
                            activeOrder: OrderID? = nil,
                            partner: PartnerCode? = nil,
                            location: LocationCode? = nil,
                            deviceName: DeviceCode? = nil,
                            apiKey: APIKey? = nil,
                            context: EventContext? = nil,
                            callback: GenericEventCallback? = nil) throws -> TelemetryActionCall {
    let eventContext = try self.resolveCommercialContext(
      type: .action(.section),
      section: section,
      activeUser: activeUser,
      activeOrder: activeOrder,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.commercial.action(CommercialTelemetryEvent.Action.with { builder in
      if let id = uuid {
        builder.uuid = id.uuidString.uppercased()
      }
      builder.context = eventContext
      builder.section = SectionAction.with { builder in
        builder.verb = action
        builder.spec = SectionSpec.with { builder in
          builder.section = section
        }
        builder.occurred = TemporalInstant.now()
      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

  // MARK: - Product Events

  /// Submit an *Impression* event for an individual product, describing an occurrence where the
  /// referenced product was presented to a user as an option for navigation, amongst a set of
  /// multiple options. The user does not have to perform any affirmative action to trigger this event.
  ///
  /// - Parameter product: Product that was shown to the user.
  /// - Parameter uuid: Explicit event UUID to affix before transmission.
  /// - Parameter activeUser: Active user at the time the product was shown.
  /// - Parameter activeOrder: Active order at the time the product was shown.
  /// - Parameter partner: Code for the partner under which this event occurred.
  /// - Parameter location: Code for the location at, or under, which this event occurred.
  /// - Parameter deviceName: Name or serial number of the reporting device.
  /// - Parameter apiKey: API key to use for this event submission operation.
  /// - Parameter context: Explicit context to merge and apply to the event.
  /// - Parameter callback: Callback to dispatch after we're done, or encounter an error.
  /// - Throws: Client-side errors for missing data (see: `CommercialEventError`).
  /// - Returns: gRPC call, which can be used to observe or cancel the in-flight operation.
  @discardableResult
  public func productImpression(product: ProductKey,
                                uuid: UUID? = nil,
                                activeUser: UserKey? = nil,
                                activeOrder: OrderID? = nil,
                                partner: PartnerCode? = nil,
                                location: LocationCode? = nil,
                                deviceName: DeviceCode? = nil,
                                apiKey: APIKey? = nil,
                                context: EventContext? = nil,
                                callback: GenericEventCallback? = nil) throws -> TelemetryImpressionCall {
    let eventContext = try self.resolveCommercialContext(
      type: .impression(.product),
      product: product,
      activeUser: activeUser,
      activeOrder: activeOrder,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.commercial.impression(CommercialTelemetryEvent.Impression.with { builder in
      if let id = uuid {
        builder.uuid = id.uuidString.uppercased()
      }
      builder.context = eventContext
      builder.product = ProductImpression.with { builder in
        builder.key = product
        builder.occurred = TemporalInstant.now()
      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

  /// Submit a *View* event for an individual product, describing an occurrence where a user chose
  /// a given product for navigation after being presented with a set of choices, usually within the
  /// context of a master listing of products. This event involves affirmative user action - i.e.
  /// navigating to a given menu section. It should not be sent for products shown by default.
  ///
  /// - Parameter product: Product that the user chose to navigate to.
  /// - Parameter uuid: Explicit event UUID to affix before transmission.
  /// - Parameter activeUser: Active user at the time the product was chosen.
  /// - Parameter activeOrder: Active order at the time the product was chosen.
  /// - Parameter partner: Code for the partner under which this event occurred.
  /// - Parameter location: Code for the location at, or under, which this event occurred.
  /// - Parameter deviceName: Name or serial number of the reporting device.
  /// - Parameter apiKey: API key to use for this event submission operation.
  /// - Parameter context: Explicit context to merge and apply to the event.
  /// - Parameter callback: Callback to dispatch after we're done, or encounter an error.
  /// - Throws: Client-side errors for missing data (see: `CommercialEventError`).
  /// - Returns: gRPC call, which can be used to observe or cancel the in-flight operation.
  @discardableResult
  public func productView(product: ProductKey,
                          uuid: UUID? = nil,
                          activeUser: UserKey? = nil,
                          activeOrder: OrderID? = nil,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          deviceName: DeviceCode? = nil,
                          apiKey: APIKey? = nil,
                          context: EventContext? = nil,
                          callback: GenericEventCallback? = nil) throws -> TelemetryViewCall {
    let eventContext = try self.resolveCommercialContext(
      type: .view(.product),
      product: product,
      activeUser: activeUser,
      activeOrder: activeOrder,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.commercial.view(CommercialTelemetryEvent.View.with { builder in
      if let id = uuid {
        builder.uuid = id.uuidString.uppercased()
      }
      builder.context = eventContext
      builder.product = ProductView.with { builder in
        builder.key = product
        builder.interactive = true
        builder.occurred = TemporalInstant.now()
      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

  /// Submit an *Action* event for an individual product, describing an occurrence where a user
  /// performed some action within a given detail-listing, bound to a known catalog product. This
  /// event is necessarily after a product *View*, and always involves affirmative user action.
  ///
  /// Some product actions, such as `CART` and `PURCHASE`, are considered *conversion*
  /// events, which, for the purposes of analytics and metering calculations, count as events that
  /// drive revenue.
  ///
  /// - Parameter section: Product that the user took action on.
  /// - Parameter uuid: Explicit event UUID to affix before transmission.
  /// - Parameter action: Action that was taken on the product by the user.
  /// - Parameter activeUser: Active user at the time the action was taken.
  /// - Parameter activeOrder: Active order at the time the product was acted upon.
  /// - Parameter partner: Code for the partner under which this event occurred.
  /// - Parameter location: Code for the location at, or under, which this event occurred.
  /// - Parameter deviceName: Name or serial number of the reporting device.
  /// - Parameter apiKey: API key to use for this event submission operation.
  /// - Parameter context: Explicit context to merge and apply to the event.
  /// - Parameter callback: Callback to dispatch after we're done, or encounter an error.
  /// - Throws: Client-side errors for missing data (see: `CommercialEventError`).
  /// - Returns: gRPC call, which can be used to observe or cancel the in-flight operation.
  @discardableResult
  public func productAction(product: ProductKey,
                            action: ProductActionType,
                            uuid: UUID? = nil,
                            activeUser: UserKey? = nil,
                            activeOrder: OrderID? = nil,
                            partner: PartnerCode? = nil,
                            location: LocationCode? = nil,
                            deviceName: DeviceCode? = nil,
                            apiKey: APIKey? = nil,
                            context: EventContext? = nil,
                            callback: GenericEventCallback? = nil) throws -> TelemetryActionCall {
    let eventContext = try self.resolveCommercialContext(
      type: .action(.product),
      product: product,
      activeUser: activeUser,
      activeOrder: activeOrder,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.commercial.action(CommercialTelemetryEvent.Action.with { builder in
      if let id = uuid {
        builder.uuid = id.uuidString.uppercased()
      }
      builder.context = eventContext
      builder.product = ProductAction.with { builder in
        builder.key = product
        builder.verb = action
        builder.occurred = TemporalInstant.now()
      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

  // MARK: - Order Events

  /// Submit an *Action* event for a commercial order, describing an occurrence where a user
  /// performed some action related to their cart, or an eligible order, or an in-flight order. This
  /// event type necessarily involves affirmative user action.
  ///
  /// Some product actions, such as `ORDER_ACCEPTED` and `ADD_TO_CART`, are considered
  /// *conversion* events, which, for the purposes of analytics and metering calculations, count as
  /// events that drive revenue.
  ///
  /// - Parameter order: Order object upon which action was taken.
  /// - Parameter uuid: Explicit event UUID to affix before transmission.
  /// - Parameter action: Action that was taken on the order by the user.
  /// - Parameter activeUser: Active user at the time the action was taken.
  /// - Parameter partner: Code for the partner under which this event occurred.
  /// - Parameter location: Code for the location at, or under, which this event occurred.
  /// - Parameter deviceName: Name or serial number of the reporting device.
  /// - Parameter apiKey: API key to use for this event submission operation.
  /// - Parameter context: Explicit context to merge and apply to the event.
  /// - Parameter callback: Callback to dispatch after we're done, or encounter an error.
  /// - Throws: Client-side errors for missing data (see: `CommercialEventError`).
  /// - Returns: gRPC call, which can be used to observe or cancel the in-flight operation.
  @discardableResult
  public func orderAction(order: Order,
                          action: OrderActionType,
                          uuid: UUID? = nil,
                          activeUser: UserKey? = nil,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          deviceName: DeviceCode? = nil,
                          apiKey: APIKey? = nil,
                          context: EventContext? = nil,
                          callback: GenericEventCallback? = nil) throws -> TelemetryActionCall {
    let eventContext = try self.resolveCommercialContext(
      type: .action(.product),
      activeUser: activeUser,
      activeOrder: order.id,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.commercial.action(CommercialTelemetryEvent.Action.with { builder in
      if let id = uuid {
        builder.uuid = id.uuidString.uppercased()
      }
      builder.context = eventContext
      builder.order = OrderAction.with { builder in
        builder.verb = action
        builder.occurred = TemporalInstant.now()
        builder.orderKey = OrderKey.with { builder in
          builder.id = order.id
        }
        builder.customer = order.customer
      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

}
