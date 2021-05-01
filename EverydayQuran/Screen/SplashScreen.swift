//
//  SplashScreen.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                Spacer()
                Text("EveryDay Quran").font(.custom("Poppins Bold", size: geometry.size.height * 0.039)).fontWeight(.heavy).foregroundColor(Color("SplashTitle")).multilineTextAlignment(.center)
                    .shadow(radius: 20)
                HStack {
                    Spacer()
                    Text("Learn Quran and Recite once everyday").font(.custom("Poppins Regular", size: geometry.size.height * 0.022)).foregroundColor(Color("SplashTitle")).multilineTextAlignment(.center)
                        .frame(width: geometry.size.width * 0.84)
                        .shadow(radius: 20)
                    Spacer()
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button(action: {print("hi")}, label: {
                    Text("Get Started").font(.custom("PoppinsSemiBold", size: 18)).fontWeight(.heavy).foregroundColor(Color("GetStarted")).multilineTextAlignment(.center)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white)
                                        .frame(width: geometry.size.width * 0.494, height: geometry.size.height * 0.073))
                        .shadow(radius: 20)
                })
                
                Spacer()
            }
            .background(background)
        }
    }
    
    var background: some View {
        Image("QuranBG").resizable().aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}



//,
