//
//  Constants.swift
//  Youtube-app
//
//  Created by Oddle HQ on 16/8/23.
//

import Foundation

struct Constants {
        
    static var API_KEY = "AIzaSyBDkOYR0EpfMKi4910DtUAH_2oczpoQmfc"
    static var PLAYLIST_ID = "PL5hq3tApc7D7RYIT-HL2Yw1d7i9-3bqgz"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlists?part=snippet&id=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    
}

