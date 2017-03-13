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
        let user1 = User(name: "Joenabie Gamao", userName: "@abiegamao", bioText: "She likes to code,read dance and eat. How wonderful is his Grace for me. She doesn't mind being alone. It increases her stamina and productivity.", profileImage: #imageLiteral(resourceName: "profile_image"))
        let user2 = User(name: "Edison Villamor", userName: "@edisonv7", bioText: "Good boy. Sweet. Caring. Honest",profileImage: #imageLiteral(resourceName: "edison"))

        return [user1,user2]
    }()//["one","two","three"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item] // dataSource item
    }
    
    
    
}
