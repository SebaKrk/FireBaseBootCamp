//
//  FireBaseBootCampApp.swift
//  FireBaseBootCamp
//
//  Created by Sebastian Sciuba on 08/05/2023.
//

import SwiftUI

@main
struct FireBaseBootCampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
