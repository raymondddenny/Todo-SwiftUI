//
//  ProfileTile.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct ProfileTile: View {
    let fieldTitle: String
    let fieldValue: String
    var body: some View {
        HStack{
            Text(fieldTitle).font(.body).bold()
            Text(fieldValue).font(.body)
        }
    }
}

#Preview {
    ProfileTile(fieldTitle:"test",fieldValue:"Test")
}
