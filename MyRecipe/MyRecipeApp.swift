//
//  MyRecipeApp.swift
//  MyRecipe
//
//  Created by Hanasrullah Halim on 14/08/2024.
//

import SwiftUI
import SwiftData
import FirebaseCore



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct MyRecipeApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
            LoginView(viewModel: AuthViewModel())
        }
        .modelContainer(sharedModelContainer)
    }
}

#Preview(body: {
    LoginView(viewModel: AuthViewModel())
})
