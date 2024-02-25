//
//  LoginView.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct LoginView: View {
   @StateObject var viewModel = LoginViewViewModel()
    @State private var showAlert = false
    var body: some View {
        NavigationView{
            VStack{
                //header
                HeaderView(title: "To Do List", subtitle: "Get things Done", background: .pink, angle: 15)
                
                // sign in form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundColor(.red)
                    }
                    TextField("Email address",text: $viewModel.emailAddress)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle ())
                    TLButton(title: "Log In", backgroundColor: .blue){
                        viewModel.login()
                    }
                }.padding(.top,-50)
                // create new account
                VStack{
                    Text("Doesn't have account?")
                    NavigationLink("create new account", destination: RegisterView())
                }.padding(.bottom,30)
                Spacer()
            }
        }.onChange(of: viewModel.errorMessage) { _ in // Note the underscore
            showAlert = !viewModel.errorMessage.isEmpty
        }.alert(isPresented: $showAlert ) { // Show alert if an error exists
            Alert(title: Text("Login Failed"), message: Text("\(viewModel.errorMessage)"))
        }
       
    }
}

#Preview {
    LoginView()
}
