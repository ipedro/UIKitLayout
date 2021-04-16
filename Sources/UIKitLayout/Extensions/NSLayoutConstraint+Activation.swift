//
//  NSLayoutConstraint+Activation.swift
//  
//  Created by Pedro Almeida.
//

import UIKit

public extension NSLayoutConstraint {
    func activate(with priority: UILayoutPriority) {
        self.priority = priority
        self.isActive = true
    }
}

public extension Sequence where Element == NSLayoutConstraint {
    func activate(with priority: UILayoutPriority) {
        forEach { $0.activate(with: priority) }
    }
}
