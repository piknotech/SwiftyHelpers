//
//  DelayManager.swift
//  SwiftySnippets
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Released as a part of SwiftySnippets. https://www.github.com/fredpi/SwiftySnippets
//

import Foundation

class DelayManager {
    // MARK: - Subtypes
    /// A simple struct providing user info that is used in conjunction with a timer.
    private struct UserInfo {
        let block: () -> Void
        let identifier: String?
        let object: AnyObject?
        let qos: DispatchQoS.QoSClass?
    }

    // MARK: - Properties
    static let shared = DelayManager()

    /// All running timers
    private var timers = [Timer]()

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods: Interface
    /// The timer has to have fired or 'cancelPerform:withIndentifier:object:' must be called before starting a new perform with the same identifier.
    /// Always provide an identifier when providing an object.
    /// To run in main thread, set qos to nil.
    func by(
        _ delay: TimeInterval,
        with qos: DispatchQoS.QoSClass? = nil,
        identifier: String? = nil,
        object: AnyObject? = nil,
        block: @escaping () -> Void
    ) {
        let userInfo = UserInfo(
            block: block,
            identifier: identifier,
            object: object,
            qos: qos
        )
        let timer = Timer(
            timeInterval: delay * (AnimationInfo.slowMultiplicator),
            target: self,
            selector: #selector(fire(timer:)),
            userInfo: userInfo,
            repeats: false
        )
        timers.append(timer)
        RunLoop.main.add(timer, forMode: .commonModes)
    }

    /// Cancel timer with unique identifier and object, if existing.
    /// Return "false" if the timer with the specified identifier and object could not be found, "true" otherwise.
    @discardableResult
    func cancel(withIdentifier identifier: String?, object: AnyObject? = nil) -> Bool {
        let index = timers.index {
            guard let userInfo = $0.userInfo as? UserInfo else { fatalError() }
            return userInfo.identifier == identifier && userInfo.object === object
        }

        if let index = index {
            timers.remove(at: index).invalidate()
            return true
        }

        return false
    }

    // MARK: Helpers
    /// Perform the callback and remove the timer.
    @objc
    private func fire(timer: Timer) {
        guard let userInfo = timer.userInfo as? UserInfo else { fatalError() }
        let dispatchQueue: DispatchQueue = {
            if let qos = userInfo.qos {
                return DispatchQueue.global(qos: qos)
            } else {
                return DispatchQueue.main
            }
        }()
        dispatchQueue.async(execute: userInfo.block)

        // Remove timer
        let index = timers.index { $0 === timer }
        if let index = index {
            timers.remove(at: index)
        }
    }
}
