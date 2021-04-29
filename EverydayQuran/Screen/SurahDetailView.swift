//
//  SurahDetailView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI

struct SurahDetailView: View {
    var body: some View {
            ScrollView {
                LazyVStack {
                    SurahDetailViewHeader()
                    ForEach(0 ..< 100) { item in
                        AyahView(ayahNumber: String(item + 1))
                    }
                }
//                List(0 ..< 100) { item in
//                    AyahView(ayahNumber: String(item + 1))
//
//                }
            }.toolbar  {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        print("navigationBarTrailing")
                    }, label: {
                        Image("Search")
                            .foregroundColor(.black)
                    })
                }

            }
            .navigationTitle("Surah Fatiah")
        
    }
}

struct SurahDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SurahDetailView()
    }
}
