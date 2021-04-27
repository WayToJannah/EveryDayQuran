//
//  AppDatabase.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import GRDB

struct AppDatabase {
    
    /// `quran.sqlite` database
    let quranReader: DatabaseReader
    /// For storing bookmarks, notes
    let dbWriter: DatabaseWriter
    
    
    init( _ quranReader: DatabaseReader, _ dbWriter: DatabaseWriter) throws {
        self.quranReader = quranReader
        self.dbWriter = dbWriter
        try migrator.migrate(dbWriter)
    }
    
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        migrator.registerMigration("version1") { db in
            
            try db.create(table: "bookmark") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("ayahNo", .integer).notNull()
                t.column("bookmark", .integer).notNull()
            }
            try db.create(table: "note") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("title", .integer).notNull()
                t.column("note", .text).notNull()
                t.column("createdAt", .date).defaults(to: Data())
                t.column("updatedAt", .date).defaults(to: Data())
                
            }
            
            //            try db.create(table: "quran_uthmani") { t in
            //                t.autoIncrementedPrimaryKey("id")
            //                t.column("surahNo", .integer).notNull()
            //                t.column("ayahNO", .integer).notNull()
            //                t.column("ayah", .text).notNull()
            //            }
            //
            //            try db.create(table: "bn_bengali") { t in
            //                t.autoIncrementedPrimaryKey("id")
            //                t.column("surahNo", .integer).notNull()
            //                t.column("ayahNO", .integer).notNull()
            //                t.column("ayah", .text).notNull()
            //            }
            //            try db.create(table: "en_ahmedali") { t in
            //                t.autoIncrementedPrimaryKey("id")
            //                t.column("surahNo", .integer).notNull()
            //                t.column("ayahNO", .integer).notNull()
            //                t.column("ayah", .text).notNull()
            //            }
            //            try db.create(table: "hi_farooq") { t in
            //                t.autoIncrementedPrimaryKey("id")
            //                t.column("surahNo", .integer).notNull()
            //                t.column("ayahNO", .integer).notNull()
            //                t.column("ayah", .text).notNull()
            //            }
            //            try db.create(table: "sq_ahmeti") { t in
            //                t.autoIncrementedPrimaryKey("id")
            //                t.column("surahNo", .integer).notNull()
            //                t.column("ayahNO", .integer).notNull()
            //                t.column("ayah", .text).notNull()
            //            }
            //            try db.create(table: "sq_nahi") { t in
            //                t.autoIncrementedPrimaryKey("id")
            //                t.column("surahNo", .integer).notNull()
            //                t.column("ayahNO", .integer).notNull()
            //                t.column("ayah", .text).notNull()
            //            }
            //            try db.create(table: "tt_nugman") { t in
            //                t.autoIncrementedPrimaryKey("id")
            //                t.column("surahNo", .integer).notNull()
            //                t.column("ayahNO", .integer).notNull()
            //                t.column("ayah", .text).notNull()
            //            }
            //            try db.create(table: "ug_saleh") { t in
            //                t.autoIncrementedPrimaryKey("id")
            //                t.column("surahNo", .integer).notNull()
            //                t.column("ayahNO", .integer).notNull()
            //                t.column("ayah", .text).notNull()
            //            }
        }
        
        
        return migrator
    }    
}

extension AppDatabase {
    /// Provides a read-only access to the database
    var databaseReader: DatabaseReader {
        dbWriter
    }
}
