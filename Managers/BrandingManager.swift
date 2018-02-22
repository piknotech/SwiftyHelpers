//
//  BrandingManager.swift
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
