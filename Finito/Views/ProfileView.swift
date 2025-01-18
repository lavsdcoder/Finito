//
//  ProfileView.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileView = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = profileView.user{
                    profile(user : user)
                }
                else{
                    Text("Loading profile ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            profileView.fetchUser()
        }
       
    }
    @ViewBuilder
    func profile(user : User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125 , height: 125)
            .foregroundColor(.blue)
            .padding()
        VStack{
            HStack{
                Text("Name : ")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack{
                Text("Email : ")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack{
                Text("Member Since : ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
            Button("Log Out") {
                profileView.logout()
            }
            .tint(.red)
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
