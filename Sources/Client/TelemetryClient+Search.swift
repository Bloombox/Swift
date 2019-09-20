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


/// Enumerates errors that may be thrown during operations related to search events.
public enum SearchEventError: Error {
  /// An unspecified internal error occurred.
  case internalError
}


/// Extends the base `TelemetryClient` with *Search Telemetry* features, which track
/// the effectiveness of full-text search features within Bloombox-connected applications. This
/// tracking essentially occurs in two phases:
///
/// - *Search query*: When the user submits a search query, and receives a response from
///   the server, an event is sent that describes the resulting state of the UI. This includes the
///   search term, the total number of results, and so on.
/// - *Search result*: When the user taps on an item in the set of returned search results, if
///    applicable, an event is sent to notify the system of a successful search. This includes
///    the index of the selected item in the returned set of results, the item's key, the property
///    that matched the user's search term on the selected product, and the count of total
///    results in the query.
///
/// ### Search Events
/// These two event types (described above) can be used to calculate metrics that describe
/// search effectiveness, on an ongoing basis. These metrics might include the "rank" or
/// position of selected search items (indicating search "effectiveness" from a user perspective),
/// or the total number of results versus the index, to calculate which page the user selected
/// an item from (indicating search *ranking* "effectiveness" from a systemic perspective).
///
/// ### API Reference
/// Methods provided include:
/// - `searchQuery`: Submit an event describing a search term and result-set pair.
/// - `searchResult`: Submit an event describing an item a user selected from a search
///   term and result-set pair.
extension TelemetryClient {
  fileprivate func resolveSearchContext(method: SearchEvent,
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
    merged.collection = EventCollection.search(method).export()
    if let user = activeUser {
      merged.userKey = user
    }
    if let order = activeOrder {
      merged.scope.order = order
    }
    merged.scope.partner = "partner/\(partnerCode)/location/\(locationCode)/device/\(deviceCode)"
    return merged
  }

  // MARK: - Search Queries

  /// Submit an event describing a *search term* and *search result-set* pair. These, together,
  /// describe the UI state after a user submits a full-text search to Bloombox catalog services.
  /// This method represents the initial state, therefore, of a search session, which may or may
  /// not terminate with one or more subsequent `searchResult` events. These inputs are
  /// defined as:
  ///
  /// - *Search term*: String of text entered by the user in a search box, without transformation,
  ///    that was used to query the search service.
  /// - *Search result-set*: Metadata about the results returned by the search service based on
  ///    the provided *search term*, including the total count of search results, which may be
  ///    any positive integer greater than `0`.
  ///
  /// - Parameter term: *Search term*, as described herein.
  /// - Parameter total: Total count of results returned for the provided *search term*.
  /// - Parameter uuid: Explicit UUID for this event.
  /// - Parameter activeUser: User that was active and who submitted this search.
  /// - Parameter activeOrder: Order record that was active, as applicable.
  /// - Parameter partner: Partner code under which to count this search query.
  /// - Parameter location: Location code at which this query is considered relevant.
  /// - Parameter deviceName: Name, or serial number, of the reporting device.
  /// - Parameter apiKey: API key to use for this operation.
  /// - Parameter context: Explicit event context to merge with global and apply.
  /// - Parameter callback: Callback to dispatch once transmission completes or errs.
  /// - Throws: Client-side errors encountered (see: `SearchEventError`).
  /// - Returns: gRPC call object, which may be used to observe or cancel the in-flight call.
  @discardableResult
  public func searchQuery(term: String,
                          total: UInt32,
                          uuid: UUID? = nil,
                          activeUser: UserKey? = nil,
                          activeOrder: OrderID? = nil,
                          partner: PartnerCode? = nil,
                          location: LocationCode? = nil,
                          deviceName: DeviceCode? = nil,
                          apiKey: APIKey? = nil,
                          context: EventContext? = nil,
                          callback: GenericEventCallback? = nil) throws -> SearchTelemetryQueryCall {
    let eventContext = try self.resolveSearchContext(
      method: .query,
      activeUser: activeUser,
      activeOrder: activeOrder,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.search.query(SearchTelemetryEvent.Query.with { builder in
      builder.term = term
      builder.totalResults = total
      builder.context = eventContext
      builder.property = .tablet
//      @TODO: explicit UUIDs
//      if let u = uuid {
        // explicit UUID is specified
//        builder.uuid = u.uuidString
//      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

  // MARK: - Search Results

  /// Submit an event describing an individual *search result* that was selected, after a user
  /// performed a search against a Bloombox catalog (see `searchQuery`). Metrics are
  /// provided that describe the position of the selected result in the set returned for the search,
  /// roughly describing the "effectiveness" of search ranking, and giving the system a signal
  /// for ranking enhancements in the future, optionally in a personalized manner. This method
  /// additionally accepts the search term that was active at the time the result was selected.
  /// Metadata inputs about the result set include, and are defined as:
  ///
  /// - *Total*: total count of results returned as part of the *search result-set*
  /// - *Selected*: index of the user-selected result, within the full *search result-set*
  /// - *Product*: key uniquely identifying the product that was selected
  /// - *Properties*: dot-path object properties that matched the *search term*
  ///
  /// - Parameter term: *Search term*, as described herein (see `searchQuery`).
  /// - Parameter total: Total count of results returned for the provided *search term*.
  /// - Parameter selected: Index of the selected item within the *search result-set*.
  /// - Parameter product: Product key uniquely identifying the selected product.
  /// - Parameter properties: Set of dot-path addressed generalized properties which
  ///   matched for the subject product (for example: `product.summary.content`).
  /// - Parameter activeUser: User that was active and selected this item.
  /// - Parameter activeOrder: Order record that was active, as applicable.
  /// - Parameter partner: Partner code under which to count this result event.
  /// - Parameter location: Location code at which this query is considered relevant.
  /// - Parameter deviceName: Name, or serial number, of the reporting device.
  /// - Parameter apiKey: API key to use for this operation.
  /// - Parameter context: Explicit event context to merge with global and apply.
  /// - Parameter callback: Callback to dispatch once transmission completes or errs.
  /// - Throws: Client-side errors encountered (see: `SearchEventError`).
  /// - Returns: gRPC call object, which may be used to observe or cancel the in-flight call.
  public func searchResult(term: String,
                           total: UInt32,
                           selected: UInt32,
                           product: ProductKey,
                           properties: Set<String>? = nil,
                           activeUser: UserKey? = nil,
                           activeOrder: OrderID? = nil,
                           partner: PartnerCode? = nil,
                           location: LocationCode? = nil,
                           deviceName: DeviceCode? = nil,
                           apiKey: APIKey? = nil,
                           context: EventContext? = nil,
                           callback: GenericEventCallback? = nil) throws -> SearchTelemetryResultCall {
    let eventContext = try self.resolveSearchContext(
      method: .result,
      activeUser: activeUser,
      activeOrder: activeOrder,
      partner: partner,
      location: location,
      deviceName: deviceName,
      apiKey: apiKey,
      context: context)

    return try self.search.result(SearchTelemetryEvent.Result.with { builder in
      builder.term = term
      builder.totalResults = total
      builder.selectedResult = selected
      builder.key = product
      builder.context = eventContext
      builder.property = .tablet
//      @TODO: explicit UUIDs
//      if let u = uuid {
        // explicit UUID is specified
//        builder.uuid = u.uuidString
//      }
    }) { (response, callResult) in
      callback?(callResult)
    }
  }

}
