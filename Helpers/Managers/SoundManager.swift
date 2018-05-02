//
//  SoundManager.swift
//  SwiftyHelpers
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Copyright © 2018 Piknotech. All rights reserved.
//

import AVFoundation
import Foundation

final class SoundManager {
    // MARK: - Properties
    static let shared = SoundManager()

    // MARK: - Initializers
    private init() { }

    // MARK: - Methods
    func configure() {
        // Enable sound even in silent mode
        DispatchQueue.global().async {
            _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
            _ = try? AVAudioSession.sharedInstance().setActive(true)
        }
    }
}
