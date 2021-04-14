import XCTest
@testable import Layout

final class LayoutTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Layout().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
