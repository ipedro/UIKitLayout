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

import UIKit

public extension NSLayoutXAxisAnchor {
    @discardableResult
    func activateConstraint(
        _ relation: Layout.Relation = .equalTo(.zero),
        with otherAnchor: NSLayoutXAxisAnchor,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint {
        
        let constraint = relation.constraint(between: self, and: otherAnchor)
        
        constraint.activate(with: priority)

        return constraint
    }
    
}

public extension NSLayoutYAxisAnchor {
    @discardableResult
    func activateConstraint(
        _ relation: Layout.Relation = .equalTo(.zero),
        with otherAnchor: NSLayoutYAxisAnchor,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint {
        
        let constraint = relation.constraint(between: self, and: otherAnchor)
        
        constraint.activate(with: priority)

        return constraint
    }
    
    @discardableResult
    func activateConstraint(
        to otherAnchor: NSLayoutYAxisAnchor,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint {
        
        let constraint = self.constraint(equalTo: otherAnchor)
        
        constraint.activate(with: priority)

        return constraint
    }
}

public extension NSLayoutDimension {
    @discardableResult
    func activateConstraint(
        _ relation: Layout.Relation,
        with otherDimension: NSLayoutDimension,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint {
        
        let constraint = relation.constraint(between: self, and: otherDimension)
        
        constraint.activate(with: priority)

        return constraint
    }

    @discardableResult
    func activateConstraint(
        _ relation: Layout.Relation,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint {
        
        let constraint = relation.constraint(with: self)
        
        constraint.activate(with: priority)

        return constraint
    }
}
