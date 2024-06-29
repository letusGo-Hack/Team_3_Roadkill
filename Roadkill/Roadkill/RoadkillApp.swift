//
//  RoadkillApp.swift
//  Roadkill
//
//  Created by 이창준 on 6/29/24.
//

import SwiftUI

@main
struct RoadkillApp: App {
    let locationManager: LocationManager
    let recordManager: AudioRecordManager
    
    init() {
        // 녹음
        let recordManager = AudioRecordManager()
        Task {
            await recordManager.setupAudioSession()
        }
        self.recordManager = recordManager
        
        // 위치
        let locationManager = LocationManager()
        locationManager.setupLocation()
        self.locationManager = locationManager
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(recordManager)
        .environment(locationManager)
    }
}
