//
//  HeaderTab.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI

struct HeaderTab: View {
    var title: String = "Surah"
    var width: CGFloat = 70
    @Binding var color: Color
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("PoppinsSemiBold", size: 17, relativeTo: .headline))
                .foregroundColor(color)
                .fontWeight(.heavy)
                .frame(width: width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Rectangle()
                .frame(width: width, height: 3)
                .foregroundColor(color)
        }
        .shadow(radius: 10)
    }
}

struct HeaderTab_Previews: PreviewProvider {
    @State static var color = Color("HeaderText")
    static var previews: some View {
        HeaderTab(color: $color)
    }
}
