//
//  Bookmark.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI
import GRDB

struct Bookmark: Identifiable, Equatable, Hashable {
    var id: Int64?
    var ayahNo: Int
    var bookmark: Int
    
    static var databaseTableName: String {
        "bookmark"
    }
    
   
}


extension Bookmark: Codable, FetchableRecord, MutablePersistableRecord {
    fileprivate enum Columns {
        static let ayahNo = Column(CodingKeys.ayahNo)
        static let bookmark = Column(CodingKeys.bookmark)
        
    }
    
    /// Updates a record i.e. `Quran`'s id after it has been inserted in the database.
    mutating func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
    
   
}
