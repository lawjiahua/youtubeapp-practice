//
//  ViewController.swift
//  Youtube-app
//
//  Created by Oddle HQ on 16/8/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
   
    
   
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        
        model.getVideos()
    }
    
    // MARK: - populate videos
    func populateVideos(_ videos: [Video]) {
        
        // retrieve videos
        self.videos = videos
        
        // refresh table
        tableView.reloadData()
    }
    

    // MARK: - tableview methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // configure cell data to show title of video
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        //return the cell
        return cell
    }
    
    
    
    
}

