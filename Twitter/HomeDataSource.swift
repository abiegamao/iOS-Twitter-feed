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

class HomeDataSource: Datasource, JSONDecodable {
    var users : [User]
    var tweets: [Tweet]
    /// Creates model object from SwiftyJSON.JSON struct.
    required init(json: JSON) {
        //print("Now Ready to parse that Json: ",json)
        let usersJsonArray = json["users"].array
        let tweetsJsonArray = json["tweets"].array
        // Mapping Shorthand Version
        self.users = usersJsonArray!.map{ return User(json: $0) }
        // Long Version
        self.tweets = tweetsJsonArray!.map({ (yea) -> Tweet in
            return Tweet(json: yea)
        })
        
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
