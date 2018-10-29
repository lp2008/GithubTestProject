//
//  ProfileViewModel.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

class ProfileViewModel {
    
    var user: User?
    private let disposebag = DisposeBag()
    var repoItems: Variable<[RepoViewModel]> = Variable<[RepoViewModel]>([])
    
    init(user: User?) {
        self.user = user
         fetchAllRepoData()
    }
    
    private func fetchAllRepoData() {
        
        let repoObservable = ApiService.sharedInstance.getDataFromServer(urlString: user?.reposUrl ?? "")
        repoObservable.subscribe(onNext: { (anyResponse) in
            let repos = Mapper<Repo>().mapArray(JSONObject: anyResponse)
            if let reposArray = repos {
                for repo in reposArray {
                    self.repoItems.value.append(RepoViewModel(repo: repo))
                }
            }
        }, onError: { (error) in
            print("LocationViewModel: Request Failed with error.")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: self.disposebag)
    }
}
