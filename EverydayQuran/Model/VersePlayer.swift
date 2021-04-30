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
    
    
    func load(url: String, playerId: Int){
        guard let url = URL.init(string: url) else { return }
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
    
    func downloadAudio(urlString: String, destination: String, audioName: String = "") {
        guard let url = URL(string: urlString) else { return }
        try? url.download(to: createFolder(path: destination), using: audioName, overwrite: false, completion: {
           print($0)
            print($1)
        })
        
        
//        var downloadTask: URLSessionDownloadTask
//        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: {[weak self]  (tempLocation, response, error) in
//            if error != nil {
//                return
//            }
//            guard let tempLocation = tempLocation else { return }
//            let location = self?.createFolder(path: destination)
//            try! FileManager.default.moveItem(at: tempLocation, to: location!)
//        })
//            downloadTask.resume()
    }
    
    func createFolder(path: String) -> URL {
        let fileManager = FileManager.default
        let folderURL = try! fileManager
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(path, isDirectory: true)
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
    
    
    
    ///fgfds
    func loadFileAsync(url: URL, completion: @escaping (Bool) -> Void) {

        // create your document folder url
        let documentsUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

        // your destination file url
        let destination = documentsUrl.appendingPathComponent(url.lastPathComponent)

        //log.info(m: "downloading file from URL: \(url.absoluteString)")
        if FileManager().fileExists(atPath: destination.path) {
            print("The file already exists at path, deleting and replacing with latest")

            if FileManager().isDeletableFile(atPath: destination.path){
                do{
                    try FileManager().removeItem(at: destination)
                    print("previous file deleted")
                    self.saveFile(url: url, destination: destination) { (complete) in
                        if complete{
                            completion(true)
                        }else{
                            completion(false)
                        }
                    }
                }catch{
                    print("current file could not be deleted")
                }
            }
        // download the data from your url
        }else{
            self.saveFile(url: url, destination: destination) { (complete) in
                if complete{
                    completion(true)
                }else{
                    completion(false)
                }
            }
        }
    }


    func saveFile(url: URL, destination: URL, completion: @escaping (Bool) -> Void){
        URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) in
            // after downloading your data you need to save it to your destination url
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let location = location, error == nil
                else { print("error with the url response"); completion(false); return}
            do {
                try FileManager.default.moveItem(at: location, to: destination)
                print("new file saved")
                completion(true)
            } catch {
                print("file could not be saved: \(error)")
                completion(false)
            }
        }).resume()
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
