//
//  ApiService.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class ApiService {
    
    static let sharedInstance: ApiService = ApiService()
    typealias ResponseData = Observable<Any>
    
    /*
     * MARK:- Get Data To Server
     * @discussion
     * @params URL
     * @return Observable<Any>
     */
    
    func getDataFromServer(urlString: String) -> ResponseData {
        
        let url = URL(string: urlString)
        
        return Observable.create({ (observer) -> Disposable in
            let request = Alamofire.request(url!).responseJSON(completionHandler: { (responseData) in
                switch(responseData.result) {
                case .success(let value):
                    if let statusCode = responseData.response?.statusCode, statusCode == 200 {
                        observer.onNext(value)
                        observer.onCompleted()
                    } else {
                        print("This is not the expected response")
                    }
                    break
                case.failure(let error):
                    observer.onError(error)
                    break
                }
            })
            return Disposables.create {
                request.cancel()
            }
        })
    }
}
