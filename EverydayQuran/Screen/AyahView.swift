//
//  AyahView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI

struct AyahView: View {
    var ayahNumber: String = "1"
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                header
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color("StartGradient"))
                        .frame(width: 32, height: 32)
                        Text(ayahNumber) .font(.custom("PoppinsSemiBold", size: 13, relativeTo: .footnote))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {}, label: {
                        Image("ShareAyah")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    Button(action: {}, label: {
                        Image("PlayAyah")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    Button(action: {}, label: {
                        Image("BookmarkAyah")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                   
                    
                    
                }
            }
            .padding(.bottom, 10)
            HStack {
                Spacer()
                Text("َﻦﻳِمَلٰعْلا ِّبَر ِهَّلِل ُدْمَحْلا")
                    .font(.custom("Amiri-Regular", size: 20, relativeTo: .title3))
                    .foregroundColor(.black)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Text("[All] praise is [due] to Allah, Lord of the worlds -")
                .font(.custom("PoppinsSemiBold", size: 20, relativeTo: .headline))
                .fixedSize(horizontal: false, vertical: true)
                  
        }
        .padding()
        
       
    }
    var header: some View {
       Rectangle()
        .frame(height: 50)
        .foregroundColor(Color("AyahHeader"))
    }
}

struct AyahView_Previews: PreviewProvider {
    static var previews: some View {
        AyahView()
    }
}
