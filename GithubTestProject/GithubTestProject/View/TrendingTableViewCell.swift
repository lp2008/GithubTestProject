//
//  TrendingTableViewCell.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var numberOfStarsLabel: UILabel!
    @IBOutlet weak var numberOfForksLabel: UILabel!
    @IBOutlet weak var builtByCollectionView: UICollectionView!
    @IBOutlet weak var todaysStarLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        languageView.layer.masksToBounds = true
        languageView.layer.cornerRadius = 7.5
        starButton.layer.masksToBounds = true
        starButton.layer.borderColor = UIColor.gray.cgColor
        starButton.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withViewModel viewModel: TrendingItemViewModel) {
        
        if let author = viewModel.trending?.author, let name = viewModel.trending?.name {
            let combination = NSMutableAttributedString()
            combination.append(NSAttributedString(string: "\(author) / ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.blue]))
            combination.append(NSAttributedString(string: name, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor: UIColor.blue]))
            userNameLabel.attributedText = combination
        }
        descriptionLabel.text = viewModel.trending?.descriptionField
        languageLabel.text = viewModel.trending?.language
        numberOfStarsLabel.text = "\(viewModel.trending?.stars ?? 0)"
        numberOfForksLabel.text = "\(viewModel.trending?.forks ?? 0)"
        todaysStarLabel.text = "\(viewModel.trending?.currentPeriodStars ?? 0) stars today"
    }
    
}
