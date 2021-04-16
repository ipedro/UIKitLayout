//
//  NSLayouAnchor+LayoutRelation.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension NSLayoutXAxisAnchor {
    @discardableResult
    func activateConstraint<Spacing: RawRepresentable>(
        _ relation: Layout.Relation<Spacing>,
        with otherAnchor: NSLayoutXAxisAnchor,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint where Spacing.RawValue == CGFloat {
        
        let constraint = relation.constraint(between: self, and: otherAnchor)
        
        constraint.activate(with: priority)

        return constraint
    }
}

public extension NSLayoutYAxisAnchor {
    @discardableResult
    func activateConstraint<Spacing: RawRepresentable>(
        _ relation: Layout.Relation<Spacing>,
        with otherAnchor: NSLayoutYAxisAnchor,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint where Spacing.RawValue == CGFloat {
        
        let constraint = relation.constraint(between: self, and: otherAnchor)
        
        constraint.activate(with: priority)

        return constraint
    }
}

public extension NSLayoutDimension {
    @discardableResult
    func activateConstraint<Spacing: RawRepresentable>(
        _ relation: Layout.Relation<Spacing>,
        with otherDimension: NSLayoutDimension,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint where Spacing.RawValue == CGFloat {
        
        let constraint = relation.constraint(between: self, and: otherDimension)
        
        constraint.activate(with: priority)

        return constraint
    }

    @discardableResult
    func activateConstraint<Spacing: RawRepresentable>(
        _ relation: Layout.Relation<Spacing>,
        priority: UILayoutPriority
    ) -> NSLayoutConstraint where Spacing.RawValue == CGFloat {
        
        let constraint = relation.constraint(with: self)
        
        constraint.activate(with: priority)

        return constraint
    }
}
