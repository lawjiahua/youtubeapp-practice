//
//  Cachemanager.swift
//  Youtube-app
//
//  Created by Oddle HQ on 29/8/23.
//

import Foundation

class cacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?){
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        return cache[url]
    }
}
