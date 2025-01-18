//
//  RegisterViewViewModel.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    func register() {
        
        guard  validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self.insertUserRecord(id: userId)
        }
        
    }
    
    func insertUserRecord(id : String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asdictionary())
        
    }
    
    func validate() -> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        return true
    }
}
