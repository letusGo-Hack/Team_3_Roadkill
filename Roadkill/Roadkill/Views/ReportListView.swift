//
//  ReportListView.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftUI
import SwiftData

struct ReportListView: View {
    @State private var reports: [Report] = [
            Report(date: "2024-06-29", location: "서울", text: "음성 녹음 내용", summary: "요약", isReported: true),
            Report(date: "2024-06-28", location: "경기", text: "음성 녹음 내용", summary: "요약", isReported: true),
            Report(date: "2024-06-27", location: "부산", text: "음성 녹음 내용", summary: "요약", isReported: false)
        ]
    
    @ViewBuilder
    var body: some View {
        Text("신고 내역")
            .font(.headline)
        
        List(reports, id: \.self) { report in
            VStack(alignment: .leading, spacing: 4) {
                HStack() {
                    Text("\(report.date)")
                        .font(.headline)
                    Spacer()
                    Image(systemName: report.isReported ? "checkmark.square.fill" :"checkmark.square")
                        .foregroundColor(.blue)
                }
                
                Text("장소: \(report.location)")
                    .font(.body)
                Text("내용: \(report.text)")
                    .font(.body)
                Text("요약: \(report.summary)")
                    .font(.body)
            }
        }
        .listStyle(.plain)
        .padding(.top, 8)
    }
}

#Preview {
    ReportListView()
}
