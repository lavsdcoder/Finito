//
//  ToDoListView.swift
//  Finito
//
//  Created by Rauls Lav on 17/01/25.
//

import SwiftUI
import FirebaseFirestore


struct ToDoListView: View {
    
    @StateObject var todoView : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._todoView = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }

    
    var body: some View {
        NavigationView{
            VStack{
                List(items){
                    item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                todoView.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To-Do List")
            .toolbar{
                Button {
                    todoView.showingNewItemview = true
                    
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $todoView.showingNewItemview) {
                NewItemView(newItemPresented: $todoView.showingNewItemview)
            }
        }
       
       
    }
}

#Preview {
    ToDoListView(userId: "")
}
