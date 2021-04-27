//
//  EverydayQuranApp.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI

@main
struct EverydayQuranApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.appDatabase, AppDatabase.shared)
                
        }
    }
}


private struct AppDatabaseKey: EnvironmentKey {
    static let defaultValue: AppDatabase? = nil
}

extension EnvironmentValues {
    var appDatabase: AppDatabase? {
        get { self[AppDatabaseKey.self] }
        set { self[AppDatabaseKey.self] = newValue }
    }
}
