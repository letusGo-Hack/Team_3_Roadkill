//
//  ShortcutsProvider.swift
//  Roadkill
//
//  Created by 김가람 on 6/29/24.
//

import AppIntents

struct RoadkillAppShortcutsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: StartRecordIntent(),
            phrases: [
                "Report \(.applicationName)"
            ],
            shortTitle: "Report",
            systemImageName: "exclamationmark.bubble"
        )
//        AppShortcut(
//            intent: OrderSoupIntent(),
//            phrases: [
//                "2Report \(.applicationName)"
//            ],
//            shortTitle: "Report",
//            systemImageName: "exclamationmark.bubble"
//        )
    }
    
}
