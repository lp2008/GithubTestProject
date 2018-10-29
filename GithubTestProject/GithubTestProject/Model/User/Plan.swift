//
//  Plan.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import ObjectMapper


class Plan : NSObject, NSCoding, Mappable{
    
    var collaborators : Int?
    var name : String?
    var privateRepos : Int?
    var space : Int?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Plan()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        collaborators <- map["collaborators"]
        name <- map["name"]
        privateRepos <- map["private_repos"]
        space <- map["space"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        collaborators = aDecoder.decodeObject(forKey: "collaborators") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        privateRepos = aDecoder.decodeObject(forKey: "private_repos") as? Int
        space = aDecoder.decodeObject(forKey: "space") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if collaborators != nil{
            aCoder.encode(collaborators, forKey: "collaborators")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if privateRepos != nil{
            aCoder.encode(privateRepos, forKey: "private_repos")
        }
        if space != nil{
            aCoder.encode(space, forKey: "space")
        }
        
    }
    
}
