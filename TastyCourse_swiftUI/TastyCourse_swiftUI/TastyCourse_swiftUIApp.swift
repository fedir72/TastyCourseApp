//
//  TastyCourse_swiftUIApp.swift
//  TastyCourse_swiftUI
//
//  Created by Fedii Ihor on 17.11.2022.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

let screen = UIScreen.main.bounds

@main
struct TastyCourse_swiftUIApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            if let user = AuthService.shared.currentUser {
                MainTabBar(viewModel: MainTabViewModel(user: user))
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
       
        func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions:
                         [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            print("ok configure")
            return true
        }
    }
}
