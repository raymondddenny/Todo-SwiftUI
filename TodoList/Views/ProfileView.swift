//
//  ProfileView.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user =  viewModel.user {
                    profile(user:user)
                } else {
                    ProgressView()
                }
            }.navigationTitle("Profile")
                
        }.onAppear{
            viewModel.getUserProfile()
        }
    }
    
    @ViewBuilder
    func profile(user:User) -> some View {
        // Avatar
        Image(systemName: "person.circle").resizable().aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).frame(width: 130, height: 130, alignment: .center)
        
        //Info name, Email, member since
        VStack (alignment: .leading) {
            ProfileTile(fieldTitle: "Name:", fieldValue: user.name)
            ProfileTile(fieldTitle: "Email:", fieldValue: user.email)
            ProfileTile(fieldTitle: "Member Since:", fieldValue: "\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            
        }.padding()
        
        //Sign out buttonπ
        TLButton(title: "Sign Out", backgroundColor: .blue){
            viewModel.signOut()
        }.frame(height: 80).padding(.horizontal,100)
        Spacer()
    }
}

#Preview {
    ProfileView()
}
