//
//  NotesApp.swift
//  Notes
//
//  Created by Abraham Sánchez Juárez on 05/09/22.
//

import SwiftUI

@main
struct NotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
