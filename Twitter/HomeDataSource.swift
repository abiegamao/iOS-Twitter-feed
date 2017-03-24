//
//  HomeDataSource.swift
//  Twitter
//
//  Created by Abz Maxey on 10/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON { // restrict to Json arrays only

    func decode<T: JSONDecodable>() throws -> [T]  {
        return try map({try T(json: $0)})
        //return []
    }
}


class HomeDataSource: Datasource, JSONDecodable {
    var users : [User]
    var tweets: [Tweet]
    /// Creates model object from SwiftyJSON.JSON struct.
    required init(json: JSON) throws{
        //print("Now Ready to parse that Json: ",json)
        guard let usersJsonArray = json["users"].array,
              let tweetsJsonArray = json["tweets"].array else{
            throw NSError(domain: "com.abz", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON is invalid"])
        }
        // Mapping Shorthand Version
        self.users = usersJsonArray.map{ return User(json: $0) }
        // Long Version
        self.tweets = tweetsJsonArray.map({ (yea) -> Tweet in
            return Tweet(json: yea)
        })
        
        // Remove Downcasting to implement Generics
        self.users = try usersJsonArray.decode()
        self.tweets = try tweetsJsonArray.decode()
        
        //[1, 2].decode()
        
        
        
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self] //cell sections
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
