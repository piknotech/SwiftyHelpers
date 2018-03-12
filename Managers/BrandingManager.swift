//
//  BrandingManager.swift
//  SwiftySnippets
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Released as a part of SwiftySnippets. https://www.github.com/fredpi/SwiftySnippets
//

import UIKit

class BrandingManager {
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
