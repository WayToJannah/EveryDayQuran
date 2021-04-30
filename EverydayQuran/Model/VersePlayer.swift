//
//  VersePlayer.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 30/4/21.
//

import SwiftUI
import AVFoundation

class VersePlayer: ObservableObject {
 
    @Published var playerId: Int = 0
    @Published var player: AVPlayer? = nil
    
    
    func load(id: Int, playerId: Int){
        guard let url = URL.init(string: "https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/\(String(format:"%03d", id)).mp3") else { return }
        let playerItem = AVPlayerItem.init(url: url)
        player = AVPlayer.init(playerItem: playerItem)
        self.playerId = playerId
    }
    
    func pauseOrPlay() -> Bool {
        if player?.rate == 0 {
            player?.play()
            return true
        } else {
            player?.pause()
            return false
        }
    }
    
    
}

