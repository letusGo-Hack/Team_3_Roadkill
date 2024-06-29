//
//  AssetIntents.swift
//  Roadkill
//
//  Created by 김가람 on 6/29/24.
//

import AppIntents

//@AssistantIntent(schema: .system.search)
////@AssistantEntity(schema: .system.search)
//struct RecordAssetIntent: AudioRecordingIntent {
//    static var title: LocalizedStringResource = "Start Report"
////    static let searchScopes: [StringSearchScope] = [.general]
//    static let searchScopes: [StringSearchScope] = [.general]
//    
//    var criteria: StringSearchCriteria
//    
//    @MainActor
//    func perform() async throws -> some IntentResult {
//        // 녹음 탭 Navigation 열어주기
//        print(criteria.term)
//        return .result()
//    }
//}

struct RecordAssetIntent: AudioRecordingIntent {
    static var title: LocalizedStringResource = "로드킬 신고하기"
//    static let searchScopes: [StringSearchScope] = [.general]
//    static let searchScopes: [StringSearchScope] = [.general]
    
//    var criteria: StringSearchCriteria
    
    @MainActor
    func perform() async throws -> some IntentResult {
        // 녹음 탭 Navigation 열어주기
//        print(criteria.term)
        return .result()
    }
}
