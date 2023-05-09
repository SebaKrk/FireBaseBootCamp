//
//  FireBaseBootCampApp.swift
//  FireBaseBootCamp
//
//  Created by Sebastian Sciuba on 08/05/2023.
//

import SwiftUI
import Firebase

@main
struct FireBaseBootCampApp: App {
    let persistenceController = PersistenceController.shared

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("FirebaseApp.configure()")
    return true
  }
}
