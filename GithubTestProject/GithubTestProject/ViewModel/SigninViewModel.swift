//
//  SigninViewModel.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

class SigninViewModel {
    
    private let disposeBag = DisposeBag()
    
    var userNameText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    init() {
        
    }
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(userNameText.asObservable(), passwordText.asObservable()) { userName, password in
            userName.count > 0 && password.count > 0
        }
    }
    
    func submit() -> Observable<User?>  {
        return Observable.create({ (observer) -> Disposable in
            let signupObservable = ApiService.sharedInstance.getLoginDataFromServer(userName: self.userNameText.value, password: self.passwordText.value)
            signupObservable.subscribe(onNext: { (anyResponse) in
                let user = Mapper<User>().map(JSONObject: anyResponse)
                
                print("SignupViewModel => Request Success")
                
                observer.onNext(user)
                observer.onCompleted()
            }, onError: { (error) in
                print("SignupViewModel => Request failed with error.")
                observer.onError(error)
            }, onCompleted: {
                print("SignupViewModel => Request Completed.")
            }, onDisposed: {
                print("SignupViewModel => Request disposed.")
            }).disposed(by: self.disposeBag)
            return Disposables.create {
                
            }
        })
    }
}

