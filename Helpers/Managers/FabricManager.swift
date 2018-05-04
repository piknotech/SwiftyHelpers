//
//  FabricManager.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 02.05.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

/// FabricManager is a way to cleanly use Fabric with a hidden apikey file.
/// Since Crashlytics & Fabric arent't available in this project,
/// the code is commented out not to cause the project not to compile.
///
/// Documentation on how to use this exactly will be detailed in an online post yet to be written & referenced.

// swiftlint:disable all
/*
import Crashlytics
import Fabric
import Foundation

final class FabricManager {
    // MARK: - Subtypes
    enum Event {
        case someEvent
        case otherEvent(value: Int)
    }

    // MARK: - Properties
    static let shared = FabricManager()
    private var isRunning = false

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    func start() {
        if !isRunning {
            // Checking for apikey should also happen in non-prod mode
            guard let url = Bundle.main.url(forResource: "fabric.apikey", withExtension: nil) else {
                print("No fabric.apikey file found. If this is a release build, make sure to add it to target.")
                return
            }

            guard let fabricApiKey = try? String(contentsOf: url).trimmingCharacters(in: .whitespacesAndNewlines) else {
                print("Unable to read fabric.apikey file. If this is a release build, make sure to fix this error.")
                return
            }

            if VersionInfo.isProdMode {
                Crashlytics.start(withAPIKey: fabricApiKey)
                Fabric.with([Crashlytics.self, Answers.self])
                isRunning = true
            }
        }
    }

    func log(_ event: Event) {
        if isRunning {
            switch event {
            case .someEvent:
                logSomeEvent()

            case .otherEvent(let value):
                logOtherEvent(value: value)
            }
        }
    }

    // MARK: Logging Helpers
    private func logSomeEvent() {
        Answers.logCustomEvent(withName: "Some event")
    }

    private func logOtherEvent(value: Int) {
        Answers.logCustomEvent(withName: "Other event")
        Answers.logCustomEvent(withName: "Other event with value \(value)")
    }
}
*/
