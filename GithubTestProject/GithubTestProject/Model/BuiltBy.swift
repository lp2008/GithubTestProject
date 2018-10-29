//
//  BuiltBy.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import ObjectMapper


class BuiltBy : NSObject, NSCoding, Mappable{
    
    var avatar : String?
    var href : String?
    var username : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return BuiltBy()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        avatar <- map["avatar"]
        href <- map["href"]
        username <- map["username"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        avatar = aDecoder.decodeObject(forKey: "avatar") as? String
        href = aDecoder.decodeObject(forKey: "href") as? String
        username = aDecoder.decodeObject(forKey: "username") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if avatar != nil{
            aCoder.encode(avatar, forKey: "avatar")
        }
        if href != nil{
            aCoder.encode(href, forKey: "href")
        }
        if username != nil{
            aCoder.encode(username, forKey: "username")
        }
        
    }
    
}
