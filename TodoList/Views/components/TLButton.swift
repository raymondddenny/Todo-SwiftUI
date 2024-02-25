//
//  TLButton.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: ()->Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor).bold()
                Text(title).foregroundColor(.white).bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(title: "value", backgroundColor: .blue){
        
    }
 }
