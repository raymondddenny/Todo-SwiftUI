//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func login() {
        guard validate() else { return }

        Auth.auth().signIn(withEmail: emailAddress, password: password) { [weak self] authResult, error in
            if let error = error as NSError? {

                switch error.code {
                case AuthErrorCode.wrongPassword.rawValue:
                    self?.errorMessage = "Incorrect password"
                case AuthErrorCode.invalidEmail.rawValue:
                    self?.errorMessage = "Invalid email format"
                default:
                    self?.errorMessage = "An error occurred. Please try again.\n\(error.userInfo)"
                }
            }
        }
    }
    
   private func validate() -> Bool {
        errorMessage = ""
        guard !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please filled all the fields"
            return false
        }
        
        guard emailAddress.contains("@") && emailAddress.contains(".") else {
            errorMessage="Enter valid email address"
            return false
        }
       
       return true
    }
}
