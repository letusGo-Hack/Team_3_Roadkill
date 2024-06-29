//
//  ContentView.swift
//  Roadkill
//
//  Created by 이창준 on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Environment(NavigationManager.self) private var navigation
    
    @Environment(LocationManager.self) private var locationManager
    @Environment(AudioRecordManager.self) private var recordManager
    
    var body: some View {
        @Bindable var navigation = navigation
        
        TabView(selection: $navigation.selection) {
            Tab("매뉴얼", systemImage: "info.circle", value: .intro) {
                IntroductionView()
            }
            Tab("녹음하기", systemImage: "waveform.circle.fill", value: .record) {
                RecordView()
                    .environment(recordManager)
                    .environment(locationManager)
            }
            Tab("신고 내역", systemImage: "list.bullet", value: .reportList) {
                ReportListView()
            }
        }
        .padding()
        .accentColor(Color(red: 235/255, green: 86/255, blue: 64/255))
    }
}

#Preview {
    ContentView()
}
