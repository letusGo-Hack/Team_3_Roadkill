//
//  NavigationManager.swift
//  Roadkill
//
//  Created by 김가람 on 6/29/24.
//

import Foundation
import SwiftUI

@MainActor @Observable
final class NavigationManager {
    enum Selection: Int {
        case intro
        case record
        case reportList
    }

    // MARK: Properties

    var introPath = NavigationPath()
    var recordPath = NavigationPath()
    var reportListPath = NavigationPath()

    var selection = Selection.record
    
    // MARK: Methods
    func startRecord() {
        selection = .record
        recordPath = NavigationPath()
    }
}
