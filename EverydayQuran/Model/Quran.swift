//
//  Quran.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import GRDB

struct Quran: Identifiable {
    var id: Int
    var surahNo: Int = 1
    var ayahNo: Int = 1
    var ayah: String = ""
    var other: String = ""
}


struct  LastView: Hashable, Equatable, Codable {
    var surahId: Int
    var ayahId: Int
}


