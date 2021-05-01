//
//  HomeViewHeader.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI

struct HomeViewHeader: View {
    var height: CGFloat = 131
    var surahName: String = "Al - Fatiah"
    var ayahNo: Int = 1
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("Book")
                    Text("Last Read")
                        .font(.custom("PoppinsSemiBold", size: 13, relativeTo: .headline))
                        .foregroundColor(.white)
                }
                Spacer()
                Text(surahName)
                    .font(.custom("Amiri-Bold", size: 22, relativeTo: .title2))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                Text("Ayah no \(ayahNo)")
                    .font(.custom("PoppinsSemiBold", size: 13, relativeTo: .headline))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            Spacer()
        }
        .padding()
        .background(background)
        .frame(height: height)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 10)
    }
    var background: some View {
        Image("Header").resizable().aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewHeader()
    }
}
