//
//  LoopManager.swift
//  SwiftySnippets
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import Foundation

class LoopManager {
    // MARK: - Properties
    static let shared = LoopManager()

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    /// Repeat two given bocks alternatingly.
    /// Returns the unique identifier of the loop needed for stooping it using stop().
    @discardableResult
    func with(
        interval: Double,
        alternating block1: @escaping () -> Void,
        and block2: @escaping () -> Void
    ) -> String {
        let uniqueId = UUID().uuidString

        func loop() {
            DelayManager.shared.by(interval, identifier: uniqueId) {
                block1()
                DelayManager.shared.by(interval, identifier: uniqueId) {
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
    func with(interval: Double, block: @escaping () -> Void) -> String {
        return with(interval: interval, alternating: block, and: block)
    }

    /// Stop a loop with a given unique identifer.
    func stop(withUniqueId uniqueId: String) {
        DelayManager.shared.cancel(withIdentifier: uniqueId)
    }
}
