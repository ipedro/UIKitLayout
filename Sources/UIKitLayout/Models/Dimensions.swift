//
//  Layout+Dimensions.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension Layout {
    /// An object that describes the layout dimensions of an element.
    struct Dimensions<Constants: RawRepresentable> {
        /// Width relation.
        public var width: Relation<Constants>?

        /// Height relation.
        public var height: Relation<Constants>?

        /// Initializes a Layout Dimensionss object.
        /// - Parameters:
        ///   - width: layout spacing
        ///   - height: layout spacing
        public init(width: Constants? = nil, height: Constants? = nil) {
            self.width  = .equalTo(width)
            self.height = .equalTo(height)
        }

        /// Initializes a Dimensionss object with equal height and width.
        /// - Parameter size: layout spacing
        public init(_ size: Constants) {
            self.width  = .equalTo(size)
            self.height = .equalTo(size)
        }

        /// Initializes a Dimensions object.
        /// - Parameters:
        ///   - width: width layout relation
        ///   - height: height layout relation
        public init(width: Relation<Constants>? = nil, height: Relation<Constants>? = nil) {
            self.width  = width
            self.height = height
        }
    }
}

// MARK: - Convenience Inits

public extension Layout.Dimensions {
    /// Creates a layout dimensions object with width equal to the given layout spacing.
    /// - Parameter spacing: width layout spacing
    /// - Returns: A layout dimension.
    static func width(_ spacing: Constants) -> Self {
        self.init(width: spacing)
    }

    /// Creates a layout dimensions object with height equal to the given layout spacing.
    /// - Parameter spacing: height layout spacing
    /// - Returns: A layout dimension.
    static func height(_ spacing: Constants) -> Self {
        self.init(height: spacing)
    }

    /// Creates a layout dimensions object with the provided width layout relation.
    /// - Parameter relation: width layout relation
    /// - Returns: A layout dimension.
    static func width(_ relation: Layout.Relation<Constants>) -> Self {
        self.init(width: relation)
    }

    /// Creates a layout dimensions object with the provided height layout relation.
    /// - Parameter relation: height layout relation
    /// - Returns: A layout dimension.
    static func height(_ relation: Layout.Relation<Constants>) -> Self {
        self.init(height: relation)
    }
}
