//
//  VideoResource.swift
//  Project-08-Video Background
//
//  Created by Rick on 2017/11/22.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import AVFoundation

extension String {
    var convert: NSString { return (self as NSString) }
}

public class VideoCutter: NSObject {
    
    
    
    public func cropVideoWithUrl(videoUrl url: URL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath: URL?, _ error: NSError?) -> Void)?) {
        
        
        DispatchQueue.global(qos: .background).async {
            // video资源
            let asset = AVURLAsset(url: url)
            // video压缩
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            // 创建一个绝对路径存放视频资源
            let paths: Array = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            var outputURL = paths[0] as String
            let manager = FileManager.default
            do {
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            } catch _ { }
            outputURL = outputURL.convert.appendingPathComponent("output.mp4")
            do {
                try manager.removeItem(atPath: outputURL)
            } catch _ { }
            
            // 开始进行视频压缩
            if let exportSession = exportSession as AVAssetExportSession? {
                exportSession.outputURL = URL(fileURLWithPath: outputURL)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileTypeMPEG4
                //CMTimeMake(a,b)    a当前第几帧, b每秒钟多少帧.当前播放时间a/b
                let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                let range = CMTimeRangeMake(start, duration)
                exportSession.timeRange = range
                
                
                exportSession.exportAsynchronously { () -> Void in
                    switch exportSession.status {
                    case AVAssetExportSessionStatus.completed:
                        completion?(exportSession.outputURL, nil)
                    case AVAssetExportSessionStatus.failed:
                        print("Failed: \(String(describing: exportSession.error))")
                    case AVAssetExportSessionStatus.cancelled:
                        print("Failed: \(String(describing: exportSession.error))")
                    default:
                        print("default case")
                    }
                }
            }
        }
    }
}


