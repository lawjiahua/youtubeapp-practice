//
//  Video.swift
//  Youtube-app
//
//  Created by Oddle HQ on 16/8/23.
//

import Foundation


struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    init (from decoder: Decoder) throws {
            
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetObj = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse title
        self.title = try snippetObj.decode(String.self, forKey: .title)
        
        //parse description
        self.description = try snippetObj.decode(String.self, forKey: .description)
        
        //parse published
        self.published = try snippetObj.decode(Date.self, forKey: .published)
        
        //parse thumbnail
        let thumbnailsObj = try snippetObj.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highObj = try thumbnailsObj.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highObj.decode(String.self, forKey: .thumbnail)
        
        //parse videoId
        let resourceIdObj = try snippetObj.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        videoId.self = try resourceIdObj.decode(String.self, forKey: .videoId)
    }
}
