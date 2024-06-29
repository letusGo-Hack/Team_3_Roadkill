//
//  RecordView.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftUI
import Lottie

struct RecordView: View {
    @Environment(LocationManager.self) private var locationManager
    @Environment(AudioRecordManager.self) private var recordManager
    
    var recordingLottie = LottieView(animation: .named("recording"))
    
    var body: some View {
        VStack(spacing: 12) {
            if recordManager.isRecording {
                recordingLottie
                    .playing(loopMode: .loop)
                    .onTapGesture {
                        let startDate = recordManager.startDate
                        let startLocation = recordManager.startLocation
                        
                        recordManager.stopRecording()
                        
                        // 음성 파일 -> Text
                        // SwiftData Save
                    }
            } else {
                recordingLottie
                    .playbackMode(.paused)
                    .onTapGesture {
                        recordManager.startRecording(Date())
                    }
            }
            Text(recordManager.isRecording ? "녹음 중입니다..." : "")
                .foregroundColor(.black)
        }
        .padding(.bottom, 20)
        .onChange(of: locationManager.currentLocation) { oldValue, newValue in
            recordManager.startLocation = newValue
        }
    }
}

//#Preview {
//    RecordView()
//}
