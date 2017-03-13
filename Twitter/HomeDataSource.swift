//
//  HomeDataSource.swift
//  Twitter
//
//  Created by Abz Maxey on 10/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import LBTAComponents



class HomeDataSource: Datasource {
    
    let words = ["one","two","three"]
    
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
        return words.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item] // dataSource item
    }
    
    
    
}
