//
//  ViewController.swift
//  RandomBackground
//
//  Created by Rick on 2017/11/13.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    let gradientLayer = CAGradientLayer()
    var timer: Timer?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
    }

    @IBAction func playButtonDidTapped(_ sender: Any) {
        let backgroundMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy (ARMNHMR & DATHAN Flip)", ofType: "mp3")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: backgroundMusic)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch let audioEorror as Error {
            print(audioEorror)
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
        }
        
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor(red: 0.1, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor(red: 1.0, green: 1, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        let color5 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.1, 0.3, 0.5, 0.7, 0.9]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  randomColor() {
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }


}

