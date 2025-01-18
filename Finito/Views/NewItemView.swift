//
//  NewTodoItemView.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var itemView = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)
            
            Form{
                TextField("title", text: $itemView.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $itemView.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                ButtonView(buttonTitle: "Save",
                           action: {
                    if itemView.canSave{
                        itemView.save()
                        newItemPresented = false
                    }
                    else{
                        itemView.showAlert = true
                    }
                    
                })
                .padding()
            }
            .alert( isPresented: $itemView.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all the fields and select due date as today or newer"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
