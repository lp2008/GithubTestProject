//
//  Trending.swift
//  GithubTestProject
//
//  Created by Shohan Rahman on 10/29/18.
//  Copyright © 2018 Shohan Rahman. All rights reserved.
//

import Foundation
import ObjectMapper


class RootClass : NSObject, NSCoding, Mappable{
    
    var author : String?
    var builtBy : [BuiltBy]?
    var currentPeriodStars : Int?
    var descriptionField : String?
    var forks : Int?
    var language : String?
    var name : String?
    var stars : Int?
    var url : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return RootClass()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        author <- map["author"]
        builtBy <- map["builtBy"]
        currentPeriodStars <- map["currentPeriodStars"]
        descriptionField <- map["description"]
        forks <- map["forks"]
        language <- map["language"]
        name <- map["name"]
        stars <- map["stars"]
        url <- map["url"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        author = aDecoder.decodeObject(forKey: "author") as? String
        builtBy = aDecoder.decodeObject(forKey: "builtBy") as? [BuiltBy]
        currentPeriodStars = aDecoder.decodeObject(forKey: "currentPeriodStars") as? Int
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        forks = aDecoder.decodeObject(forKey: "forks") as? Int
        language = aDecoder.decodeObject(forKey: "language") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        stars = aDecoder.decodeObject(forKey: "stars") as? Int
        url = aDecoder.decodeObject(forKey: "url") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if builtBy != nil{
            aCoder.encode(builtBy, forKey: "builtBy")
        }
        if currentPeriodStars != nil{
            aCoder.encode(currentPeriodStars, forKey: "currentPeriodStars")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if forks != nil{
            aCoder.encode(forks, forKey: "forks")
        }
        if language != nil{
            aCoder.encode(language, forKey: "language")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if stars != nil{
            aCoder.encode(stars, forKey: "stars")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        
    }
    
}
