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

public protocol LayoutableView: UIView {
    func installSubview(_ view: UIView,
                        withMargins layoutMargins: Layout.Margins,
                        priority: UILayoutPriority)
    
    @discardableResult
    func activateConstraints(withMargis layoutMargins: Layout.Margins,
                                      to otherObject: LayoutAnchorable,
                                      priority: UILayoutPriority) -> [NSLayoutConstraint]
    
    
    @discardableResult
    func activateConstraints(withAlignment layoutAlignment: Layout.Alignment,
                             to otherView: Self,
                             priority: UILayoutPriority) -> [NSLayoutConstraint]
    
    @discardableResult
    func setDimensions(_ layoutDimensions: Layout.Dimensions,
                                  priority: UILayoutPriority) -> [NSLayoutConstraint]
}

public extension LayoutableView {
    /// Adds a view to the end of the receiver’s list of subviews and binds it with constraints that satisfy the given layout margins.
    func installSubview(_ view: UIView,
                        withMargins layoutMargins: Layout.Margins,
                        priority: UILayoutPriority) {
        
        addSubview(view)

        activateConstraints(withMargis: layoutMargins, to: view, priority: priority)
    }

    @discardableResult
    func activateConstraints(withMargis layoutMargins: Layout.Margins,
                             to otherObject: LayoutAnchorable,
                             priority: UILayoutPriority) -> [NSLayoutConstraint] {
        
        if let otherView = otherObject as? UIView {
            otherView.translatesAutoresizingMaskIntoConstraints = false
        }

        var constraints = [NSLayoutConstraint]()

        if let topRelation = layoutMargins.top {
            constraints.append(topRelation.constraint(between: topAnchor, and: otherObject.topAnchor))
        }

        if let leadingRelation = layoutMargins.leading {
            constraints.append(leadingRelation.constraint(between: leadingAnchor, and: otherObject.leadingAnchor))
        }

        if let bottomRelation = layoutMargins.bottom {
            constraints.append(bottomRelation.constraint(between: otherObject.bottomAnchor, and: bottomAnchor))
        }

        if let trailingRelation = layoutMargins.trailing {
            constraints.append(trailingRelation.constraint(between: otherObject.trailingAnchor, and: trailingAnchor))
        }

        constraints.activate(with: priority)

        return constraints
    }
    
    
    @discardableResult
    func activateConstraints(withAlignment layoutAlignment: Layout.Alignment,
                             to otherView: Self,
                             priority: UILayoutPriority) -> [NSLayoutConstraint] {
        
        let constraints = layoutAlignment.constraint(between: self, and: otherView, priority: priority)
        
        constraints.activate(with: priority)
        
        return constraints
    }
    

    @discardableResult
    func setDimensions(_ layoutDimensions: Layout.Dimensions,
                       priority: UILayoutPriority) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()

        if let heightRelation = layoutDimensions.height {
            constraints.append(heightRelation.constraint(with: heightAnchor))
        }

        if let widthRelation = layoutDimensions.width {
            constraints.append(widthRelation.constraint(with: widthAnchor))
        }

        constraints.activate(with: priority)

        return constraints
    }
}
