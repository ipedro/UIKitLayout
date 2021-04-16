//
//  NSLayouAnchor+LayoutRelation.swift
//
//  Created by Pedro Almeida.
//

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
