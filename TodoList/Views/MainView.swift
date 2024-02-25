//
//  ContentView.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
       
        if viewModel.isSignedIN, !viewModel.currentUserUid.isEmpty{
            //Sign in state
            accountView
            
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            TodoListView(userId:viewModel.currentUserUid).tabItem {
            Label("Home", systemImage: "house")
            }
            ProfileView().tabItem {
            Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    MainView()
}
