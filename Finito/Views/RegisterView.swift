//
//  RegisterView.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var credsView = RegisterViewViewModel()
    
    var body: some View {
        HeaderView(
            title: "Register",
            subtitle: "Where Your Productivity Journey Begins ;)",
            angle: -15,
            backgroungcolor: Color(red: 0.30, green: 0.63, blue: 0.66),
            textcolor: .white
        )
        Spacer()
        Form{
            TextField("Full Name", text: $credsView.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email Address", text: $credsView.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            TextField("Passsword", text: $credsView.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
           
            ButtonView(buttonTitle: "Register")
            {
                credsView.register()
            }
            .padding()
        }
    }
}

#Preview {
    RegisterView()
}
