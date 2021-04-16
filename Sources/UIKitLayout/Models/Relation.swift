//
//  Layout+Margins.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension Layout {
    /// Describes layout constraint relations with a type of spacing constants.
    enum Relation: RawRepresentable {
        case equalTo(CGFloat)
        case greaterThanOrEqualTo(CGFloat)
        case lessThanOrEqualTo(CGFloat)
        
        public init?(rawValue: CGFloat) {
            self = .equalTo(rawValue)
        }

        public init?(rawValue: CGFloat?) {
            guard let spacing = rawValue else {
                return nil
            }
            self = .equalTo(spacing)
        }

        public var rawValue: CGFloat {
            switch self {
            case let .equalTo(spacing),
                 let .greaterThanOrEqualTo(spacing),
                 let .lessThanOrEqualTo(spacing):
                return spacing
            }
        }
        
        static func equalTo<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat {
            .equalTo(spacing.rawValue)
        }
        
        static func greaterThanOrEqualTo<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat {
            .greaterThanOrEqualTo(spacing.rawValue)
        }
        
        static func lessThanOrEqualTo<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat {
            .lessThanOrEqualTo(spacing.rawValue)
        }
        
    }
}

public extension Layout.Relation {
    func constraint<AnchorType>(between anchor: NSLayoutAnchor<AnchorType>, and otherAnchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
        switch self {
        case .equalTo:
            return anchor.constraint(equalTo: otherAnchor, constant: rawValue)

        case .greaterThanOrEqualTo:
            return anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: rawValue)

        case .lessThanOrEqualTo:
            return anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: rawValue)
        }
    }

    func constraint(with dimension: NSLayoutDimension) -> NSLayoutConstraint {
        switch self {
        case .equalTo:
            return dimension.constraint(equalToConstant: rawValue)

        case .greaterThanOrEqualTo:
            return dimension.constraint(greaterThanOrEqualToConstant: rawValue)

        case .lessThanOrEqualTo:
            return dimension.constraint(lessThanOrEqualToConstant: rawValue)
        }
    }
}

// MARK: - Convenience Inits

public extension Layout.Relation {
    static func equalTo<Spacing: RawRepresentable>(_ spacing: Spacing?) -> Layout.Relation? where Spacing.RawValue == CGFloat {
        guard let spacing = spacing else {
            return nil
        }
        return .equalTo(spacing.rawValue)
    }

    static func greaterThanOrEqualTo<Spacing: RawRepresentable>(_ spacing: Spacing?) -> Layout.Relation? where Spacing.RawValue == CGFloat {
        guard let spacing = spacing else {
            return nil
        }
        return .greaterThanOrEqualTo(spacing.rawValue)
    }

    static func lessThanOrEqualTo<Spacing: RawRepresentable>(_ spacing: Spacing?) -> Layout.Relation? where Spacing.RawValue == CGFloat {
        guard let spacing = spacing else {
            return nil
        }
        return .lessThanOrEqualTo(spacing.rawValue)
    }
    
    // MARK: - CGFloat
    
    static func equalTo(_ spacing: CGFloat?) -> Layout.Relation? {
        guard let spacing = spacing else {
            return nil
        }
        return .equalTo(spacing)
    }

    static func greaterThanOrEqualTo(_ spacing: CGFloat?) -> Layout.Relation? {
        guard let spacing = spacing else {
            return nil
        }
        return .greaterThanOrEqualTo(spacing)
    }

    static func lessThanOrEqualTo(_ spacing: CGFloat?) -> Layout.Relation? {
        guard let spacing = spacing else {
            return nil
        }
        return .lessThanOrEqualTo(spacing)
    }
}
