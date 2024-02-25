//
//  ListItemViewViewModel.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
class ListItemViewViewModel : ObservableObject{
    init() {
        
    }
    
    func toggleIsDone(item:TodoListItem){
        var itemCopy  = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
      
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
        .document(itemCopy .id)
        .setData(itemCopy.asDictionary())}
}
