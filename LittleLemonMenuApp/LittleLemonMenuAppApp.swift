//
//  LittleLemonMenuAppApp.swift
//  LittleLemonMenuApp
//
//  Created by Navya Vohra on 2024-08-13.
//

import SwiftUI

@main
struct LittleLemonMenuAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
