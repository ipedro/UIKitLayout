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
