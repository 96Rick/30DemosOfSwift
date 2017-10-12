//
//  ViewController.swift
//  Project-01 simpleTimer
//
//  Created by Rick on 2017/10/12.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var Counter: Double = 0
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.numberOfLines = 3
        timeLabel.text = "👇Go"
    }
    
    @objc func UpdateTimer() {
        Counter += 0.01
        timeLabel.text = String(format: "%.2f", Counter)
    }
    
    @IBAction func touchPlayButton(_ sender: Any) {
        if isPlaying {
            return
        }
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @IBAction func touchPauseButton(_ sender: Any) {
        if timer.isValid != true {
            return
        }
        timer.invalidate()
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        isPlaying = false
    }
    @IBAction func touchResetButton(_ sender: Any) {
        isPlaying = false
        timer.invalidate()
        Counter = 0.0
        timeLabel.text = "👇Go"
        playButton.isEnabled = true
        pauseButton.isEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

