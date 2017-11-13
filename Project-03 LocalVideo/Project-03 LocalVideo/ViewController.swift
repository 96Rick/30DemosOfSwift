//
//  ViewController.swift
//  Project-03 LocalVideo
//
//  Created by Rick on 2017/10/17.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var videoTableView: UITableView!
    
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    var data = [
        
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", desc: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", desc: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", desc: "Vine - 00:06"),
        Video(image: "videoScreenshot04", title: "Adventure Time", desc: "Youtube - 02:39"),
        Video(image: "videoScreenshot05", title: "Facebook HQ", desc: "Facebook - 10:20"),
        Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", desc: "Allen - 20:30")
        
    ]
    
   
    @IBAction func playVideoButtonTapped(_ sender: Any) {
        
        if let path = Bundle.main.path(forResource: "moments", ofType: "mp4") {
            
            print(path)
            playerView = AVPlayer(url: URL(fileURLWithPath: path))
            playerViewController.player = playerView
            self.present(playerViewController, animated: true) {
                self.playerViewController.player?.play()
            }
        } else {
            print(Bundle.main.path(forResource: "moments", ofType: "mp4") ?? "not found")
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoCell
        
        let video = data[indexPath.row]
        
        cell?.videoScreenImage.image = UIImage(named: video.image)
        cell?.videoTitleLabel.text = video.title
        cell?.videoDescLabel.text = video.desc
        
        
        return cell!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTableView.delegate = self
        videoTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

