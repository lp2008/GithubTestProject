//
//  BattlePageViewController.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/30/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import UIKit
import RxSwift
import SVProgressHUD

class BattlePageViewController: UIViewController {

    //Player One Outlet
    @IBOutlet weak var user1View: UIView!
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player1Submit: UIButton!
    @IBOutlet weak var player1ProfileView: UIView!
    @IBOutlet weak var player1ImageView: UIImageView!
    @IBOutlet weak var player1ResetButton: UIButton!
    
    @IBAction func player1ResetAction(_ sender: Any) {
        player1TextField.text = ""
        player1ProfileView.isHidden = true
        viewModel.player1 = nil
        tempCount = tempCount - 1
        submitButton.isHidden = true
    }
    
    @IBAction func player2ResetAction(_ sender: Any) {
        player2TextField.text = ""
        player2ProfileView.isHidden = true
        viewModel.player2 = nil
        tempCount = tempCount - 1
        submitButton.isHidden = true
    }
    
    //Player Two Outlet
    @IBOutlet weak var player2View: UIView!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet weak var player2Submit: UIButton!
    @IBOutlet weak var player2ProfileView: UIView!
    @IBOutlet weak var player2ImageView: UIImageView!
    @IBOutlet weak var player2ResetButton: UIButton!
    
    //Other Outlet
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var player1Info: UILabel!
    @IBOutlet weak var player2Info: UILabel!
    
    private let disposeBag = DisposeBag()
    private var viewModel = BattlePageViewModel()
    private var tempCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1ProfileView.isHidden = true
        player2ProfileView.isHidden = true
        submitButton.isHidden = true
        player1Info.isHidden = true
        player2Info.isHidden = true
        submitButton.addTarget(self, action: #selector(submitClick), for: .touchUpInside)
        
        _ = player1TextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.player1Text)
        _ = player2TextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.player2Text)
        
        (player1Submit.rx.tap).bind(onNext: {
            SVProgressHUD.show()
            let submitObservable = self.viewModel.submit(isPlayer1: true)
            submitObservable.subscribe(onNext: { (isSuccess) in
                if isSuccess {
                    self.tempCount = self.tempCount + 1
                    self.player1ProfileView.isHidden = false
                    if let avatar = self.viewModel.player1?.avatarUrl {
                        let url = URL(string: avatar)
                        self.player1ImageView.kf.setImage(with: url)
                    }
                    if self.tempCount == 2 {
                        self.submitButton.isHidden = false
                    }
                }
            }, onError: { (error) in
                print("SignUPViewController => Request failed with error.")
                SVProgressHUD.dismiss()
            }, onCompleted: {
                SVProgressHUD.dismiss()
                print("SignUPViewController => Request Completed.")
            }, onDisposed: {
                print("SignUPViewController => Request disposed.")
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
        
        (player2Submit.rx.tap).bind(onNext: {
            SVProgressHUD.show()
            let submitObservable = self.viewModel.submit(isPlayer1: false)
            submitObservable.subscribe(onNext: { (isSuccess) in
                if isSuccess {
                    self.tempCount = self.tempCount + 1
                    self.player2ProfileView.isHidden = false
                    if let avatar = self.viewModel.player2?.avatarUrl {
                        let url = URL(string: avatar)
                        self.player2ImageView.kf.setImage(with: url)
                    }
                    
                    if self.tempCount == 2 {
                        self.submitButton.isHidden = false
                    }
                }
            }, onError: { (error) in
                print("SignUPViewController => Request failed with error.")
                SVProgressHUD.dismiss()
            }, onCompleted: {
                SVProgressHUD.dismiss()
                print("SignUPViewController => Request Completed.")
            }, onDisposed: {
                print("SignUPViewController => Request disposed.")
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
    
    @objc private func submitClick() {
        if viewModel.calculateBattleResult() {
            print("Player1 Winner")
        } else {
            print("Player2 Winner")
        }
        updateView()
    }
    
    private func updateView() {
        self.player1Info.text = "Followers: \(viewModel.player1?.followers ?? 0)\nFollowing: \(viewModel.player1?.following ?? 0)\nPublic Repos: \(viewModel.player1?.publicRepos ?? 0)"
        self.player2Info.text = "Followers: \(viewModel.player2?.followers ?? 0)\nFollowing: \(viewModel.player2?.following ?? 0)\nPublic Repos: \(viewModel.player2?.publicRepos ?? 0)"
        self.submitButton.isHidden = true
        self.player1Info.isHidden = false
        self.player2Info.isHidden = false
    }

}
