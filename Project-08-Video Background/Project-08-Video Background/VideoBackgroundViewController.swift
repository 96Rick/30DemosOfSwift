//
//  VideoBackgroundViewController.swift
//  Project-08-Video Background
//
//  Created by Rick on 2017/11/23.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

public class VideoBackgroundViewController: UIViewController {
    
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel: Float = 1.0
    public var contentURL: URL? {
        didSet {
            setMoviePlayer(url: contentURL!)
        }
    }
    
    public var videoFrame: CGRect = CGRect()
    public var startTime: CGFloat = 0.0
    public var duration: CGFloat = 0.0
    public var backgroundColor: UIColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    public var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    public var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    public var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self,selector: #selector(VideoBackgroundViewController.playerItemDidReachEnd),
                                                       name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                       object: moviePlayer.player?.currentItem)
            }
        }
    }
    public var fillMode: ScalingMode = .ResizeAspectFill {
        didSet {
            switch fillMode {
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    
    func playVideo() {
        self.moviePlayer.player?.play()
    }
    
    func pausedVideo() {
        self.moviePlayer.player?.pause()
        
    }
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setMoviePlayer(url: URL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url as URL, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as URL? {
                self.moviePlayer.player = AVPlayer(url: path)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
    }
}
