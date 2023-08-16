//
//  ViewController.swift
//  Youtube-app
//
//  Created by Oddle HQ on 16/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        model.getVideos()
    }


}

