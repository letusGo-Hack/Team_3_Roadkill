//
//  Report.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftData
import Foundation
import CoreLocation

@Model
final class Report: Hashable {
    var id: UUID = UUID()
    var date: Date
    var x: CGFloat
    var y: CGFloat
    var text: String
    var summary: String
    var isReported: Bool
    
    init(date: Date, x: CGFloat, y: CGFloat, text: String, summary: String, isReported: Bool) {
        self.date = date
        self.x = x
        self.y = y
        self.text = text
        self.summary = summary
        self.isReported = isReported
    }
}
