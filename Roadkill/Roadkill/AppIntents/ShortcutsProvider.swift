//
//  ShortcutsProvider.swift
//  Roadkill
//
//  Created by 김가람 on 6/29/24.
//

import AppIntents

struct ExampleAppShortcutsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: RecordAssetIntent(),
            phrases: [
                "Report \(.applicationName)"
            ],
            shortTitle: "Report",
            systemImageName: "exclamationmark.bubble"
        )
    }
    
}
