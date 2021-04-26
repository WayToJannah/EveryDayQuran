//
//  ContentView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI

struct ContentView: View {
    @State var showSplash = true
    var body: some View {
        ZStack{
          Text("hELLO World")
            .edgesIgnoringSafeArea(.all)
          SplashScreen()
            .opacity(showSplash ? 1 : 0)
            .onAppear {
              DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation() {
                  self.showSplash = false
                }
              }
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
