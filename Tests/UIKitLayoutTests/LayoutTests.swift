import XCTest
import UIKit
@testable import UIKitLayout

enum MockSpacing: CGFloat, RawRepresentable {
    case zero = 0
    case small = 5
    case medium = 10
    case large = 20
}

final class LayoutableMockView: UIView, LayoutableView {
    typealias Spacing = MockSpacing
}

final class UIKitLayoutTests: XCTestCase {
    
    var sut: LayoutableMockView!
    
    override func setUp() {
        super.setUp()
        
        sut = LayoutableMockView()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //XCTAssertEqual(Layout().text, "Hello, World!")
        
        
        let otherView = LayoutableMockView()
        
        sut.addSubview(otherView)
        otherView.activateConstraints(withMargis: .init(.large), to: sut, priority: .defaultLow)
        
        XCTAssertEqual(sut.constraints.count, 4)
        
        sut.constraints.forEach { constraint in
            XCTAssertEqual(constraint.priority, .defaultLow)
            XCTAssertTrue(constraint.isActive)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
