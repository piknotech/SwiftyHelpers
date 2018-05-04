//
//  AnimationInfo.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import Foundation

struct AnimationInfo {
    // MARK: - Properties
    private static let isSlow = false
    static let slowMultiplicator = isSlow ? 5.0 : 1.0

    static let defaultAnimationTime = 0.4 * slowMultiplicator
    static let shortAnimationTime = 0.3 * slowMultiplicator
    static let fastAnimationTime = 0.2 * slowMultiplicator
    // ...

    // MARK: - Initializers
    private init() { }
}
