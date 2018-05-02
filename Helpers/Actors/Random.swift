//
//  Random.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import UIKit

class Random {
    // MARK: - Properties
    /// Returns a random number between 0 and 1.
    static var from0to1: Double {
        return between(0, and: 1)
    }

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    /// Returns a random number between the two given bounds.
    static func between<T: Field>(_ min: T, and max: T) -> T {
        return min + (max - min) * T(arc4random()) / T(UInt32.max)
    }
}

/// A mathematical field that provides arithmetic operations.
protocol Field {
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
    init(_ any: UInt32)
}

extension Double: Field { }
extension CGFloat: Field { }
