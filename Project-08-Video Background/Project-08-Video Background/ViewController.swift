//
//  ViewController.swift
//  Project-08-Video Background
//
//  Created by Rick on 2017/11/16.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class ViewController: VideoBackgroundViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var signup: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        playVideo()
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        pausedVideo()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.login.layer.cornerRadius = 10
        self.signup.layer.cornerRadius = 10
        setupVideoBackground()
    }

    func setupVideoBackground() {
        let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        alpha = 1
        contentURL = url
        view.isUserInteractionEnabled = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

