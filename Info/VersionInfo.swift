//
//  VersionInfo.swift
//

import UIKit

struct VersionInfo {
    /// App's version
    static var appVersion: String {
        guard let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String else {
            fatalError("Unable to read CFBundleShortVersionString from plist")
        }

        return version
    }

    /// App's build number
    static var appBuild: String {
        guard let build = Bundle.main.infoDictionary!["CFBundleVersion"] as? String else {
            fatalError("Unable to read CFBundleVersion from plist")
        }

        return build
    }

    /// Version number of the operating system
    static var systemVersion: String {
        return UIDevice.current.systemVersion
    }

    /// Determines whether the app is running in production mode or not
    static var isProdMode: Bool {
        #if DEBUG
            return false
        #else
            return true
        #endif
    }
}
