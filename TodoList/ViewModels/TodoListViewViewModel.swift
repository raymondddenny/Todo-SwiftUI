//
//  File.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import Foundation
import FirebaseFirestore
class TodoListViewViewModel : ObservableObject{
    @Published var showingNewItemView = false;
    
    private let userId: String
    
    init(userId:String) {
        self.userId = userId
    }
    
    func addNewTodoItem(){
        showingNewItemView.toggle();
    }
    
    func deleteTodo(id:String){
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
