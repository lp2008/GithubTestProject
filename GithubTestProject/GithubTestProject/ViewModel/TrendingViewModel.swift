//
//  TrendingViewModel.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

class TrendingViewModel {
    
    private let disposebag = DisposeBag()
    
    var trendingItems: Variable<[TrendingItemViewModel]> = Variable<[TrendingItemViewModel]>([])
    
    init() {
        fetchAllTrendingData()
    }
    
    private func fetchAllTrendingData() {
        
        let trendingObservable = ApiService.sharedInstance.getDataFromServer(urlString: ApiEndpoints.trendingURL)
        trendingObservable.subscribe(onNext: { (anyResponse) in
            let trendings = Mapper<Trending>().mapArray(JSONObject: anyResponse)
            if let treningsArray = trendings {
                for trending in treningsArray {
                    self.trendingItems.value.append(TrendingItemViewModel(trending: trending))
                }
            }
        }, onError: { (error) in
            print("LocationViewModel: Request Failed with error.")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: self.disposebag)
    }
}
