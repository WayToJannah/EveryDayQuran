//
//  SurahDetailView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI
import GRDB

struct SurahDetailView: View {
    @Environment(\.appDatabase) var appDatabase
    @State var quran = [Quran]()
    var body: some View {
            VStack {
                List {
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
            .navigationTitle("Surah Fatiah")
        
    }
    func getQuran() {
        quran.removeAll()
        appDatabase?.quranReader.asyncRead { dbResult  in
            let db = try! dbResult.get()
            let arabic = try! Row.fetchAll(db, sql: "SELECT id, surah_no, ayah_no, ayah FROM quran_uthmani where surah_no  = 2")
            print(quran)
            let other = try! Row.fetchAll(db, sql: "SELECT id, surah_no, ayah_no, ayah FROM bn_bengali where surah_no  = 2")
            for i in 0..<arabic.count {
                self.quran.append(Quran(id: arabic[i]["id"], surahNo: arabic[i]["surah_no"], ayahNo: arabic[i]["ayah_no"], ayah: arabic[i]["ayah"], other: other[i]["ayah"]))
            }
//                .forEach {
//
//                    quran.append( Quran(id: $0["id"], surahNo: $0["surah_no"], ayahNo: $0["ayah_no"], ayah: $0["ayah"]))
//                }
        }
    }
}

struct SurahDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SurahDetailView()
    }
}
