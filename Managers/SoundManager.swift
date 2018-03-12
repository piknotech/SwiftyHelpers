//
//  SoundManager.swift
//  SwiftySnippets
//
//  Created by Frederick Pietschmann on 12.03.18.
//  Released as a part of SwiftySnippets. https://www.github.com/fredpi/SwiftySnippets
//

import AVFoundation
import Foundation

class SoundManager {
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
