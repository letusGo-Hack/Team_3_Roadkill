//
//  AssetIntents.swift
//  Roadkill
//
//  Created by 김가람 on 6/29/24.
//

import AppIntents
import AVFAudio

//struct OrderSoupIntent: AppIntent {
//    static var title: LocalizedStringResource = "OrderSoupIntent"
//
//    @Parameter(title: "Soup")
//    var soup: String
//
//
//    @Parameter(title: "Quantity")
//    var quantity: Int?
//
//
//    static var parameterSummary: some ParameterSummary {
//        Summary("Order \(\.$soup)") {
//            \.$quantity
//        }
//    }
//
//
//    func perform() async throws -> some IntentResult {
////        guard let quantity = quantity, quantity < 10 else {
////            throw .result()
////        }
////        soup.order(quantity: quantity)
//        print(Self.parameterSummary)
//        return .result()
//    }
//}
//
//struct RecordAssetIntent: AppIntent {
//    static var title: LocalizedStringResource = "로드킬 신고하기"
//    
//    @Parameter(title: "Duration", default: 10.0)
//    var duration: Double
//    
//    func perform() async throws -> some IntentResult {
//        let intent = AudioRecordManager()
//        
//        try await intent.startRecording()
//        if duration > 0 {
//            await Task.sleep(UInt64(duration * Double(NSEC_PER_SEC)))
//            try await intent.stopRecording()
//            return .result(value: "Recording started and stopped after \(duration) seconds.")
//        } else {
//            return .result(value: "Recording started successfully.")
//        }
//    }
//}
@AssistantIntent(schema: .system.search)
//@AssistantEntity(schema: .system.search)
struct RecordAssetIntent: AudioRecordingIntent {
    static var title: LocalizedStringResource = "Start Report"
//    static let searchScopes: [StringSearchScope] = [.general]
    static let searchScopes: [StringSearchScope] = [.general]
    
    var criteria: StringSearchCriteria
    
    @MainActor
    func perform() async throws -> some IntentResult {
        // 녹음 탭 Navigation 열어주기
        print(criteria.term)
        return .result()
    }
}

//enum RecordingAction: String, AppEnum {
//    case start
//    case stop
//
//    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Recording Action")
//
//    static var caseDisplayRepresentations: [RecordingAction : DisplayRepresentation] = [
//        .start: DisplayRepresentation(stringLiteral: "Start"),
//        .stop: DisplayRepresentation(stringLiteral: "Stop")
//    ]
//}
//
//struct RecordAssetIntent: AppIntent, ReturnsValue {
//    static var title: LocalizedStringResource = "로드킬 신고하기"
//
//    @Parameter(title: "Action")
//    var action: RecordingAction
//    
//    @Parameter(title: "Duration", default: 10.0)
//    var duration: Double
//    
//    @ReturnsValue
//    typealias value = String
//    
//    func perform() async throws -> some IntentResult {
//        let intent = AudioRecordManager()
//
//        switch action {
//        case .start:
//            try await intent.startRecording()
//            if duration > 0 {
//                await Task.sleep(UInt64(duration * Double(NSEC_PER_SEC)))
//                try await intent.stopRecording()
//                return .result(value: "Recording started and stopped after \(duration) seconds.")
//            } else {
//                return .result(value: "Recording started successfully.")
//            }
//        case .stop:
//            try await intent.stopRecording()
//            return .result(value: "Recording stopped successfully.")
//        }
//    }
//}

//struct StartRecording: AppIntent {
//    static var title: LocalizedStringResource = "Start Audio Recording"
//
//    func perform() async throws -> some IntentResult {
//        let intent = AudioRecordingIntent()
//        
//        do {
//            try await intent.startRecording()
//            return .result(value: "Recording started successfully.")
//        } catch {
//            return .result(value: "Failed to start recording: \(error.localizedDescription)")
//        }
//    }
//}
//
//struct StopRecording: AppIntent {
//    static var title: LocalizedStringResource = "Stop Audio Recording"
//
//    func perform() async throws -> some IntentResult {
//        let intent = AudioRecordingIntent()
//        
//        do {
//            try await intent.stopRecording()
//            return .result(value: "Recording stopped successfully.")
//        } catch {
//            return .result(value: "Failed to stop recording: \(error.localizedDescription)")
//        }
//    }
//}
