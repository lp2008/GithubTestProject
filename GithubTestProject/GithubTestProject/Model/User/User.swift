//
//  User.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import ObjectMapper


class User : NSObject, NSCoding, Mappable{
    
    var avatarUrl : String?
    var bio : AnyObject?
    var blog : String?
    var collaborators : Int?
    var company : AnyObject?
    var createdAt : String?
    var diskUsage : Int?
    var email : AnyObject?
    var eventsUrl : String?
    var followers : Int?
    var followersUrl : String?
    var following : Int?
    var followingUrl : String?
    var gistsUrl : String?
    var gravatarId : String?
    var hireable : Bool?
    var htmlUrl : String?
    var id : Int?
    var location : AnyObject?
    var login : String?
    var name : AnyObject?
    var nodeId : String?
    var organizationsUrl : String?
    var ownedPrivateRepos : Int?
    var plan : Plan?
    var privateGists : Int?
    var publicGists : Int?
    var publicRepos : Int?
    var receivedEventsUrl : String?
    var reposUrl : String?
    var siteAdmin : Bool?
    var starredUrl : String?
    var subscriptionsUrl : String?
    var totalPrivateRepos : Int?
    var twoFactorAuthentication : Bool?
    var type : String?
    var updatedAt : String?
    var url : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return User()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        avatarUrl <- map["avatar_url"]
        bio <- map["bio"]
        blog <- map["blog"]
        collaborators <- map["collaborators"]
        company <- map["company"]
        createdAt <- map["created_at"]
        diskUsage <- map["disk_usage"]
        email <- map["email"]
        eventsUrl <- map["events_url"]
        followers <- map["followers"]
        followersUrl <- map["followers_url"]
        following <- map["following"]
        followingUrl <- map["following_url"]
        gistsUrl <- map["gists_url"]
        gravatarId <- map["gravatar_id"]
        hireable <- map["hireable"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        location <- map["location"]
        login <- map["login"]
        name <- map["name"]
        nodeId <- map["node_id"]
        organizationsUrl <- map["organizations_url"]
        ownedPrivateRepos <- map["owned_private_repos"]
        plan <- map["plan"]
        privateGists <- map["private_gists"]
        publicGists <- map["public_gists"]
        publicRepos <- map["public_repos"]
        receivedEventsUrl <- map["received_events_url"]
        reposUrl <- map["repos_url"]
        siteAdmin <- map["site_admin"]
        starredUrl <- map["starred_url"]
        subscriptionsUrl <- map["subscriptions_url"]
        totalPrivateRepos <- map["total_private_repos"]
        twoFactorAuthentication <- map["two_factor_authentication"]
        type <- map["type"]
        updatedAt <- map["updated_at"]
        url <- map["url"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        avatarUrl = aDecoder.decodeObject(forKey: "avatar_url") as? String
        bio = aDecoder.decodeObject(forKey: "bio") as? AnyObject
        blog = aDecoder.decodeObject(forKey: "blog") as? String
        collaborators = aDecoder.decodeObject(forKey: "collaborators") as? Int
        company = aDecoder.decodeObject(forKey: "company") as? AnyObject
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        diskUsage = aDecoder.decodeObject(forKey: "disk_usage") as? Int
        email = aDecoder.decodeObject(forKey: "email") as? AnyObject
        eventsUrl = aDecoder.decodeObject(forKey: "events_url") as? String
        followers = aDecoder.decodeObject(forKey: "followers") as? Int
        followersUrl = aDecoder.decodeObject(forKey: "followers_url") as? String
        following = aDecoder.decodeObject(forKey: "following") as? Int
        followingUrl = aDecoder.decodeObject(forKey: "following_url") as? String
        gistsUrl = aDecoder.decodeObject(forKey: "gists_url") as? String
        gravatarId = aDecoder.decodeObject(forKey: "gravatar_id") as? String
        hireable = aDecoder.decodeObject(forKey: "hireable") as? Bool
        htmlUrl = aDecoder.decodeObject(forKey: "html_url") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        location = aDecoder.decodeObject(forKey: "location") as? AnyObject
        login = aDecoder.decodeObject(forKey: "login") as? String
        name = aDecoder.decodeObject(forKey: "name") as? AnyObject
        nodeId = aDecoder.decodeObject(forKey: "node_id") as? String
        organizationsUrl = aDecoder.decodeObject(forKey: "organizations_url") as? String
        ownedPrivateRepos = aDecoder.decodeObject(forKey: "owned_private_repos") as? Int
        plan = aDecoder.decodeObject(forKey: "plan") as? Plan
        privateGists = aDecoder.decodeObject(forKey: "private_gists") as? Int
        publicGists = aDecoder.decodeObject(forKey: "public_gists") as? Int
        publicRepos = aDecoder.decodeObject(forKey: "public_repos") as? Int
        receivedEventsUrl = aDecoder.decodeObject(forKey: "received_events_url") as? String
        reposUrl = aDecoder.decodeObject(forKey: "repos_url") as? String
        siteAdmin = aDecoder.decodeObject(forKey: "site_admin") as? Bool
        starredUrl = aDecoder.decodeObject(forKey: "starred_url") as? String
        subscriptionsUrl = aDecoder.decodeObject(forKey: "subscriptions_url") as? String
        totalPrivateRepos = aDecoder.decodeObject(forKey: "total_private_repos") as? Int
        twoFactorAuthentication = aDecoder.decodeObject(forKey: "two_factor_authentication") as? Bool
        type = aDecoder.decodeObject(forKey: "type") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
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
        if bio != nil{
            aCoder.encode(bio, forKey: "bio")
        }
        if blog != nil{
            aCoder.encode(blog, forKey: "blog")
        }
        if collaborators != nil{
            aCoder.encode(collaborators, forKey: "collaborators")
        }
        if company != nil{
            aCoder.encode(company, forKey: "company")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if diskUsage != nil{
            aCoder.encode(diskUsage, forKey: "disk_usage")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if eventsUrl != nil{
            aCoder.encode(eventsUrl, forKey: "events_url")
        }
        if followers != nil{
            aCoder.encode(followers, forKey: "followers")
        }
        if followersUrl != nil{
            aCoder.encode(followersUrl, forKey: "followers_url")
        }
        if following != nil{
            aCoder.encode(following, forKey: "following")
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
        if hireable != nil{
            aCoder.encode(hireable, forKey: "hireable")
        }
        if htmlUrl != nil{
            aCoder.encode(htmlUrl, forKey: "html_url")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if location != nil{
            aCoder.encode(location, forKey: "location")
        }
        if login != nil{
            aCoder.encode(login, forKey: "login")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if nodeId != nil{
            aCoder.encode(nodeId, forKey: "node_id")
        }
        if organizationsUrl != nil{
            aCoder.encode(organizationsUrl, forKey: "organizations_url")
        }
        if ownedPrivateRepos != nil{
            aCoder.encode(ownedPrivateRepos, forKey: "owned_private_repos")
        }
        if plan != nil{
            aCoder.encode(plan, forKey: "plan")
        }
        if privateGists != nil{
            aCoder.encode(privateGists, forKey: "private_gists")
        }
        if publicGists != nil{
            aCoder.encode(publicGists, forKey: "public_gists")
        }
        if publicRepos != nil{
            aCoder.encode(publicRepos, forKey: "public_repos")
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
        if totalPrivateRepos != nil{
            aCoder.encode(totalPrivateRepos, forKey: "total_private_repos")
        }
        if twoFactorAuthentication != nil{
            aCoder.encode(twoFactorAuthentication, forKey: "two_factor_authentication")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        
    }
    
}
