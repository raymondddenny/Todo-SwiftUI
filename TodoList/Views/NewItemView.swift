//
//  NewItemView.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New To DO").font(.system(size: 32)).bold().padding(.top,50)
            
            Form{
                // Title
                TextField("Title",text:$viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                
                // Duedate
                DatePicker("Due date",selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save", backgroundColor: .pink){
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented.toggle()
                    } else {
                        viewModel.showAlert.toggle()
                      
                    }
                    
                    
                }.padding()
                    .alert(isPresented: $viewModel.showAlert){
                        Alert(title: Text("Error"),message: Text("Please fill in all the field and select duedate that is today or newer")
                        )
                    }
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in }))
}
