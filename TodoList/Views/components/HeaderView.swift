//
//  HeaderView.swift
//  TodoList
//
//  Created by Denny Raymond on 2/25/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    let angle: Double
    var body: some View {
            //header
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(background).rotationEffect(Angle(degrees: angle))
                VStack{
                    Text(title).font(.system(size: 50)).bold().foregroundColor(.white)
                    Text(subtitle).font(.system(size: 30)).foregroundColor(.white)
                }.padding(.top,80)
                
            }.frame(width: UIScreen.main.bounds.width*3,height: 350)
                .offset(y:-150)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", background: .blue, angle: 15)
}
