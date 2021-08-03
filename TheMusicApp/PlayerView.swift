//
//  PlayerView.swift
//  TheMusicApp
//
//  Created by abbas m h on 03/08/21.
//

import Foundation
import SwiftUI
import Firebase
import AVFoundation


struct PlayerView: View {
    
    @State var musicPlayer = AVPlayer()
    
    @State var album : MusicBrain.Album
    @State var song : MusicBrain.Song
    
    @State var isPlsying : Bool = true
    
    
    var body: some View {
        ZStack{
            Image(album.image).resizable().edgesIgnoringSafeArea(.all)
            Blur(style: .dark).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                MusicBrain.AlbumArt(album: album,isWithText: false)
                Text(song.name).font(.title).fontWeight(.light).foregroundColor(.white)
                Spacer()
                ZStack{
                    Color.white.cornerRadius(20).shadow(radius: 10)
                    HStack{
                        Button(action: self.previous, label: {
                            Image(systemName:"arrow.left.circle").resizable().foregroundColor(Color.black.opacity(0.2))
                        }).frame(width: 50, height: 50, alignment: .center)
                        
                        Button(action: self.playPause, label: {
                            Image(systemName: isPlsying ? "pause.circle.fill" : "play.circle.fill").resizable()
                        }).frame(width: 70, height: 70, alignment: .center)
                        Button(action: self.next, label: {
                            Image(systemName:"arrow.right.circle").resizable().foregroundColor(Color.black.opacity(0.2))
                        }).frame(width: 50, height: 50, alignment: .center)
                    }
                }.frame(height: 200, alignment: .center).edgesIgnoringSafeArea(.bottom)
            }
        }.onAppear(){
            self.playSong()
        }
    }
    func playSong() {
        
        let storage = Storage.storage().reference(forURL: self.song.file)
          storage.downloadURL { url, error in
              if error != nil{
                  
                  
              }else{
                  
                  musicPlayer = AVPlayer(url: url!)
                  musicPlayer.play()
                  
              }
          }
    }
    
    func playPause() {
        self.isPlsying.toggle()
        if isPlsying == false{
            musicPlayer.pause()
        }else{
            musicPlayer.play()
        }
    }
    
    func next(){
        if let currentindex = album.songs.firstIndex(of: song){
            if currentindex == album.songs.count-1{
                
            }else{
                musicPlayer.pause()
                song = album.songs[currentindex + 1]
                self.playSong()
            }
        }
    }
    
    func previous(){
        if let currentindex = album.songs.firstIndex(of: song){
            if currentindex == 0{
                
            }else{
                musicPlayer.pause()
                song = album.songs[currentindex - 1]
                self.playSong()
            }
        }
    }
}


