//  Copyright (c) 2021 Pedro Almeida
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

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
        let otherView = LayoutableMockView()
        
        sut.addSubview(otherView)
        otherView.activateConstraints(withMargis: .init(MockSpacing.large), to: sut, priority: .defaultLow)
        
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
