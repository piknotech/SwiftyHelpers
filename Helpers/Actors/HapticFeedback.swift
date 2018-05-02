//
//  HapticFeedback.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import UIKit

class HapticFeedback {
    // MARK: - Properties
    private static var generator: UIImpactFeedbackGenerator = {
        UIImpactFeedbackGenerator(style: .light)
    }()
    private static var lastTimestamp: Double?

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    /// Gives haptic feedback to the user
    static func generate() {
        let currentTimestamp = CFAbsoluteTimeGetCurrent()
        let difference = currentTimestamp - (lastTimestamp ?? 0)

        // Only perform if not just performed before
        if difference > 0.25 {
            lastTimestamp = currentTimestamp
            generator.impactOccurred()
        }
    }
}
