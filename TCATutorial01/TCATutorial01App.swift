//
//  TCATutorial01App.swift
//  TCATutorial01
//
//  Created by yangjs on 1/15/25.
//

import SwiftUI
import SwiftData
import ComposableArchitecture

@main
struct TCATutorial01App: App {
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
            CounterView(
                store: Store(initialState: CounterFeature.State()) {
                    CounterFeature()
                }
            )
            
        }
        .modelContainer(sharedModelContainer)
    }
}
