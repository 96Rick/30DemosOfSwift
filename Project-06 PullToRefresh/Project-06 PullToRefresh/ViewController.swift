//
//  ViewController.swift
//  Project-06 PullToRefresh
//
//  Created by Rick on 2017/11/6.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifer = "NewCellIdentifer"
    let favoriteEmoji = ["☺☺☺☺☺☺☺☺","😂😂😂😂😂","🍩🍩🍩🍩🍩"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    
    var emojiData = [String]()
    var tableViewController = UITableViewController(style: .plain)
    var refreshController = UIRefreshControl()
    var navBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emojiData = favoriteEmoji
        let emojiTableView = tableViewController.tableView!
        emojiTableView.backgroundColor = UIColor(red: 0.092, green: 0.096, blue: 0.116, alpha: 1)
        emojiTableView.dataSource = self
        emojiTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        tableViewController.refreshControl = refreshController
        self.refreshController.addTarget(self, action: #selector(self.didLoadEmoji), for: .valueChanged)
        
        self.refreshController.backgroundColor = UIColor.black
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.refreshController.attributedTitle = NSAttributedString(string: "上一次刷新时间：\(NSDate())", attributes: attributes)
        self.refreshController.tintColor = UIColor.white
        self.title = "emoji"
        self.navBar.barStyle = UIBarStyle.blackTranslucent
        
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        emojiTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        
        self.view.addSubview(emojiTableView)
        self.view.addSubview(navBar)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer) as! UITableViewCell
        
        cell.textLabel?.text = self.emojiData[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc func didLoadEmoji() {
        self.emojiData = newFavoriteEmoji
        self.tableViewController.tableView.reloadData()
        self.refreshController.endRefreshing()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

