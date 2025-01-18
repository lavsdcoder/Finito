//
//  ContentView.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var mainView = MainViewViewModel()
    
    var body: some View {
        
        
        if mainView.isSignedIn() && !mainView.currentuserId.isEmpty {
            accountView
            
        }
        else{
            LoginView()
        }
        
    }
    @ViewBuilder
    var accountView : some View {
        TabView{
            ToDoListView(userId : mainView.currentuserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                        }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                        }
        }
        
    }
}

#Preview {
    MainView()
}
