//
//  ProyectoAppApp.swift
//  ProyectoApp
//
//  Created by Alumno on 18/09/23.
//

import SwiftUI
import SwiftData

@main
struct ProyectoAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Publication.self,
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
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
