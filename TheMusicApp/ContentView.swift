//
//  ContentView.swift
//  TheMusicApp
//
//  Created by abbas m h on 03/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentAlbum : MusicBrain.Album?
    @ObservedObject var data : MusicData
    
    var body: some View {
        NavigationView{
            ScrollView{
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack{
                        ForEach(self.data.albums, id: \.self) { album in
                            MusicBrain.AlbumArt(album: album, isWithText: true).onTapGesture {
                                self.currentAlbum = album
                            }
                        }
                    }
                })
                LazyVStack{
                    
                    if self.data.albums.first == nil{
                        
                        EmptyView()
                        
                    }else{
                        ForEach((self.currentAlbum?.songs ?? self.data.albums.first?.songs) ?? [MusicBrain.Song(name: "", time:"",file: "")], id: \.self) { song in
                        MusicBrain.SongCell(album:currentAlbum ?? self.data.albums.first! , song: song)
                    }
                }
             }
            }.navigationTitle("The Weeknd")
        }
    }
}
