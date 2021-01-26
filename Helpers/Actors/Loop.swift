//
//  Loop.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import Foundation

final class Loop {
    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    /// Repeat two given bocks alternatingly.
    /// Returns the unique identifier of the loop needed for stooping it using stop().
    @discardableResult
    static func with(
        interval: Double,
        alternating block1: @escaping () -> Void,
        and block2: @escaping () -> Void
    ) -> UUID {
        let uniqueId = UUID()

        func loop() {
            GCDTiming.shared.perform(after: interval, identification: .id(uniqueId)) {
                block1()
                GCDTiming.shared.perform(after: interval, identification: .id(uniqueId)) {
                    block2()
                    loop()
                }
            }
        }

        loop()
        return uniqueId
    }

    /// Repeat a single block.
    /// Returns the unique identifier of the loop needed for stooping it using stop().
    @discardableResult
    static func with(interval: Double, block: @escaping () -> Void) -> UUID {
        return with(interval: interval, alternating: block, and: block)
    }

    /// Stop a loop with a given unique identifer.
    static func stop(withUniqueId uniqueId: UUID) {
        GCDTiming.shared.cancelTasks(matching: .id(uniqueId))
    }
}
