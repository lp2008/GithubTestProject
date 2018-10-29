//
//  BuiltByCollectionViewCell.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import UIKit
import Kingfisher

class BuiltByCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(urlString: String) {
        if let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        }
    }

}
