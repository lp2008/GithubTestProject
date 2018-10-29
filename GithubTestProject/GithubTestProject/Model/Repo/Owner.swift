//
//  Owner.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import ObjectMapper


class Owner : NSObject, NSCoding, Mappable{
    
    var avatarUrl : String?
    var eventsUrl : String?
    var followersUrl : String?
    var followingUrl : String?
    var gistsUrl : String?
    var gravatarId : String?
    var htmlUrl : String?
    var id : Int?
    var login : String?
    var nodeId : String?
    var organizationsUrl : String?
    var receivedEventsUrl : String?
    var reposUrl : String?
    var siteAdmin : Bool?
    var starredUrl : String?
    var subscriptionsUrl : String?
    var type : String?
    var url : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Owner()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        avatarUrl <- map["avatar_url"]
        eventsUrl <- map["events_url"]
        followersUrl <- map["followers_url"]
        followingUrl <- map["following_url"]
        gistsUrl <- map["gists_url"]
        gravatarId <- map["gravatar_id"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        login <- map["login"]
        nodeId <- map["node_id"]
        organizationsUrl <- map["organizations_url"]
        receivedEventsUrl <- map["received_events_url"]
        reposUrl <- map["repos_url"]
        siteAdmin <- map["site_admin"]
        starredUrl <- map["starred_url"]
        subscriptionsUrl <- map["subscriptions_url"]
        type <- map["type"]
        url <- map["url"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        avatarUrl = aDecoder.decodeObject(forKey: "avatar_url") as? String
        eventsUrl = aDecoder.decodeObject(forKey: "events_url") as? String
        followersUrl = aDecoder.decodeObject(forKey: "followers_url") as? String
        followingUrl = aDecoder.decodeObject(forKey: "following_url") as? String
        gistsUrl = aDecoder.decodeObject(forKey: "gists_url") as? String
        gravatarId = aDecoder.decodeObject(forKey: "gravatar_id") as? String
        htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        login = aDecoder.decodeObject(forKey: "login") as? String
        nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
        organizationsUrl = aDecoder.decodeObject(forKey: "organizations_url") as? String
        receivedEventsUrl = aDecoder.decodeObject(forKey: "received_events_url") as? String
        reposUrl = aDecoder.decodeObject(forKey: "repos_url") as? String
        siteAdmin = aDecoder.decodeObject(forKey: "site_admin") as? Bool
        starredUrl = aDecoder.decodeObject(forKey: "starred_url") as? String
        subscriptionsUrl = aDecoder.decodeObject(forKey: "subscriptions_url") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if avatarUrl != nil{
            aCoder.encode(avatarUrl, forKey: "avatar_url")
        }
        if eventsUrl != nil{
            aCoder.encode(eventsUrl, forKey: "events_url")
        }
        if followersUrl != nil{
            aCoder.encode(followersUrl, forKey: "followers_url")
        }
        if followingUrl != nil{
            aCoder.encode(followingUrl, forKey: "following_url")
        }
        if gistsUrl != nil{
            aCoder.encode(gistsUrl, forKey: "gists_url")
        }
        if gravatarId != nil{
            aCoder.encode(gravatarId, forKey: "gravatar_id")
        }
        if htmlUrl != nil{
            aCoder.encode(htmlUrl, forKey: "html_url")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if login != nil{
            aCoder.encode(login, forKey: "login")
        }
        if nodeId != nil{
            aCoder.encode(nodeId, forKey: "node_id")
        }
        if organizationsUrl != nil{
            aCoder.encode(organizationsUrl, forKey: "organizations_url")
        }
        if receivedEventsUrl != nil{
            aCoder.encode(receivedEventsUrl, forKey: "received_events_url")
        }
        if reposUrl != nil{
            aCoder.encode(reposUrl, forKey: "repos_url")
        }
        if siteAdmin != nil{
            aCoder.encode(siteAdmin, forKey: "site_admin")
        }
        if starredUrl != nil{
            aCoder.encode(starredUrl, forKey: "starred_url")
        }
        if subscriptionsUrl != nil{
            aCoder.encode(subscriptionsUrl, forKey: "subscriptions_url")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        
    }
    
}
