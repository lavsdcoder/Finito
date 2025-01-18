//
//  LoginView.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI

struct LoginView: View {
   
    @StateObject var credsView = LoginViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
                //header
                HeaderView(
                    title: "Finito",
                    subtitle: "From to-do to ta-da :)",
                    angle: 15,
                    backgroungcolor: Color(red: 0.89, green: 0.64, blue: 0.70),
                    textcolor: .black
                )
                
                
                //login form
                Form{
                    TextField("Email Address", text: $credsView.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $credsView.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    ButtonView(buttonTitle: "Log In")
                    {
                        credsView.login()
                    }
                    .padding()
                    
                }
                Spacer()
                //create account
                VStack{
                    Text("New around here ?")
                    NavigationLink("Create an Account", destination: RegisterView())
                    
                        .padding(.bottom,40)
                }
            }
            
        }
            
           
    }
}

#Preview {
    LoginView()
}
