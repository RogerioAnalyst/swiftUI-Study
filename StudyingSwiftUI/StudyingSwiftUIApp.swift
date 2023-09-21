//
//  StudyingSwiftUIApp.swift
//  StudyingSwiftUI
//
//  Created by Rogerio Cardoso Filho on 20/09/23.
//

import SwiftUI

@main
struct StudyingSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
