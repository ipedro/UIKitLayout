//
//  Layout+Margins.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension Layout {
    /// Describes layout constraint relations with a type of spacing constants.
    enum Relation<Spacing: RawRepresentable> {
        case equalTo(Spacing)
        case greaterThanOrEqualTo(Spacing)
        case lessThanOrEqualTo(Spacing)
        
        public init?(spacing: Spacing) {
            self = .equalTo(spacing)
        }

        public init?(spacing: Spacing?) {
            guard let spacing = spacing else {
                return nil
            }
            self = .equalTo(spacing)
        }

        public var spacing: Spacing {
            switch self {
            case let .equalTo(spacing),
                 let .greaterThanOrEqualTo(spacing),
                 let .lessThanOrEqualTo(spacing):
                return spacing
            }
        }
    }
}

public extension Layout.Relation where Spacing.RawValue == CGFloat {
    func constraint<AnchorType>(between anchor: NSLayoutAnchor<AnchorType>, and otherAnchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
        switch self {
        case .equalTo:
            return anchor.constraint(equalTo: otherAnchor, constant: spacing.rawValue)

        case .greaterThanOrEqualTo:
            return anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: spacing.rawValue)

        case .lessThanOrEqualTo:
            return anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: spacing.rawValue)
        }
    }

    func constraint(with dimension: NSLayoutDimension) -> NSLayoutConstraint {
        switch self {
        case .equalTo:
            return dimension.constraint(equalToConstant: spacing.rawValue)

        case .greaterThanOrEqualTo:
            return dimension.constraint(greaterThanOrEqualToConstant: spacing.rawValue)

        case .lessThanOrEqualTo:
            return dimension.constraint(lessThanOrEqualToConstant: spacing.rawValue)
        }
    }
}

// MARK: - Convenience Inits

public extension Layout.Relation {
    static func equalTo(_ spacing: Spacing?) -> Layout.Relation<Spacing>? {
        guard let spacing = spacing else {
            return nil
        }
        return .equalTo(spacing)
    }

    static func greaterThanOrEqualTo(_ spacing: Spacing?) -> Layout.Relation<Spacing>? {
        guard let spacing = spacing else {
            return nil
        }
        return .greaterThanOrEqualTo(spacing)
    }

    static func lessThanOrEqualTo(_ spacing: Spacing?) -> Layout.Relation<Spacing>? {
        guard let spacing = spacing else {
            return nil
        }
        return .lessThanOrEqualTo(spacing)
    }
}
