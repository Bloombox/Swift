//
//  ShopService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


/**
 * Provides functionality for the Shop API, which supports operations related to pickup or
 * delivery ordering, member verification and enrollment, and basic shop operations.
 */
public final class ShopService: RemoteService {
  /**
   * Name of the Shop API, which is "shop".
   */
  let name = "shop"

  /**
   * Version of this service.
   */
  let version = "v1"

  /**
   * Prepare the shop service for use.
   */
  func prepare() {
  }
}
