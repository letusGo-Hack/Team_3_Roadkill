//
//  SpeechRecognizer.swift
//  Roadkill
//
//  Created by 이창준 on 6/29/24.
//

import Foundation
import AVFoundation
import Speech

actor SpeechRecognizer {

    enum RecognizerError: Error {
        case nilRecognizer
        case recognizerUnavailable
    }

    private let recognizer: SFSpeechRecognizer?

    init() throws {
        guard let recognizer = SFSpeechRecognizer() else {
            throw RecognizerError.nilRecognizer
        }
        self.recognizer = recognizer

//        do {
//            try self.requestAuthorization()
//        } catch {
//            throw error
//        }
    }

    nonisolated func requestAuthorization() throws {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            switch authStatus {
            case .notDetermined:
                print("not determined")
            case .denied:
                print("Denied")
            case .restricted:
                print("Restricted")
            case .authorized:
                print("Authorized")
            @unknown default:
                fatalError()
            }
        }
    }

    func recognizeFile(url: URL) throws(RecognizerError) {
        guard let recognizer = SFSpeechRecognizer() else {
            throw .nilRecognizer
        }

        guard recognizer.isAvailable else {
            throw .recognizerUnavailable
        }

        // Create and execute a speech recognition request for the audio file at the URL.
        let request = SFSpeechURLRecognitionRequest(url: url)
        recognizer.recognitionTask(with: request) { [weak self] (result, error) in
            self?.handleRecognition(result: result, error: error)
        }
    }

    nonisolated private func handleRecognition(result: SFSpeechRecognitionResult?, error: Error?) {
        guard let result else {
            // Recognition failed, so check the error for details and handle it.
            return
        }

        // Print the speech transcription with the highest confidence that the
        // system recognized.
        if result.isFinal {
            print(result.bestTranscription.formattedString)
        }
    }

}
