//
//  SurahTitleView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI

struct SurahTitleView: View {
    var height: CGFloat = 78
    var surahNo: String = "1"
    var surahArabicName: String = "ناﺮﻤﻋ لآ"
    var body: some View {
        HStack {
                ZStack {
                    Image("Vector")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                    Text(surahNo) .font(.custom("PoppinsSemiBold", size: 13, relativeTo: .footnote))
                        .foregroundColor(.black)
                }
            VStack(alignment: .leading) {
                Text("Al - Fatiah")
                    .font(.custom("PoppinsSemiBold", size: 17, relativeTo: .headline))
                    .foregroundColor(.black)
                  
                Text("Meccan - 7 Verses")
                    .foregroundColor(Color("Subtitle"))
                    .font(.subheadline)
            }
            Spacer()
            Text(surahArabicName)
                .font(.custom("Amiri-Regular", size: 20, relativeTo: .title3))
                .foregroundColor(Color("Subtitle"))
            
        }
        .frame(height: height)
        .padding(.all)
        .background(Color.white)
        .cornerRadius(5)
        
        
       
    }
}

struct SurahTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SurahTitleView()
    }
}
