//
//  VersePlayer.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 30/4/21.
//

import Foundation
import AVFoundation

class VersePlayer: ObservableObject {
    
    @Published var playerId: Int = 0
    @Published var player: AVPlayer? = nil
    @Published var playerItem: AVPlayerItem? = nil
    
    func load(url: URL, playerId: Int){
       // guard let url = URL(string: url) else { return }
        playerItem = AVPlayerItem.init(url: url)
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
    
    func downloadAudio(urlString: String, destination: String, style: String, audioName: String, onDownloadFinish: @escaping (URL?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        try? url.download(to: createFolder(path: destination, style: style), using: audioName, overwrite: false, completion: { url, error in
            if let url = url {
                print(url)
                onDownloadFinish(url)
            } else {
                onDownloadFinish(nil)
            }
        })
    }
    
    func createFolder(path: String, style: String) -> URL {
        let fileManager = FileManager.default
        let folderURL = try! fileManager
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(path, isDirectory: true)
            .appendingPathComponent(style, isDirectory: true)
        if !directoryExists(path) {
            try! fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
        }
        return folderURL
    }
    
    func directoryExists(_ atPath: String) -> Bool {
        var isDirectory: ObjCBool = false
        let exists = FileManager.default.fileExists(atPath: atPath, isDirectory:&isDirectory)
        return exists && isDirectory.boolValue
    }
}

extension URL {
    func download(to directory: URL, using fileName: String? = nil, overwrite: Bool = false, completion: @escaping (URL?, Error?) -> Void) throws {
        let destination: URL
        if let fileName = fileName {
            destination = directory
                .appendingPathComponent(fileName)
                .appendingPathExtension(self.pathExtension)
        } else {
            destination = directory
                .appendingPathComponent(lastPathComponent)
        }
        if !overwrite, FileManager.default.fileExists(atPath: destination.path) {
            completion(destination, nil)
            return
        }
        URLSession.shared.downloadTask(with: self) { location, _, error in
            guard let location = location else {
                completion(nil, error)
                return
            }
            do {
                if overwrite, FileManager.default.fileExists(atPath: destination.path) {
                    try FileManager.default.removeItem(at: destination)
                }
                try FileManager.default.moveItem(at: location, to: destination)
                completion(destination, nil)
            } catch {
                print(error)
            }
        }.resume()
    }
}
