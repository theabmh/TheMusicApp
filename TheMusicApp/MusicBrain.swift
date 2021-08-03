//
//  MusicBrain.swift
//  TheMusicApp
//
//  Created by abbas m h on 03/08/21.
//

import Foundation
import SwiftUI
struct MusicBrain{
    struct Album: Hashable {
        var id = UUID()
        var name : String
        var image : String
        var songs : [Song]
    }
    
    struct Song: Hashable {
        var id = UUID()
        var name : String
        var time : String
        var file : String
    }
    struct AlbumArt: View {
        var album : Album
        var isWithText : Bool
        
        var body: some View{
            ZStack(alignment: .bottom, content: {
                Image(album.image).resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                if isWithText == true{
                    
                    ZStack{
                        Blur(style: .dark)
                        Text(album.name).foregroundColor(.white)
                    }.frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }).frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).clipped().cornerRadius(20).shadow(radius: 10).padding(10)
        }
        
        
    }
    struct SongCell : View {
        
        var album : Album
        var song : Song
        
        var body: some View{
            
            NavigationLink(destination: PlayerView(album: album, song: song)) {
                HStack{
                    ZStack{
                        Circle().frame(width: 50, height: 50, alignment: .center).foregroundColor(.blue)
                        Circle().frame(width: 20, height: 20, alignment: .center).foregroundColor(.white)
                    }
                    Text(song.name).bold()
                    Spacer()
                    Text(song.time)
                }.padding(20)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}
