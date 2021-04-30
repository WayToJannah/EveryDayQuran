//
//  HomeModel.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 30/4/21.
//

import Foundation

struct HomeModel: Identifiable {
    var id: Int
    var arabic: String
    var arabicOther: String = ""
    var other: String
    var place: String = ""
    var totalVerse: Int = 1
}



