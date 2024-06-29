//
//  RecordView.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftUI
import Lottie

struct RecordView: View {
    @Environment(AudioRecordManager.self) private var recordManager
    
    var recordingLottie = LottieView(animation: .named("recording"))
    
    var body: some View {
        VStack(spacing: 12) {
            if recordManager.isRecording {
                recordingLottie
                    .playing(loopMode: .loop)
                    .onTapGesture {
                        recordManager.isRecording.toggle()
                    }
            } else {
                recordingLottie
                    .playbackMode(.paused)
                    .onTapGesture {
                        recordManager.isRecording.toggle()
                    }
            }
            Text(recordManager.isRecording ? "녹음 중입니다..." : "")
                .foregroundColor(.black)
        }
        .padding(.bottom, 20)
        
    }
}

//#Preview {
//    RecordView()
//}
