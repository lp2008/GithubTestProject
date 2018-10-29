//
//  ApiEndpoints.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation

class ApiEndpoints {
    
    static let baseURL = "https://api.github.com"
    static let trendingURL = "https://github-trending-api.now.sh/repositories?since=weekly"
    static let userLoginURL = ApiEndpoints.baseURL + "/user"
}
