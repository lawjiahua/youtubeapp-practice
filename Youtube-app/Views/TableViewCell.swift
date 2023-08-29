//
//  TableViewCell.swift
//  Youtube-app
//
//  Created by Oddle HQ on 29/8/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    @IBOutlet weak var videoPublishedDate: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        guard self.video != nil else {
            return
        }
        
        // set video title
        self.videoTitle.text = video?.title
        
        // set video date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.videoPublishedDate.text = df.string(from: video!.published)
        
        // set video thumbnail
        guard self.video?.thumbnail != "" else {
            return
        }
        
        // check cache for image first
        if let cachedData = cacheManager.getVideoCache(self.video!.thumbnail) {
            DispatchQueue.main.async {
                self.videoImage.image = UIImage(data: cachedData)
            }
            return
        }
        
        let url = URL(string: video!.thumbnail)
        
        // get the shared session object
        let session = URLSession.shared
        
        
        
        // create data task
        let dataTask = session.dataTask(with: url!) {(data, response, error) in
            
            if error == nil && data != nil {
                
                // check if download url matches the video thumbnail url that the cell is currently supposed to display
                if url?.absoluteString != self.video?.thumbnail {
                    
                    return // url has been recycled for another cell down the line
                }
                
                // set image in cache
                cacheManager.setVideoCache(url!.absoluteString, data)
                
                // create image object
                let image = UIImage(data: data!)
                
                // set the imageview
                DispatchQueue.main.async {
                    self.videoImage.image = image
                }
            }
        }
        dataTask.resume()
        
    }

}
