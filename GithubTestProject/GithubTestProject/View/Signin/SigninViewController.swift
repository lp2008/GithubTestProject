//
//  SigninViewController.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SigninViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    fileprivate var disposeBag = DisposeBag()
    var viewModel: SigninViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = SigninViewModel()
        
        signinButton.layer.cornerRadius = 5
        signinButton.layer.masksToBounds = true
        
        cardView.layer.cornerRadius = 5
        cardView.layer.masksToBounds = true
        cardView.layer.borderColor = UIColor.gray.cgColor
        cardView.layer.borderWidth = 1
        cardView.backgroundColor = .white
        
        _ = userNameTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.userNameText)
        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.passwordText)
        
        viewModel.isValid
            .subscribe(onNext: { [weak self] valid in
                if valid {
                    self?.signinButton.isEnabled = true
                    self?.signinButton.backgroundColor = UIColor(red: 41 / 255, green: 172 / 255, blue: 71 / 255, alpha: 1)
                } else {
                    self?.signinButton.isEnabled = false
                    self?.signinButton.backgroundColor = UIColor.gray
                }
            }).disposed(by: disposeBag)
        
        (signinButton.rx.tap).bind(onNext: {
            let submitObservable = self.viewModel.submit()
            submitObservable.subscribe(onNext: { (user) in
                print(user?.url ?? "")
                //self.navigationController?.pushViewController(TabBarViewController(), animated: true)
            }, onError: { (error) in
                print("SignUPViewController => Request failed with error.")
            }, onCompleted: {
                print("SignUPViewController => Request Completed.")
            }, onDisposed: {
                print("SignUPViewController => Request disposed.")
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }

}
