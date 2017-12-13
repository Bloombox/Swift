//
//  RemoteService.swift
//  Client
//
//  Created by James Clark on 12/12/17.
//

import Foundation


internal protocol ClientLogic {
  func prepare()
}


internal protocol RemoteService {
  var name: String { get }
}
