//
//  DeviceInfo.swift
//

import CoreTelephony
import Foundation

struct DeviceInfo {
    /// Device's model name
    static let modelName: String = {
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
    static var carrier: String {
        return CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName ?? ""
    }

    /// Device's timezone
    static var timeZone: String {
        return NSTimeZone.local.abbreviation() ?? ""
    }
}
