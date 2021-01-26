//
//  Created by David Knothe on 09.04.19.
//  Copyright © 2019 - 2021 Piknotech. All rights reserved.
//

import Foundation

/// Synchronize a code of block, so only one thread can enter it at any given time.
public func synchronized<T>(_ object: AnyObject, _ closure: () -> T) -> T {
    objc_sync_enter(object)
    defer { objc_sync_exit(object) }
    return closure()
}
