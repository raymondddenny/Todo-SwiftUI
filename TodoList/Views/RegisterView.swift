//
//  RegisterView.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel();
    var body: some View {
        VStack{
            
            //header
            HeaderView(title: "Register", subtitle: "Start organizing todo", background: .yellow, angle: -15)
            
            // sign in form
            Form{
                TextField("Full Name",text: $viewModel.fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()
                
                TextField("Email Address",text: $viewModel.emailAddress)
                    .textFieldStyle(DefaultTextFieldStyle ())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password",text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle ())
                
                TLButton(title: "Register Account", backgroundColor: .green ){
                    viewModel.register()
                }
        
            }.padding(.top,-50)
            // create new account
          
            Spacer()
        }
    }
    
}

#Preview {
    RegisterView()
}
