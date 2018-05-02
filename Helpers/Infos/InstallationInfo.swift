//
//  InstallationInfo.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import Foundation

/// Note: Use InstallationManager to store data on launch.
struct InstallationInfo {
    // MARK: - Initializers
    private init() { }

    // MARK: - Properties
    /// The version the user first installed the app with.
    static var versionInstalled: String? {
        get {
            return UserDefaults.standard.string(forKey: "InstallationInfo.versionInstalled")
        }

        set {
            UserDefaults.standard.set(newValue, forKey: "InstallationInfo.versionInstalled")
            UserDefaults.standard.synchronize()
        }
    }

    /// The date at which the user first installed the app.
    static var dateInstalled: Date? {
        get {
            return UserDefaults.standard.object(forKey: "InstallationInfo.dateInstalled") as? Date
        }

        set {
            UserDefaults.standard.set(newValue, forKey: "InstallationInfo.dateInstalled")
            UserDefaults.standard.synchronize()
        }
    }
}
