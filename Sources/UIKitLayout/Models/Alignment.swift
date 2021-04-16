//
//  Layout+Alignment.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension Layout {
    enum Alignment<Spacing: RawRepresentable> {
        case horizontal(Spacing? = nil)
        case vertical(Spacing? = nil)
        case middle(Spacing? = nil)
    }
}

public extension Layout.Alignment where Spacing.RawValue == CGFloat {
    func constraint(between anchor: LayoutAnchorable,
                    and otherAnchor: LayoutAnchorable,
                    priority: UILayoutPriority) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        
        switch self {
        case let .horizontal(spacing),
             let .middle(spacing):
            constraints.append(
                anchor.centerXAnchor.constraint(equalTo: otherAnchor.centerXAnchor, constant: spacing?.rawValue ?? .zero)
            )
            
        case .vertical:
            break
        }
        
        switch self {
        case let .vertical(spacing),
             let .middle(spacing):
            constraints.append(
                anchor.centerYAnchor.constraint(equalTo: otherAnchor.centerYAnchor, constant: spacing?.rawValue ?? .zero)
            )
            
        case .horizontal:
            break
        }
        
        return constraints
    }
}
