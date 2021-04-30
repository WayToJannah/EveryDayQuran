//
//  AyahView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI
import AVFoundation
import AttributedText
import AVFoundation

struct AyahView: View {
    @Environment(\.appDatabase) var appDatabase
    @State var attributedString: NSMutableAttributedString = NSMutableAttributedString(string: "")
    var quran: Quran = Quran(id: 1, surahNo: 2, ayahNo: 1, ayah: "")
    @State var bookmark: Bookmark? = nil
    @EnvironmentObject var versePlayer: VersePlayer
    let NC = NotificationCenter.default
    @State var isPlaying: Bool = false
    
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
                    Button(action: {
                        if versePlayer.playerId == quran.id {
                            isPlaying = versePlayer.pauseOrPlay()
                        } else {
                            versePlayer.load(id: quran.surahNo, playerId: quran.id)
                            isPlaying = versePlayer.pauseOrPlay()
                        }
                        
                    }, label: {
                        if versePlayer.playerId != quran.id || !isPlaying {
                            Image("PlayAyah")
                        } else {
                            Image("BookmarkAyah")
                        }
                        
                        
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
                //                Text(quran.ayah.replacingOccurrences(of: "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ", with: "", options: .literal, range: nil))
                //                    .font(.custom("me_quran", size: 20, relativeTo: .title3))
                //                    .lineSpacing(10)
                //                    .foregroundColor(.black)
                //                    .fixedSize(horizontal: false, vertical: true)
                AttributedText(attributedString)
                    
                    .onAppear {
                        ayahText(string: quran.ayah.replacingOccurrences(of: "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ", with: "", options: .literal, range: nil))
                        
                    }
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                Text(quran.other)
                    .font(.custom("PoppinsSemiBold", size: 17, relativeTo: .headline))
                    .lineSpacing(7)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            
        }
        .onAppear {
            try? appDatabase?.dbWriter.read({ db in
                bookmark = try Bookmark.fetchOne(db, sql: "SELECT * FROM Bookmark where ayahNo = ?", arguments: [quran.ayahNo])
            })
            
            self.NC.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: versePlayer.playerItem, queue: nil,
                                using: self.finishPlayback(_:))
        }
        .padding()
        
        
        
        
    }
    var header: some View {
        Rectangle()
            .frame(height: 50)
            .foregroundColor(Color("AyahHeader"))
    }
    
    func ayahText(string: String) {
        TajweedHtmlText.tajweedTextOnFinish(for: string, isDark: false) { (string) in
            attributedString = string
            
        }
    }
    
    func finishPlayback(_ notification: Notification) {
        print("finishPlayback")
        isPlaying = false
        versePlayer.playerId = 0
    }
    
    
    
}

struct AyahView_Previews: PreviewProvider {
    static var previews: some View {
        AyahView()
    }
}
