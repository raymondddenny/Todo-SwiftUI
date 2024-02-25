//
//  NewItemViewViewModel.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false;
    
    init() {
        
    }
    
    
    func save(){
        guard canSave else{
            return
        }
        
        //Get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create model
        let newId = UUID().uuidString
        let newTodo = TodoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdAt: Date().timeIntervalSince1970,
            isDone:  false)
        
        //Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newTodo.asDictionary())
        
        
    }
    
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // check duedate is not today
        // 86400 is total seconds in a day
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
