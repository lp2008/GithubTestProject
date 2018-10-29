//
//  ViewController.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "TrendingTableViewCell"
    var viewModel: TrendingViewModel!
    
    let disposeBag = DisposeBag()
    @IBAction func signInGithub(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TrendingViewModel()
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        viewModel.trendingItems.asObservable().bind(to: tableView.rx.items(cellIdentifier: cellIdentifier, cellType: TrendingTableViewCell.self)) { index, item, cell in
                cell.configure(withViewModel: item)
                cell.selectionStyle = .none
            }.disposed(by: disposeBag)
    }


}

