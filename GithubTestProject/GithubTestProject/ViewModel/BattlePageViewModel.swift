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
    
    var player1: User?
    var player2: User?
    
    var player1Text = Variable<String>("")
    var player2Text = Variable<String>("")
    
    init() {
        
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
        var player1RepoCount = 0
        var player1FollowersCount = 0
        
        var player2RepoCount = 0
        var player2FollowersCount = 0
        
        if let player = player1 {
            if let value = player.publicRepos {
                player1RepoCount = value
            }
            
            if let value = player.followers {
                player1FollowersCount = value
            }
        }
        
        if let player = player2 {
            if let value = player.publicRepos {
                player2RepoCount = value
            }
            
            if let value = player.followers {
                player2FollowersCount = value
            }
        }
        
        if (player1RepoCount + player1FollowersCount) > (player2RepoCount + player2FollowersCount) {
            return true
        }
        
        return false
    }
    
}
