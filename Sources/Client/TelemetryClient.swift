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
import SwiftGRPC


// Callback Types

/// Specifies a callback for a `ping` operation. It is passed one parameter, which is the observed latency of PING to
/// PONG.
public typealias PingCallback = (Double) -> ()

/// Specifies a callback for an `event` submission operation. It is passed two parameters - the call result object, and
/// the telemetry response.
public typealias GenericEventCallback = (CallResult) -> ()


// MARK: Telemetry Service

/// Provides functionality for the Telemetry API, which supports sending event analytics data as it happens, to be
/// recorded and stored, and later analyzed.
public class TelemetryClient: RemoteService {
  /// Name of the telemtry service, which is "telemetry."
  let name = "telemetry"

  /// Version of this service with which we intend to communicate.
  let version = "v1beta4"

  // MARK: Internals

  /// Generic event telemetry service.
  internal let events: EventTelemetry

  /// Client-wide settings.
  internal let settings: Bloombox.Settings

  /// Library-internal initializer.
  public init(settings: Bloombox.Settings) {
    self.settings = settings

    // initialize events service
    events = RPCServiceFactory<EventTelemetry>.factory(
      forService: Transport.config.services.telemetry,
      withSettings: self.settings)
  }
}
