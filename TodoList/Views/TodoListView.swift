//
//  TodoListView.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI
import FirebaseFirestoreSwift
struct TodoListView: View {
    @StateObject var viewModel : TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    init(userId:String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(
            wrappedValue:
                TodoListViewViewModel(userId: userId)
        )
    }
    var body: some View {
        NavigationView{
            VStack{
                if items.isEmpty{
                    Text("No To-Dos \nfor Now👷‍♂️")
                } else{
                    List(items) {
                        item in
                        ListItemView(item: item).swipeActions{
                            Button("Delete") {
                                // Your action here
                                viewModel.deleteTodo(id: item.id)
                            }
                            .foregroundColor(.white) // Set text color to white for contrast
                            .tint(Color.red)
                            
                        }                }
                }
            }.navigationTitle("To Do List")
                .toolbar{
                    Button{
                        viewModel.addNewTodoItem()
                    } label:{
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
        }
    }
    
}

#Preview {
    TodoListView(userId: "f7Rfi9ULZbgWdeObVHCqM2W1XwI2")
}
