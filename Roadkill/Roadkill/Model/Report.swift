//
//  Report.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftData
import Foundation

@Model
final class Report: Hashable {
    var id: UUID = UUID()
    var date: String
    var location: String
    var text: String
    var summary: String
    var isReported: Bool
    
    init(date: String, location: String, text: String, summary: String, isReported: Bool) {
        self.date = date
        self.location = location
        self.text = text
        self.summary = summary
        self.isReported = isReported
    }
}
