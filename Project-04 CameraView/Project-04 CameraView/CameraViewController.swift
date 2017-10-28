//
//  CameraViewController.swift
//  Project-04 CameraView
//
//  Created by Rick on 2017/10/24.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit


class CameraViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //拍照
    @IBAction func fromPhotograph(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //创建图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //设置来源
            picker.sourceType = UIImagePickerControllerSourceType.camera
            //允许编辑
            picker.allowsEditing = true
            //打开相机
            self.present(picker, animated: true, completion: { () -> Void in
                
            })
        }else{
            print("找不到相机")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


