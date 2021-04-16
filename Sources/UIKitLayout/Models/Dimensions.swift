//
//  Layout+Dimensions.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension Layout {
    /// An object that describes the layout dimensions of an element.
    struct Dimensions {
        /// Width relation.
        public var width: Relation?

        /// Height relation.
        public var height: Relation?

        /// Initializes a Layout Dimensionss object.
        /// - Parameters:
        ///   - width: layout spacing
        ///   - height: layout spacing
        public init(width: CGFloat? = nil, height: CGFloat? = nil) {
            self.width  = .equalTo(width)
            self.height = .equalTo(height)
        }

        /// Initializes a Dimensionss object with equal height and width.
        /// - Parameter size: layout spacing
        public init(_ size: CGFloat) {
            self.width  = .equalTo(size)
            self.height = .equalTo(size)
        }
        
        /// Initializes a Layout Dimensionss object.
        /// - Parameters:
        ///   - width: layout spacing
        ///   - height: layout spacing
        public init<Spacing: RawRepresentable>(width: Spacing? = nil, height: Spacing? = nil) where Spacing.RawValue == CGFloat {
            self.width  = .equalTo(width)
            self.height = .equalTo(height)
        }

        /// Initializes a Dimensionss object with equal height and width.
        /// - Parameter size: layout spacing
        public init<Spacing: RawRepresentable>(_ size: Spacing) where Spacing.RawValue == CGFloat {
            self.width  = .equalTo(size)
            self.height = .equalTo(size)
        }

        /// Initializes a Dimensions object.
        /// - Parameters:
        ///   - width: width layout relation
        ///   - height: height layout relation
        public init(width: Relation? = nil, height: Relation? = nil) {
            if let width = width {
                self.width  = width
            }
            if let height = height {
                self.height = height
            }
        }
    }
}

// MARK: - Convenience Inits

public extension Layout.Dimensions {
    /// Creates a layout dimensions object with width equal to the given layout spacing.
    /// - Parameter spacing: width layout spacing
    /// - Returns: A layout dimension.
    static func width<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat {
        self.init(width: spacing)
    }

    /// Creates a layout dimensions object with height equal to the given layout spacing.
    /// - Parameter spacing: height layout spacing
    /// - Returns: A layout dimension.
    static func height<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat {
        self.init(height: spacing)
    }

    /// Creates a layout dimensions object with the provided width layout relation.
    /// - Parameter relation: width layout relation
    /// - Returns: A layout dimension.
    static func width(_ relation: Layout.Relation) -> Self {
        self.init(width: relation)
    }

    /// Creates a layout dimensions object with the provided height layout relation.
    /// - Parameter relation: height layout relation
    /// - Returns: A layout dimension.
    static func height(_ relation: Layout.Relation) -> Self {
        self.init(height: relation)
    }
}
