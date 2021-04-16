//
//  LayoutableView.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public protocol LayoutableView: UIView {
    associatedtype Spacing: RawRepresentable
    
    typealias Margins = Layout.Margins<Spacing>
    
    typealias Alignment = Layout.Alignment<Spacing>
    
    typealias Dimensions = Layout.Dimensions<Spacing>
    
    func installSubview(_ view: UIView,
                        withMargins layoutMargins: Margins,
                        priority: UILayoutPriority)
    
    @discardableResult
    func activateConstraints(withMargis layoutMargins: Margins,
                                      to otherObject: LayoutAnchorable,
                                      priority: UILayoutPriority) -> [NSLayoutConstraint]
    
    
    @discardableResult
    func activateConstraints(withAlignment layoutAlignment: Alignment,
                             to otherView: Self,
                             priority: UILayoutPriority) -> [NSLayoutConstraint]
    
    @discardableResult
    func setDimensions(_ layoutDimensions: Dimensions,
                                  priority: UILayoutPriority) -> [NSLayoutConstraint]
}

public extension LayoutableView where Spacing.RawValue == CGFloat {
    /// Adds a view to the end of the receiver’s list of subviews and binds it with constraints that satisfy the given layout margins.
    func installSubview(_ view: UIView,
                        withMargins layoutMargins: Margins,
                        priority: UILayoutPriority) {
        
        addSubview(view)

        activateConstraints(withMargis: layoutMargins, to: view, priority: priority)
    }

    @discardableResult
    func activateConstraints(withMargis layoutMargins: Margins,
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
    func activateConstraints(withAlignment layoutAlignment: Alignment,
                             to otherView: Self,
                             priority: UILayoutPriority) -> [NSLayoutConstraint] {
        
        let constraints = layoutAlignment.constraint(between: self, and: otherView, priority: priority)
        
        constraints.activate(with: priority)
        
        return constraints
    }
    

    @discardableResult
    func setDimensions(_ layoutDimensions: Dimensions,
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
