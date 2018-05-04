//
//  DeviceInfo.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import CoreTelephony
import Foundation

struct DeviceInfo {
    // MARK: - Initializers
    private init() { }

    // MARK: - Properties
    /// Device's model identifier
    static let modelIdentifier: String = {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return simulatorModelIdentifier
        }

        // Model identifiers can be found at https://www.theiphonewiki.com/wiki/Models
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        return machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
    }()

    /// Device's language
    static var locale: String {
        return Locale.current.identifier
    }

    /// Device's carrier
    static var carrier: String? {
        return CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName
    }

    /// Device's timezone
    static var timeZone: String? {
        return NSTimeZone.local.abbreviation()
    }
}
