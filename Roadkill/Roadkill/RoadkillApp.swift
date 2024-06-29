//
//  RoadkillApp.swift
//  Roadkill
//
//  Created by 이창준 on 6/29/24.
//

import SwiftUI

@main
struct RoadkillApp: App {
    let recordManager: AudioRecordManager
    
    init() {
        let manager = AudioRecordManager()
        Task {
            await manager.setupAudioSession()
        }
        self.recordManager = manager
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(recordManager)
    }
}
