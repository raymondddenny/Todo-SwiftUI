//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
class RegisterViewViewModel: ObservableObject{
    @Published var emailAddress = ""
    @Published var fullName = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init(){
        
    }
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: emailAddress, password: password, completion: {[weak self]result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.inserUserRecord(id: userId)
        } )
    }
    
    private func inserUserRecord(id:String){
        let newUser = User(id: id, name: fullName, email: emailAddress, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        //check email password and name not empty
        guard !fullName.trimmingCharacters(in: .whitespaces) .isEmpty,
              !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please filled all the field"
            return false;
        }
        
        //check format email
        guard emailAddress.contains("@") && emailAddress.contains(".") else{
            errorMessage = "Email format is not correct"
            return false;
        }
        
        //password must be 6 or more than 6
        
        guard password.count >= 6 else {
            errorMessage = "Password must be more than 6 or equal"
            return false;
        }
        
        return true;
    }
}
