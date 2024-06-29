//
//  AssetIntents.swift
//  Roadkill
//
//  Created by 김가람 on 6/29/24.
//

import AppIntents
import AVFAudio

struct StartRecordIntent: AudioRecordingIntent {
    static var title: LocalizedStringResource = "로드킬 신고하기"
    static let openAppWhenRun = true
    
    @Dependency
    var navigation: NavigationManager
    
    @Dependency
    var recordManager: AudioRecordManager
    
    @Dependency
    var locationManager: LocationManager
    
    @MainActor
    func perform() async throws -> some IntentResult {
        navigation.startRecord()
        locationManager.requestLocation()
        recordManager.startRecording(Date())
        return .result()
    }
}
