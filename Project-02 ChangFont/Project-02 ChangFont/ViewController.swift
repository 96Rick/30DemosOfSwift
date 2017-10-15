//
//  ViewController.swift
//  Project-02 ChangFont
//
//  Created by Rick on 2017/10/13.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var changeFontButtom: UIButton!
    @IBOutlet weak var fontTableview: UITableView!
    var data = ["全概率公式",
                "Warning⚠️",
                "P(A) = P(A|B1)P(B1) +P(A|B2)",
                "今晚打老虎",
                "天外天studio",
                "Some Words",
                "就是测试，测试，测试，测试，测试，测试",
                "@!#$%^&*()_+",
                "Say something I'm giving upon U"]
    
    var fontRowIndex = 0
    var fontNames = [""]
    var fontCount = 0
    var fontColorRed = Int(arc4random()) % 255
    var fontColorGreen = Int(arc4random()) % 255
    var fontColorBlue = Int(arc4random()) % 255
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontTableview.delegate = self
        fontTableview.dataSource = self
//        (r+g+b)/3 > 128黑，否则白！
        if (fontColorRed + fontColorGreen + fontColorBlue)/3 > 128 {
            fontTableview.backgroundColor = UIColor.black
            self.view.backgroundColor = UIColor.black
        } else {
            fontTableview.backgroundColor = UIColor.white
            self.view.backgroundColor = UIColor.white
        }
        
        for family in UIFont.familyNames{
            for font in UIFont.fontNames(forFamilyName: family){
                fontNames.append(font)
                fontCount += 1
            }
        }
        
        changeFontButtom.layer.cornerRadius = 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableview.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath as IndexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor(red: CGFloat(fontColorRed)/255.0, green: CGFloat(fontColorGreen)/255.0, blue: CGFloat(fontColorBlue)/255.0, alpha: 1)
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func changeFontButtonTapped(_ sender: Any) {
        fontRowIndex = (fontRowIndex + Int(arc4random())) % fontCount
        print(fontNames[fontRowIndex])
        fontColorRed = Int(arc4random()) % 255
        fontColorGreen = Int(arc4random()) % 255
        fontColorBlue = Int(arc4random()) % 255
        fontTableview.reloadData()
        if (fontColorRed + fontColorGreen + fontColorBlue)/3 > 128 {
            fontTableview.backgroundColor = UIColor.black
            self.view.backgroundColor = UIColor.black
        } else {
            fontTableview.backgroundColor = UIColor.white
            self.view.backgroundColor = UIColor.white
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

