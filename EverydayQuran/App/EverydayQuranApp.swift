//
//  EverydayQuranApp.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 26/4/21.
//

import SwiftUI
import AVFoundation

@main
struct EverydayQuranApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.appDatabase, AppDatabase.shared)
                .environmentObject(VersePlayer())
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first)
                }
                
        }
    }
}


private struct AppDatabaseKey: EnvironmentKey {
    static let defaultValue: AppDatabase? = nil
}

private struct PlayerKey: EnvironmentKey {
    static var defaultValue: AVPlayer? = nil
}

private struct PlayingIdKey: EnvironmentKey {
    static var defaultValue: Int = 0
}

extension EnvironmentValues {
    var appDatabase: AppDatabase? {
        get { self[AppDatabaseKey.self] }
        set { self[AppDatabaseKey.self] = newValue }
    }
    var player: AVPlayer? {
        get { self[PlayerKey.self] }
        set { self[PlayerKey.self] = newValue }
    }
    
    var playingId: Int {
        get { self[PlayingIdKey.self] }
        set { self[PlayingIdKey.self] = newValue }
    }
}
