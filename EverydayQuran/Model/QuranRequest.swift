//
//  QuranRequest.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI
import GRDB

struct QuranRequest {
    enum Request {
        case bookmarkforAyah(Int)
        
        
    }
    
    var request: Request
   
}

extension QuranRequest: Queryable {
    static func == (lhs: QuranRequest, rhs: QuranRequest) -> Bool {
        false
    }
    
    
    static var defaultValue: Any { [] }
    
    func fetchValue(_ db: Database) throws -> Any {
        switch request {
        case .bookmarkforAyah(let id):
            return try Bookmark.fetchOne(db, sql: "SELECT * FROM Bookmark where ayahNo = ?", arguments: [id])
      
        }
    }
    
    
}

//
///// A player request defines how to feed the player list
//struct PlayerRequest {
//    enum Ordering {
//        case byScore
//        case byName
//    }
//
//    var ordering: Ordering
//}
//
///// Make `PlayerRequest` able to be used with the `@Query` property wrapper.
//extension PlayerRequest: Queryable {
//    static var defaultValue: [Player] { [] }
//
//    func fetchValue(_ db: Database) throws -> [Player] {
//        switch ordering {
//        case .byScore: return try Player.all().orderedByScore().fetchAll(db)
//        case .byName: return try Player.all().orderedByName().fetchAll(db)
//        }
//    }
//}
