//
//  AnimationInfo.swift
//  SwiftySnippets
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Released as a part of SwiftySnippets. https://www.github.com/piknotech/SwiftySnippets
//

import Foundation

struct AnimationInfo {
    private static let isSlow = false
    static let slowMultiplicator = isSlow ? 5.0 : 1.0

    static let defaultAnimationTime = 0.4 * slowMultiplicator
    static let shortAnimationTime = 0.3 * slowMultiplicator
    static let fastAnimationTime = 0.2 * slowMultiplicator
    // ...
}
