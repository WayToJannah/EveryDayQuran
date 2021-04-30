//
//  SurahDetailView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI
import GRDB
import AVFoundation

struct SurahDetailView: View {
    @Environment(\.appDatabase) var appDatabase
    @EnvironmentObject var versePlayer: VersePlayer
    var surahNo: Int = 1
    var surahArabicName: String =  "Surah Al Baqarah"
    @State var quran = [Quran]()
    var body: some View {
        ScrollView {
            LazyVStack {
                SurahDetailViewHeader()
                ForEach(quran) { item in
                    AyahView(quran: item)
                }
            }
        }.onAppear{
            getQuran()
        }
        .toolbar  {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    print("navigationBarTrailing")
                }, label: {
                    Image("Search")
                        .foregroundColor(.black)
                })
            }
            
        }
        .navigationTitle(surahArabicName)
        .onDisappear {
            print("x Default disappear")
        }
        .onWillDisappear { // << order does NOT matter
            versePlayer.playerId = 0
            versePlayer.player = nil
        }
        
    }
    func getQuran() {
        quran.removeAll()
        appDatabase?.quranReader.asyncRead { dbResult  in
            let db = try! dbResult.get()
            var quran = [Quran]()
            let arabic = try! Row.fetchAll(db, sql: "SELECT id, surah_no, ayah_no, ayah FROM uthmani_tajweed where surah_no  = \(surahNo)")
            print(quran)
            let other = try! Row.fetchAll(db, sql: "SELECT id, surah_no, ayah_no, ayah FROM en_ahmedali where surah_no  = \(surahNo)")
            for i in 0..<arabic.count {
                quran.append(Quran(id: arabic[i]["id"], surahNo: arabic[i]["surah_no"], ayahNo: arabic[i]["ayah_no"], ayah: arabic[i]["ayah"], other: other[i]["ayah"]))
            }
            self.quran = quran
        }
    }
}

struct SurahDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SurahDetailView()
    }
}
