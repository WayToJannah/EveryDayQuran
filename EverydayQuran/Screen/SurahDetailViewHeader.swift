//
//  SurahDetailViewHeader.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI

struct SurahDetailViewHeader: View {
    var width: CGFloat = 214 // 0.570
    var height: CGFloat = 48 // 0.0591
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image("QuranIcon")
                    .opacity(0.3)
                    
            }.padding()
               
            VStack {
                Text("Al-Fatiah")
                    .font(.custom("PoppinsBold", size: 34, relativeTo: .title2))
                    .multilineTextAlignment(.center)
                    Text("The Opening")
                        .font(.custom("PoppinsSemiBold", size: 20, relativeTo: .caption2))
                        .multilineTextAlignment(.center)
                
                Rectangle()
                    .frame(width: 200, height: 1.5)
                   
                
                HStack {
                    Text("Meccan")
                        .font(.custom("PoppinsSemiBold", size: 20, relativeTo: .caption2))
                        .multilineTextAlignment(.center)
                    Circle()
                        .fill(Color(.white))
                    .frame(width: 10, height: 10)
                    Text("7 verses")
                        .font(.custom("PoppinsSemiBold", size: 20, relativeTo: .caption2))
                        .multilineTextAlignment(.center)
                }
                
                Image("Bismillah")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: width, height: height, alignment: .center)
                    
            
                    
            }.foregroundColor(.white)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("StartGradient"), Color("EndGradient")]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
        .shadow(color: Color("StartGradient"), radius: 20)
        
       

        
    }
}

struct SurahDetailViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        SurahDetailViewHeader()
    }
}
