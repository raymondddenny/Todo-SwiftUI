//
//  TodoListItem.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import Foundation
struct TodoListItem : Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdAt: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state:Bool){
         isDone = state
    }
}
