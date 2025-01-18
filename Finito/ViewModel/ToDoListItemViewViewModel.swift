//
//  ToDoListItemViewViewModel.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListItemViewViewModel : ObservableObject{
    init(){}
    
    func toggleIsDone(item : ToDoListItem){
        var itemcopy = item
        itemcopy.saveDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemcopy.id)
            .setData(itemcopy .asdictionary())
        
        
    }
}
