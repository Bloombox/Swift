
import XCTest
@testable import Client


class ClientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Client().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
