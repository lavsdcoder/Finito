//
//  ToDoListItem.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import Foundation

struct ToDoListItem : Codable , Identifiable {
    
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func saveDone(_ state : Bool){
        isDone =  state
    }
}
