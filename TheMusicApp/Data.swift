//
//  Data.swift
//  TheMusicApp
//
//  Created by abbas m h on 03/08/21.
//

import Foundation
import SwiftUI
import Firebase

class MusicData : ObservableObject {
    
    @Published public var albums = [MusicBrain.Album]()
    
    func loadData() {
        Firestore.firestore().collection("albums").getDocuments { snapshot, error in
            
            if error == nil{
                for mData in snapshot!.documents {
                    
                    let name = mData.data()["name"] as? String ?? "error"
                    let image = mData.data()["image"] as? String ?? "error"
                    
                    var songArray = [MusicBrain.Song]()
                    
                    let songs = mData.data()["songs"] as? [String : [String : Any]]
                    if let songs = songs{
                        for song in songs{
                            let songName = song.value["name"] as? String ?? "error"
                            let songTime = song.value["time"] as? String ?? "error"
                            let songFile = song.value["file"] as? String ?? "error"
                            songArray.append(MusicBrain.Song(name: songName, time: songTime, file: songFile))
                        }
                    }
                    
                    self.albums.append(MusicBrain.Album(name: name, image: image, songs: songArray))
                }
            }else{
                print(error)
            }
        }
    }
    
}
