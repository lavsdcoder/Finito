//
//  FinitoApp.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI
import FirebaseCore

@main
struct FinitoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
