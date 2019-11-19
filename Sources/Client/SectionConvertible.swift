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


/// Describes an object that can be used as a `MenuSection` or a `ProductKind` interchangeably.
public protocol SectionConvertible {
  /// Supply a `ProductKind` for this section-convertible object.
  var type: ProductKind? { get }

  /// Supply a `MenuSection` for this section-convertible object.
  var section: MenuSection? { get }
}
