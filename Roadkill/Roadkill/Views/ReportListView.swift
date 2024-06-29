//
//  ReportListView.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftUI
import SwiftData
import CoreLocation

struct ReportListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Report.date, order: .reverse)
    private var reports: [Report]
        
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
                    Button {
                        report.isReported.toggle()
                    } label: {
                        Image(systemName: report.isReported ? "checkmark.square.fill" :"checkmark.square")
                            .foregroundColor(.blue)
                    }
                }
                
                let location = CLLocation(latitude: report.x, longitude: report.y)
                Text("장소: \(location)")
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
