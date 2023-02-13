//
//  JSquaredApp.swift
//  JSquared
//
//  Created by Justin Pauga on 2/10/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct JSquaredApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let contentViewModel = ContentViewModel(dateActivities: DateActivity.sampleData())
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: contentViewModel)
        }
    }
}
