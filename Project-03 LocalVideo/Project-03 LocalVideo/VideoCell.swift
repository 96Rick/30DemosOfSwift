//
//  VideoCell.swift
//  Project-03 LocalVideo
//
//  Created by Rick on 2017/10/17.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

struct Video {
    let image: String
    let title: String
    let desc: String
}

class VideoCell: UITableViewCell {
 
    @IBOutlet weak var videoScreenImage: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
