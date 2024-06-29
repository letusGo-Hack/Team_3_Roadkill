//
//  ContentView.swift
//  Roadkill
//
//  Created by 이창준 on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(LocationManager.self) private var locationManager
    @Environment(AudioRecordManager.self) private var recordManager
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
