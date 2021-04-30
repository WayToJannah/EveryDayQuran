//
//  HomeView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI
import GRDB

struct HomeView: View {
    
    @Environment(\.appDatabase) var appDatabase
    @State var selectionIndex = 1
    @State var color = Color("HeaderText")
    //    @Query(QuranRequest(request: .surahTitles)) private var surahTitle: [Row]
    
    @State var homeModel = [HomeModel]()
    
    func width(totalWidth: CGFloat) -> CGFloat {
        totalWidth / 5
    }
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor  = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.white
        
        
    }
    var body: some View {
        
        GeometryReader { geometry in
            NavigationView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Asslamualaikum")
                        .onAppear { getSurahTitles() }
                    Text("Tanvir Ahassan")
                        .font(.custom("PoppinsSemiBold", size: 37, relativeTo: .title3))
                    HomeViewHeader(height: geometry.size.height * 0.161)
                    HStack {
                        Spacer()
                        ForEach(0 ..< 4) { item in
                            Button(action: {
                                selectionIndex = item
                                getSurahTitles()
                            }, label: {
                                if selectionIndex == item {
                                    HeaderTab(title: tabTitle(index: item), width: width(totalWidth: geometry.size.width), color: $color)
                                } else {
                                    HeaderTab(title: tabTitle(index: item), width: width(totalWidth: geometry.size.width), color: .constant(.black))
                                }
                                
                            })
                            .padding(.top, 20)
                        }
                        Spacer()
                    }
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(homeModel) { content in
                                NavigationLink(destination: SurahDetailView(surahNo: content.id, surahArabicName: content.arabic)) {
                                    SurahTitleView(height:geometry.size.height * 0.096 ,surahNo: String(content.id), surahArabicName: content.arabic, surahOtherName: content.other )
                                }
                            }
                            
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .toolbar  {
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            print("navigationBarLeading")
                        }, label: {
                            Image("menu")
                            
                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            print("navigationBarTrailing")
                        }, label: {
                            Image("Search")
                                .foregroundColor(.black)
                        })
                    }
                    
                }
                .navigationTitle("EveryDay Quran")
                .navigationBarTitleDisplayMode(.inline)
                .padding()
            }
        }
        
        
    }
    
    func tabTitle(index: Int) -> String {
        switch index {
        case 0:
            return "Surah"
        case 1:
            return "Juz"
        case 2:
            return "Page"
        case 3:
            return "Hijab"
        default:
            return "Surah"
        }
    }
    func getSurahTitles() {
        
        appDatabase?.quranReader.asyncRead { dbResult  in
            let db = try! dbResult.get()
            var homeModel = [HomeModel]()
            let arabic = try! Row.fetchAll(db, sql: "SELECT id, arabic FROM surah_names")
            let other = try! Row.fetchAll(db, sql: "SELECT english FROM surah_names")
            for i in 0..<arabic.count {
                homeModel.append(HomeModel(id: arabic[i]["id"], arabic: arabic[i]["arabic"], other: other[i]["english"]))
            }
            self.homeModel = homeModel
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


