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
    
    var redValue = CGFloat(drand48())
    var blueValue =  CGFloat(drand48())
    var greenValue = CGFloat(drand48())
    

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
        
        gradientLayer.frame = view.bounds
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
        }
        
    }
   
    func randomColor() {
        
        
        let color1 = UIColor(white: 0.6, alpha: 0.7).cgColor
        let color2 = UIColor(red: 1, green: 0, blue: 0.3, alpha: 0.7).cgColor
        let color3 = UIColor(red: 0.01, green: 1, blue: 0, alpha: 0.7).cgColor
        let color4 = UIColor(red: 0.01, green: 0.01, blue: 1, alpha: 0.7).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.01, 0.27, 0.74, 0.99]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
        
        
        
        print(redValue)
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }


}

