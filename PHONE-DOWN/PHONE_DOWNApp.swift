//
//  PHONE_DOWNApp.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-09.
//

import SwiftUI
import Firebase

@main
struct PHONE_DOWNApp: App {
    
    init() {
        FirebaseApp.configure()
        print("Configured Firebase!")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
}
