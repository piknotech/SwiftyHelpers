//
//  BrandingManager.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import UIKit

final class BrandingManager {
    // MARK: - Properties
    static let shared = BrandingManager()

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    func configure() {
        UITabBar.appearance().tintColor = .red
        // ... (Configure using .appearance(), call upon launch)
    }
}
