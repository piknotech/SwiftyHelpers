//
//  InstallationManager.swift
//  SwiftySnippets
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Released as a part of SwiftySnippets. https://www.github.com/fredpi/SwiftySnippets
//

import Foundation

class InstallationManager {
    // MARK: - Properties
    static let shared = InstallationManager()

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    /// Takes care of storing installing data if not yet done. Should be called on launch.
    func store() {
        if InstallationInfo.dateInstalled == nil {
            InstallationInfo.dateInstalled = Date()
        }

        if InstallationInfo.versionInstalled == nil {
            InstallationInfo.versionInstalled = VersionInfo.appVersion
        }
    }
}
