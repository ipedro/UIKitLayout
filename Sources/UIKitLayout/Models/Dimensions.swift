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
