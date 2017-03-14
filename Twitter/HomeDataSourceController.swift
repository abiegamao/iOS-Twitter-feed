//
//  HomeDataSourceController.swift
//  Twitter
//
//  Created by Abz Maxey on 08/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import UIKit
import LBTAComponents

extension HomeDataSourceController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBarItems()
        collectionView?.backgroundColor = .white
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
    }

    // Cell Divider Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Dynamic Height
        
        if let user = self.datasource?.item(indexPath) as? User{
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2 // - left width right // ip7 plus
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66 ) // + top padding height of 2 labels
        }
        return CGSize(width: view.frame.width, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width , height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width , height: 50)
    }
}
