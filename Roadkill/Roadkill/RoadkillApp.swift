//
//  RoadkillApp.swift
//  Roadkill
//
//  Created by 이창준 on 6/29/24.
//

import AppIntents
import SwiftUI
import SwiftData

@main
struct RoadkillApp: App {
    let navigationManager: NavigationManager
    
    let locationManager: LocationManager
    let recordManager: AudioRecordManager
    
    var modelContainer: ModelContainer = {
        let schema = Schema([Report.self])
        let modelConfiguration = ModelConfiguration(schema: schema)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        let navigationManager = NavigationManager()
        
        // 녹음
        let recordManager = AudioRecordManager()
        Task {
            await recordManager.setupAudioSession()
        }
        
        // 위치
        let locationManager = LocationManager()
        locationManager.setupLocation()
        
        AppDependencyManager.shared.add(dependency: navigationManager)
        AppDependencyManager.shared.add(dependency: recordManager)
        AppDependencyManager.shared.add(dependency: locationManager)
        
        self.recordManager = recordManager
        self.locationManager = locationManager
        self.navigationManager = navigationManager
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(navigationManager)
        .environment(recordManager)
        .environment(locationManager)
    }
}
