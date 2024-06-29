//
//  RecordView.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftUI
import Lottie

struct RecordView: View {
    @State var isRecording: Bool = false
    var recordingLottie = LottieView(animation: .named("recording"))
    
    var body: some View {
        VStack(spacing: 12) {
            if isRecording {
                recordingLottie
                    .playing(loopMode: .loop)
                    .onTapGesture {
                        isRecording.toggle()
                    }
            } else {
                recordingLottie
                    .playbackMode(.paused)
                    .onTapGesture {
                        isRecording.toggle()
                    }
            }
            Text(isRecording ? "녹음 중입니다..." : "")
                .foregroundColor(.black)
        }
        .padding(.bottom, 20)
        
    }
}

#Preview {
    RecordView()
}
