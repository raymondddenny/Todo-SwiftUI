//
//  TodoListApp.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
