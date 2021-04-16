//
//  Layout+Margins.swift
//
//  Created by Pedro Almeida.
//

import UIKit

public extension Layout {
    /// An object that describes the layout margin relationship between elements.
    struct Margins {
        /// Top margin relation.
        public var top: Relation?

        /// Leading margin relation.
        public var leading: Relation?

        /// Bottom margin relation.
        public var bottom: Relation?

        /// Trailing margin relation.
        public var trailing: Relation?

        // MARK: - CGFloat
        
        /// Initializes a Layout Margins object.
        /// - Parameters:
        ///   - top: margin spacing
        ///   - leading: margin spacing
        ///   - bottom: margin spacing
        ///   - trailing: margin spacing
        public init(
            top: CGFloat? = nil,
            leading: CGFloat? = nil,
            bottom: CGFloat? = nil,
            trailing: CGFloat? = nil
        ) {
            self.top      = .equalTo(top)
            self.leading  = .equalTo(leading)
            self.trailing = .equalTo(trailing)
            self.bottom   = .equalTo(bottom)
        }

        /// Initializes a Layout Margins object with equal spacing on top, leading, trailing and bottom.
        /// - Parameter spacing: layout spacing
        public init(_ spacing: CGFloat) {
            self.top      = .equalTo(spacing)
            self.leading  = .equalTo(spacing)
            self.trailing = .equalTo(spacing)
            self.bottom   = .equalTo(spacing)
        }
        
        // MARK: - Spacing
        
        /// Initializes a Layout Margins object.
        /// - Parameters:
        ///   - top: margin spacing
        ///   - leading: margin spacing
        ///   - bottom: margin spacing
        ///   - trailing: margin spacing
        public init<Spacing: RawRepresentable>(
            top: Spacing? = nil,
            leading: Spacing? = nil,
            bottom: Spacing? = nil,
            trailing: Spacing? = nil
        ) where Spacing.RawValue == CGFloat {
            self.top      = .equalTo(top?.rawValue)
            self.leading  = .equalTo(leading?.rawValue)
            self.trailing = .equalTo(trailing?.rawValue)
            self.bottom   = .equalTo(bottom?.rawValue)
        }

        /// Initializes a Layout Margins object with equal spacing on top, leading, trailing and bottom.
        /// - Parameter spacing: layout spacing
        public init<Spacing: RawRepresentable>(_ spacing: Spacing) where Spacing.RawValue == CGFloat {
            self.top      = .equalTo(spacing.rawValue)
            self.leading  = .equalTo(spacing.rawValue)
            self.trailing = .equalTo(spacing.rawValue)
            self.bottom   = .equalTo(spacing.rawValue)
        }
        
        // MARK: - Relation
        
        /// Initializes a Layout Margins object.
        /// - Parameters:
        ///   - top: layout relation
        ///   - leading: layout relation
        ///   - bottom: layout relation
        ///   - trailing: layout relation
        public init(
            top: Relation? = nil,
            leading: Relation? = nil,
            bottom: Relation? = nil,
            trailing: Relation? = nil
        ) {
            self.top      = top
            self.leading  = leading
            self.trailing = trailing
            self.bottom   = bottom
        }

        /// Initializes a Layout Margins object applying the given relation on top, leading, trailing and bottom.
        /// - Parameters:
        ///   - relation: layout relation
        public init(_ relation: Relation) {
            self.top      = relation
            self.leading  = relation
            self.trailing = relation
            self.bottom   = relation
        }
    }
}

// MARK: - Convenience Inits

public extension Layout.Margins {
    /// Initializes a Layout Margins object with top relation.
    static func top(_ relation: Layout.Relation) -> Self {
        self.init(top: relation)
    }
    
    /// Initializes a Layout Margins object with leading relation.
    static func leading(_ relation: Layout.Relation) -> Self {
        self.init(leading: relation)
    }
    
    /// Initializes a Layout Margins object with bottom relation.
    static func bottom(_ relation: Layout.Relation) -> Self {
        self.init(bottom: relation)
    }
    
    /// Initializes a Layout Margins object with trailing relation.
    static func trailing(_ relation: Layout.Relation) -> Self {
        self.init(trailing: relation)
    }
    
    // MARK: - CGFloat RawReprestable
    
    /// Initializes a Layout Margins object with top margin binding.
    static func top<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat{
        self.init(top: spacing.rawValue)
    }
    
    /// Initializes a Layout Margins object with leading margin binding.
    static func leading<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat{
        self.init(leading: spacing.rawValue)
    }

    /// Initializes a Layout Margins object with bottom margin binding.
    static func bottom<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat{
        self.init(bottom: spacing.rawValue)
    }

    /// Initializes a Layout Margins object with trailing margin binding.
    static func trailing<Spacing: RawRepresentable>(_ spacing: Spacing) -> Self where Spacing.RawValue == CGFloat{
        self.init(trailing: spacing.rawValue)
    }
    
    // MARK: - CGFloat
    
    /// Initializes a Layout Margins object with top margin binding.
    static func top(_ spacing: CGFloat) -> Self {
        self.init(top: spacing)
    }
    
    /// Initializes a Layout Margins object with leading margin binding.
    static func leading(_ spacing: CGFloat) -> Self {
        self.init(leading: spacing)
    }

    /// Initializes a Layout Margins object with bottom margin binding.
    static func bottom(_ spacing: CGFloat) -> Self {
        self.init(bottom: spacing)
    }

    /// Initializes a Layout Margins object with trailing margin binding.
    static func trailing(_ spacing: CGFloat) -> Self {
        self.init(trailing: spacing)
    }
}
