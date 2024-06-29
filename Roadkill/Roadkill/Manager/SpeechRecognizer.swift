//
//  SpeechRecognizer.swift
//  Roadkill
//
//  Created by 이창준 on 6/29/24.
//

import Foundation
import Speech

@Observable
final class SpeechRecognizer {

    enum RecognizerError: Error {
        case nilRecognizer
        case recognizerUnavailable
        case recognitionFailure
    }

    private let recognizer: SFSpeechRecognizer?

    init() throws(RecognizerError) {
        guard let recognizer = SFSpeechRecognizer() else {
            throw .nilRecognizer
        }
        self.recognizer = recognizer
    }

    /// ```swift
    /// recognizeFile(url: recordManager.audioFilePath)
    /// ```
    func recognizeFile(url: URL) async throws -> String {
        guard let recognizer = SFSpeechRecognizer() else {
            throw RecognizerError.nilRecognizer
        }

        guard recognizer.isAvailable else {
            throw RecognizerError.recognizerUnavailable
        }

        // Create and execute a speech recognition request for the audio file at the URL.
        let request = SFSpeechURLRecognitionRequest(url: url)

        return await withCheckedContinuation { continuation in
            recognizer.recognitionTask(with: request) { (result, error) in
                guard let result else {
                    // Recognition failed, so check the error for details and handle it.
                    return
                }

                if result.isFinal {
                    continuation.resume(returning: result.bestTranscription.formattedString)
                }
            }
        }
    }

}
