//
//  BattlePageViewModel.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/30/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

class BattlePageViewModel {
    
    let disposeBag = DisposeBag()
    
    var user: User?
    var player1: User?
    var player2: User?
    
    var player1Text = Variable<String>("")
    var player2Text = Variable<String>("")
    var player1Score = 0
    var player2Score = 0
    
    init(user: User?) {
       self.user = user
    }
    
    func submit(isPlayer1: Bool) -> Observable<Bool>  {
        return Observable.create({ (observer) -> Disposable in
            var name = ""
            if isPlayer1 {
                name = self.player1Text.value
            } else {
                name = self.player2Text.value
            }
            
            let playerInfoObservable = ApiService.sharedInstance.getDataFromServer(urlString: ApiEndpoints.baseURL + "/users/\(name)")
            playerInfoObservable.subscribe(onNext: { (anyResponse) in
                let user = Mapper<User>().map(JSONObject: anyResponse)
                
                if isPlayer1 {
                    self.player1 = user
                } else {
                    self.player2 = user
                }
                print("SignupViewModel => Request Success")
                
                observer.onNext(true)
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
    
    func calculateBattleResult() -> Bool {
        
        if let player = player1 {
            if let value = player.followers {
                player1Score = 3 * value
            }
        }
        
        if let player = player2 {
            if let value = player.followers {
                player2Score = 3 * value
            }
        }
        
        if player1Score > player2Score {
            return true
        }
        
        return false
    }
    
}
