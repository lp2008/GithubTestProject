//
//  ProfileViewController.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBAction func battleButtonAction(_ sender: Any) {
    }
    
    @IBAction func logoutAction(_ sender: Any) {
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "RepoTableViewCell"
    let disposeBag = DisposeBag()
    var viewModel: ProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = viewModel.user?.login
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        viewModel.repoItems.asObservable().bind(to: tableView.rx.items(cellIdentifier: cellIdentifier, cellType: RepoTableViewCell.self)) { index, item, cell in
            cell.configure(viewModel: item)
            cell.selectionStyle = .none
            }.disposed(by: disposeBag)
    }

}
