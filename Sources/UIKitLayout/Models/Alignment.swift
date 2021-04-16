//
//  Layout+Alignment.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension Layout {
    enum Alignment {
        case horizontal(CGFloat = .zero)
        case vertical(CGFloat = .zero)
        case middle(CGFloat = .zero)
        
        public static func horizontal<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat {
            .horizontal(spacing.rawValue)
        }
        
        public static func vertical<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat {
            .vertical(spacing.rawValue)
        }
        
        public static func middle<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat {
            .middle(spacing.rawValue)
        }
        
    }
}

public extension Layout.Alignment {
    func constraint(
        between anchor: LayoutAnchorable,
        and otherAnchor: LayoutAnchorable,
        priority: UILayoutPriority
    ) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        
        switch self {
        case let .horizontal(spacing),
             let .middle(spacing):
            constraints.append(
                anchor.centerXAnchor.constraint(equalTo: otherAnchor.centerXAnchor, constant: spacing)
            )
            
        case .vertical:
            break
        }
        
        switch self {
        case let .vertical(spacing),
             let .middle(spacing):
            constraints.append(
                anchor.centerYAnchor.constraint(equalTo: otherAnchor.centerYAnchor, constant: spacing)
            )
            
        case .horizontal:
            break
        }
        
        return constraints
    }
}
