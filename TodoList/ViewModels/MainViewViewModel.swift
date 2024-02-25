//
//  MainViewViewModell.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import FirebaseAuth
import Foundation
class MainViewViewModel: ObservableObject{
    @Published var currentUserUid: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserUid = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIN: Bool {
        return Auth.auth().currentUser != nil
    }
}
