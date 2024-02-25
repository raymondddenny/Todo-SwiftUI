//
//  ListItemView.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct ListItemView: View {
    let item: TodoListItem
    @StateObject var viewModel = ListItemViewViewModel()
    var body: some View {
        HStack{
            VStack(alignment:.leading) {
                Text(item.title).font( .body).strikethrough(item.isDone)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle" ).foregroundColor( .green)
            }
        }
    }
}

#Preview {
    ListItemView(item: TodoListItem(id: "123", title: "Test Item", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isDone: true))
}
