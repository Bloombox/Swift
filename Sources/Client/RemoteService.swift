//
//  RemoteService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


/**
 * Basic client-side logic protocol. Simply specifies a `prepare` function that is dispatched
 * early in client initialization flow to ready any necessary stuff before the library operates.
 */
internal protocol ClientLogic {
  /**
   * Prepare this object for use.
   */
  func prepare()
}


/**
 * Specifies a remotely-supported service. Complies with `ClientLogic` so that it may be prepared
 * early in the execution flow. Also supports a name for logging.
 */
internal protocol RemoteService: ClientLogic {
  /**
   * Specify a simple string name for this remote service. Used for debugging, logging, and other
   * basic operations.
   */
  var name: String { get }

  /**
   * Specifies the named version of this service with which we intend to communicate.
   */
  var version: String { get }

  /**
   * Specifies a mount point for client-wide settings.
   */
  var settings: BloomboxClient.Settings { get }
}
