//
//  Layout+Margins.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension Layout {
    /// An object that describes the layout margin relationship between elements.
    struct Margins<Spacing: RawRepresentable> {
        /// Top margin relation.
        public var top: Relation<Spacing>?

        /// Leading margin relation.
        public var leading: Relation<Spacing>?

        /// Bottom margin relation.
        public var bottom: Relation<Spacing>?

        /// Trailing margin relation.
        public var trailing: Relation<Spacing>?

        /// Initializes a Layout Margins object.
        /// - Parameters:
        ///   - top: margin spacing
        ///   - leading: margin spacing
        ///   - bottom: margin spacing
        ///   - trailing: margin spacing
        public init(
            top: Spacing? = nil,
            leading: Spacing? = nil,
            bottom: Spacing? = nil,
            trailing: Spacing? = nil
        ) {
            self.top      = .equalTo(top)
            self.leading  = .equalTo(leading)
            self.trailing = .equalTo(trailing)
            self.bottom   = .equalTo(bottom)
        }

        /// Initializes a Layout Margins object with equal spacing on top, leading, trailing and bottom.
        /// - Parameter spacing: layout spacing
        public init(_ spacing: Spacing) {
            self.top      = .equalTo(spacing)
            self.leading  = .equalTo(spacing)
            self.trailing = .equalTo(spacing)
            self.bottom   = .equalTo(spacing)
        }

        /// Initializes a Layout Margins object.
        /// - Parameters:
        ///   - top: layout relation
        ///   - leading: layout relation
        ///   - bottom: layout relation
        ///   - trailing: layout relation
        public init(
            top: Relation<Spacing>? = nil,
            leading: Relation<Spacing>? = nil,
            bottom: Relation<Spacing>? = nil,
            trailing: Relation<Spacing>? = nil
        ) {
            self.top      = top
            self.leading  = leading
            self.trailing = trailing
            self.bottom   = bottom
        }

        /// Initializes a Layout Margins object applying the given relation on top, leading, trailing and bottom.
        /// - Parameters:
        ///   - relation: layout relation
        public init(_ relation: Relation<Spacing>) {
            self.top      = relation
            self.leading  = relation
            self.trailing = relation
            self.bottom   = relation
        }
    }
}

// MARK: - Convenience Inits

public extension Layout.Margins {
    /// Initializes a Layout Margins object with top margin binding.
    static func top(_ spacing: Spacing) -> Self {
        self.init(top: spacing)
    }

    /// Initializes a Layout Margins object with top relation.
    static func top(_ relation: Layout.Relation<Spacing>) -> Self {
        self.init(top: relation)
    }

    /// Initializes a Layout Margins object with leading margin binding.
    static func leading(_ spacing: Spacing) -> Self {
        self.init(leading: spacing)
    }

    /// Initializes a Layout Margins object with leading relation.
    static func leading(_ relation: Layout.Relation<Spacing>) -> Self {
        self.init(leading: relation)
    }

    /// Initializes a Layout Margins object with bottom margin binding.
    static func bottom(_ spacing: Spacing) -> Self {
        self.init(bottom: spacing)
    }

    /// Initializes a Layout Margins object with bottom relation.
    static func bottom(_ relation: Layout.Relation<Spacing>) -> Self {
        self.init(bottom: relation)
    }

    /// Initializes a Layout Margins object with trailing margin binding.
    static func trailing(_ spacing: Spacing) -> Self {
        self.init(trailing: spacing)
    }

    /// Initializes a Layout Margins object with trailing relation.
    static func trailing(_ relation: Layout.Relation<Spacing>) -> Self {
        self.init(trailing: relation)
    }
}
