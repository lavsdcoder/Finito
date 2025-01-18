//
//  NewItemViewViewModel.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import Foundation
import Firebase
import FirebaseAuth

class NewItemViewViewModel : ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){}
    
    func save() {
        
        guard canSave else{
            return
        }
        
        // get current user Id
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        //add to db
        let dbs = Firestore.firestore()
        dbs.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newItem .asdictionary())
        
    }
    
    var canSave : Bool {
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
        
    }
}
