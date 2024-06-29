//
//  ContentView.swift
//  Roadkill
//
//  Created by 이창준 on 6/29/24.
//

import SwiftUI

enum Selection: Int {
    case intro
    case record
    case reportList
}

struct ContentView: View {
    @Environment(LocationManager.self) private var locationManager
    @Environment(AudioRecordManager.self) private var recordManager
    
    @State var navigation: Selection = .record
    
    var body: some View {

        TabView(selection: $navigation) {
            Tab("매뉴얼", systemImage: "info.circle", value: .intro) {
                IntroductionView()
            }
            Tab("녹음하기", systemImage: "waveform.circle.fill", value: .record) {
                RecordView()
            }
            Tab("신고 내역", systemImage: "list.bullet", value: .reportList) {
                ReportListView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
