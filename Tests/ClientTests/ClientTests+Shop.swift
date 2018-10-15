//
//  ClientTests+Shop.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import Foundation
import XCTest
@testable import Bloombox


extension ClientTests {
  // MARK: - Shop Tests
  func testShopInfo() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM",
      partner: "caliva",
      location: "sjc"))

    let status: ShopInfo.Response = try client.shop.info()
    assert(status.isInitialized, "we should get a shop info response")
  }

  func testShopInfoPerformance() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM",
      partner: "caliva",
      location: "sjc"))

    self.measure {
      if let _ = try? client.shop.info() {
        // we're good
      } else {
        XCTFail("failed to retrieve shop info: cannot measure performance")
      }
    }
  }

  func testMemberVerify() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM",
      partner: "abatin",
      location: "sacramento"))

    let result = try client.shop.verifyMember(email: "sam@bloombox.io")
    assert(result.verified, "valid customer should verify")
  }

  func testMemberVerifyPerformance() throws {
    let client: Bloombox = Bloombox(settings: Bloombox.Settings(
      apiKey: "AIzaSyA17mIw4tWGe-GsqRhdpUDfLAn_KZ_zbcM",
      partner: "abatin",
      location: "sacramento"))

    self.measure {
      if let _ = try? client.shop.verifyMember(email: "sam@bloombox.io") {
        // we're good
      } else {
        XCTFail("failed to retrieve shop info: cannot measure performance")
      }
    }
  }
}
