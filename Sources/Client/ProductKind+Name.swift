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


extension ProductKind: Labelled, Named, SectionConvertible {
  /// Maps a given `ProductKind` to a `MenuSection`.
  public var section: MenuSection? {
    switch self {
      case .flowers: return .flowers
      case .extracts: return .extracts
      case .edibles: return .edibles
      case .cartridges: return .cartridges
      case .prerolls: return .prerolls
      case .apothecary: return .apothecary
      case .merchandise: return .merchandise
      case .plants: return .plants
      default: return nil
    }
  }

  /// Supply a stable name for a given product kind. This name is not suitable for use as a user-
  /// facing label - for that, see `label`.
  public var name: String? {
    return section?.name
  }

  /// Supply a user-facing label for a given product kind. This label is suitable for display in UI
  /// circumstances. For a stable enumerated name, see `name`.
  public var label: String? {
    return section?.label
  }

  /// Supply a `ProductKind` for this object, which is just itself.
  public var type: ProductKind? {
    return self
  }
}
