//
//  FeedbackManager.swift
//  SwiftySnippets
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Released as a part of SwiftySnippets. https://www.github.com/fredpi/SwiftySnippets
//

import UIKit

class FeedbackManager {
    // MARK: - Properties
    static let shared = FeedbackManager()

    private lazy var generator: UIImpactFeedbackGenerator = {
        UIImpactFeedbackGenerator(style: .light)
    }()
    private var lastTimestamp: Double?

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    /// Gives haptic feedback to the user
    func generate() {
        let currentTimestamp = CFAbsoluteTimeGetCurrent()
        let difference = currentTimestamp - (lastTimestamp ?? 0)

        // Only perform if not just performed before
        if difference > 0.25 {
            lastTimestamp = currentTimestamp
            generator.impactOccurred()
        }
    }
}
