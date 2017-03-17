//
//  HomeDataSource.swift
//  Twitter
//
//  Created by Abz Maxey on 10/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users : [User] = {
        let user1 = User(name: "Joenabie Gamao", userName: "@abiegamao", bioText: "She likes to code,read and eat. She doesn't mind being alone. It increases her stamina and productivity.", profileImage: #imageLiteral(resourceName: "profile_image"))
        let user2 = User(name: "Edison Villamor", userName: "@edisonv7", bioText: "Good boy. Sweet. Caring. Honest. ",profileImage: #imageLiteral(resourceName: "edison"))

        return [user1,user2,user1]
    }()
    
    let tweets: [Tweet] = {
        let abzUser = User(name: "Abz Maxey", userName: "@jmgamao", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: UIImage(named: "profile_image")!)
        let tweet = Tweet(user: abzUser, message: "Welcome to episode 9 of the Twitter Series, really hope you guys are enjoying the series so far. I really really need a long text block to render out so we're going to stop here.")
        
        let tweet2 = Tweet(user: abzUser, message: "This is the second tweet message for our sample project. Very very exciting message....")
        
        return [tweet, tweet2]
    }()
    
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
