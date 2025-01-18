//
//  ToDoListViewViewModel.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import Foundation
import FirebaseFirestore


class ToDoListViewViewModel : ObservableObject{
    
    @Published var showingNewItemview = false
    private let userId: String
    
    init(userId : String){
        self.userId = userId
    }
    
    func delete(id : String){
      let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
  
}
