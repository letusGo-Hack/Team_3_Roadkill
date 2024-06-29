//
//  AudioRecordManager.swift
//  Roadkill
//
//  Created by 김가람 on 6/29/24.
//

import AVFoundation

@Observable
final class AudioRecordManager {
    static let audioFileName = "recording.m4a"

    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    
    var isRecording: Bool = false
    var isPlaying: Bool = false

    private var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    var audioFilePath: URL {
        return documentsDirectory.appending(path: Self.audioFileName, directoryHint: .notDirectory)
    }

    func setupAudioSession() async {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            if await AVAudioApplication.requestRecordPermission() {
                // The user grants access. Present recording interface.
            } else {
                // The user denies access. Present a message that indicates
                // that they can change their permission settings in the
                // Privacy & Security section of the Settings app.
            }
        } catch {
            print("Failed to set up audio session: \(error.localizedDescription)")
        }
    }
    
    func startRecording() {
        let audioFilename = audioFilePath
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            isRecording = true
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord)
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
        } catch (let error) {
            print(error.localizedDescription)
            stopRecording(finish: false)
        }
    }
    
    func stopRecording(finish: Bool) {
        audioRecorder?.stop()
        audioRecorder = nil
        
        isRecording = false
    }
}

extension AudioRecordManager {
    func playRecording() {
        let audioFilename = audioFilePath
        do {
            isPlaying = true
            
            audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
            stopPlayer()
        }
    }
    
    func stopPlayer() {
        audioPlayer?.stop()
        audioPlayer = nil
        
        isPlaying = false
    }
}
