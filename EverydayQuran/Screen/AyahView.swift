//
//  AyahView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI

struct AyahView: View {
    @Environment(\.appDatabase) var appDatabase
    var quran: Quran = Quran(id: 1, surahNo: 2, ayahNo: 1, ayah: "")
    @State var bookmark: Bookmark? = nil
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                header
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color("StartGradient"))
                            .frame(width: 32, height: 32)
                        Text(String(quran.ayahNo)) .font(.custom("PoppinsSemiBold", size: 13, relativeTo: .footnote))
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
                    Button(action: {
                        if bookmark == nil {
                            try! appDatabase?.dbWriter.write({ db in
                                var commitBookmark = Bookmark(id: nil, ayahNo: quran.ayahNo, bookmark: 1)
                                try commitBookmark.save(db)
                                bookmark = commitBookmark
                            })
                        } else {
                            try! appDatabase?.dbWriter.write({ db in
                                
                                var commitBookmark = bookmark!
                                commitBookmark.bookmark = commitBookmark.bookmark == 0 ? 1 : 0
                                try commitBookmark.save(db)
                                bookmark = commitBookmark
                            })
                        }
                        print(bookmark?.bookmark)
                    }, label: {
                        if bookmark == nil {
                            Image("BookmarkAyah")
                        } else {
                            bookmark!.bookmark == 0 ? Image("BookmarkAyah") : Image("PlayAyah")
                        }
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    
                    
                    
                }
                .padding()
            }
            .padding(.bottom, 10)
            HStack {
                Spacer()
                Text(quran.ayah.replacingOccurrences(of: "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ", with: "", options: .literal, range: nil))
                    .font(.custom("me_quran", size: 20, relativeTo: .title3))
                    .lineSpacing(10)
                    .foregroundColor(.black)
                    .fixedSize(horizontal: false, vertical: true)
            }
            HStack {
                Text(quran.other)
                    .font(.custom("PoppinsSemiBold", size: 20, relativeTo: .headline))
                    .lineSpacing(7)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            
        }
        .onAppear {
            try? appDatabase?.dbWriter.read({ db in
                bookmark = try Bookmark.fetchOne(db, sql: "SELECT * FROM Bookmark where ayahNo = ?", arguments: [quran.ayahNo])
            })
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
