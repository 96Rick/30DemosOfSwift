//
//  InterestCollectionViewCell.swift
//  Project-05 Collection View&Visual Effect
//
//  Created by Rick on 2017/10/28.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    var interest: Interest {
        didSet {
            updateUI()
        }
    }
    @IBOutlet weak var interestImage: UIImageView!
    
    @IBOutlet weak var interestLabel: UILabel!
    fileprivate func updateUI() {
    interestImage.image = interest.featuredImage
        interestLabel.text = interest.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    
}
