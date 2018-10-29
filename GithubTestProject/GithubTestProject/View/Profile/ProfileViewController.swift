//
//  ProfileViewController.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBAction func battleButtonAction(_ sender: Any) {
    }
    
    @IBAction func logoutAction(_ sender: Any) {
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = viewModel.user?.login
    }

}
