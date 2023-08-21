//
//  Model.swift
//  Youtube-app
//
//  Created by Oddle HQ on 16/8/23.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // get URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //get URLsession object
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) {(data, response, error) in
        
            //check if any error
            if error != nil || data == nil {
                return
            }
            
            //parse the data into video objects
            do {
                let decoder  = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                
            }
        }
        
        dataTask.resume()
        
    }
}
