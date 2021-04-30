//
//  ContentView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI

struct ContentView: View {
    @State var showSplash = true
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    var body: some View {
        ZStack{
            TabView {
                HomeView()
                    .tabItem {  Image("Quran") }
                SurahDetailViewHeader()
                    .tabItem {  Image(systemName: "gear")  }
            }
         
            .edgesIgnoringSafeArea(.all)
//          SplashScreen()
//            .opacity(showSplash ? 1 : 0)
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                withAnimation() {
//                  self.showSplash = false
//                }
//              }
//          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
