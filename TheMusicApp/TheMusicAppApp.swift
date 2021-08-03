//
//  TheMusicAppApp.swift
//  TheMusicApp
//
//  Created by abbas m h on 03/08/21.
//

import SwiftUI
import Firebase


@main
struct TheMusicAppApp: App {
    
    let data = MusicData()
    
    init() {
        FirebaseApp.configure()
        data.loadData()
    }
    var body: some Scene {
        WindowGroup {
            ContentView(data: data)
        }
    }
}
