//
//  TemporalInstant+Util.swift
//  Bloombox
//
//  Created by Sam Gammon on 9/20/19.
//

import Foundation


/// Extends `TemporalInstant` with utility methods used throughout the client and implementing apps.
extension TemporalInstant {
  /// Generate a `TemporalInstant` describing the current timestamp, with at least millisecond-level
  /// resolution. The wrapped object references the instant with the `timestamp` property.
  ///
  /// - Returns: `TemporalInstant` representing the current moment.
  public static func now() -> TemporalInstant {
    return TemporalInstant.with { builder in
      builder.timestamp = UInt64(Date().timeIntervalSince1970)
    }
  }
}
