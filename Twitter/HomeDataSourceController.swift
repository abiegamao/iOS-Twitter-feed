//
//  HomeDataSourceController.swift
//  Twitter
//
//  Created by Abz Maxey on 08/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import UIKit
import LBTAComponents

class HomeDataSourceController: DatasourceController{
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width , height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width , height: 100)
    }
}
