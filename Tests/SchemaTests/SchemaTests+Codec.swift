//
//  SchemaTests+Codec.swift
//  Bloombox
//
//  Created by Sam Gammon on 10/13/18.
//

import Foundation
import OpenCannabis
import XCTest
@testable import Bloombox


extension SchemaTests {
  // MARK: Proto-Binary
  func testEncodeDecodeBinary() throws {
    let ts = UInt64(Date().timeIntervalSince1970)
    let instant = TemporalInstant.with { item in
      item.timestamp = ts
    }

    let encoded = try instant.serializedData()
    let decoded = try TemporalInstant(serializedData: encoded)

    XCTAssertEqual(ts, decoded.timestamp, "decoded timestamp must be identical")
    XCTAssertEqual(instant, decoded, "decoded model must be considered identical")

    let complex = ModelTool.generateTestModel()
    let complex2 = ModelTool.generateTestModel()

    XCTAssertEqual(complex, complex2, "two complex models that are identical should be considered identical")
    XCTAssertEqual(try complex.serializedData(), try complex2.serializedData(),
                   "serialized data from two identical complex models should also be identical")
    XCTAssertEqual(complex, try Flower(serializedData: try complex.serializedData()),
                   "inflated serialized data from a complex model should yield an identical model")

    let inventory = ModelTool.generateInventoryProduct()
    let inventory2 = ModelTool.generateInventoryProduct()

    let encodedI1 = try inventory.serializedData()
    let encodedI2 = try inventory2.serializedData()

    let decodedI1 = try InventoryProduct(serializedData: encodedI1)
    let decodedI2 = try InventoryProduct(serializedData: encodedI2)

    XCTAssertEqual(inventory, decodedI1, "two complex models trees that are identical should be considered identical")
    XCTAssertEqual(inventory2, decodedI2, "two complex models trees that are identical should be considered identical")
  }

//  func testBinaryPerformance() throws {
//    // package it in a big ol' inventory response
//    let response = POSInventoryQuery.Response.with { resp in
//      resp.item = ModelTool.generateInventory(SchemaTests.itemPerformanceTestCount)
//    }
//
//    self.measure {
//      let _ = try! response.serializedData()
//    }
//  }

  // MARK: JSON
  func testEncodeDecodeJSON() throws {
    let ts = UInt64(Date().timeIntervalSince1970)
    let instant = TemporalInstant.with { item in
      item.timestamp = ts
    }

    let encoded = try instant.jsonString()
    let encodedData = try instant.jsonUTF8Data()
    let decoded = try TemporalInstant(jsonString: encoded)
    let decodedData = try TemporalInstant(jsonUTF8Data: encodedData)

    XCTAssertEqual(ts, decoded.timestamp, "decoded timestamp from JSON string must be identical")
    XCTAssertEqual(instant, decoded, "decoded model from JSON string must be considered identical")

    XCTAssertEqual(ts, decodedData.timestamp, "decoded timestamp from JSON data must be identical")
    XCTAssertEqual(instant, decodedData, "decoded model from JSON data must be considered identical")

    let complex = ModelTool.generateTestModel()
    let complex2 = ModelTool.generateTestModel()

    XCTAssertEqual(complex, complex2, "two complex models that are identical should be considered identical")
    XCTAssertEqual(try complex.jsonString(), try complex2.jsonString(),
                   "serialized data from two identical JSON'd complex models should also be identical")
    XCTAssertEqual(complex, try Flower(jsonString: try complex.jsonString()),
                   "inflated serialized JSON string from a complex model should yield an identical model")

    XCTAssertEqual(try complex.jsonUTF8Data(), try complex2.jsonUTF8Data(),
                   "serialized data from two identical JSON'd (data) complex models should also be identical")
    XCTAssertEqual(complex, try Flower(jsonUTF8Data: try complex.jsonUTF8Data()),
                   "inflated serialized JSON data from a complex model should yield an identical model")

    let inventory = ModelTool.generateInventoryProduct()
    let inventory2 = ModelTool.generateInventoryProduct()

    let encodedI1 = try inventory.jsonString()
    let encodedI2 = try inventory2.jsonString()

    let decodedI1 = try InventoryProduct(jsonString: encodedI1)
    let decodedI2 = try InventoryProduct(jsonString: encodedI2)

    XCTAssertEqual(inventory, decodedI1, "two complex models trees that are identical should be considered identical")
    XCTAssertEqual(inventory2, decodedI2, "two complex models trees that are identical should be considered identical")
  }

//  func testJSONStringPerformance() throws {
//    // package it in a big ol' inventory response
//    let response = POSInventoryQuery.Response.with { resp in
//      resp.item = ModelTool.generateFullInventorySuite()
//    }
//
//    self.measure {
//      let _ = try! response.jsonString()
//    }
//  }
//
//  func testJSONDataPerformance() throws {
//    // package it in a big ol' inventory response
//    let response = POSInventoryQuery.Response.with { resp in
//      resp.item = ModelTool.generateInventory(SchemaTests.itemPerformanceTestCount)
//    }
//
//    self.measure {
//      let _ = try! response.jsonUTF8Data()
//    }
//  }

  // MARK: Text Format
  func testEncodeDecodeText() throws {
    let ts = UInt64(Date().timeIntervalSince1970)
    let instant = TemporalInstant.with { item in
      item.timestamp = ts
    }

    let encoded = instant.textFormatString()
    let decoded = try TemporalInstant(textFormatString: encoded)

    XCTAssertEqual(ts, decoded.timestamp, "decoded timestamp must be identical")
    XCTAssertEqual(instant, decoded, "decoded model must be considered identical")

    let complex = ModelTool.generateTestModel()
    let complex2 = ModelTool.generateTestModel()

    XCTAssertEqual(complex, complex2, "two complex models that are identical should be considered identical")
    XCTAssertEqual(complex.textFormatString(), complex2.textFormatString(),
                   "text format string from two identical complex models should also be identical")
    XCTAssertEqual(complex, try Flower(textFormatString: complex.textFormatString()),
                   "inflated text format string from a complex model should yield an identical model")
  }
}
