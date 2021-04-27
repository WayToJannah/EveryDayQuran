//
//  Quran.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import GRDB

struct Quran: Identifiable {
    var id: Int
    var surahNo: Int
    var ayahNo: Int
    var ayah: String
    var other: String = ""
}


