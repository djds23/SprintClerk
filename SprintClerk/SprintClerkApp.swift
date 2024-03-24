//
//  SprintClerkApp.swift
//  SprintClerk
//
//  Created by Dean Silfen on 3/23/24.
//

import ClerkKit
import SwiftUI
import SwiftData

@main
struct SprintClerkApp: App {
    @State var standup = Standup(today: .emptyDay, yesterday: .completedDay)
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            StandupView(standup: $standup)
        }
        .keyboardShortcut(KeyEquivalent("y"), modifiers: [.command, .shift])
        .keyboardShortcut(KeyEquivalent("t"), modifiers: [.command, .shift])
        .modelContainer(sharedModelContainer)
    }
}



