//
//  HomeDataSourceController.swift
//  Twitter
//
//  Created by Abz Maxey on 08/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import UIKit
import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController{
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies Something went wrong. Please Try Again. "
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        
        setUpNavigationBarItems()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, err) in
            if let _ = err  {
                //print("Error parsing:", err)
                self.errorMessageLabel.isHidden = false
                if let apiError = err as? APIError<Service.JsonError>{
                    
                    if apiError.response?.statusCode != 200 {
                       self.errorMessageLabel.text = "404 not found"
                    }else {
                        self.errorMessageLabel.text = "Invalid Parsing of JSON"
                    }
                    
                }
                return
            }
            self.datasource = homeDataSource
        }

    }
    
    // Cell Divider Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Dynamic Height
        
        if indexPath.section == 0{
        
            guard let user = self.datasource?.item(indexPath) as? User else{
                    return .zero }
            let estimatedHeight = estimatedHeightForText(user.bioText)
            return CGSize(width: view.frame.width, height: estimatedHeight + 88 )
        }
        else if indexPath.section == 1 {
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else{
                    return .zero }
            let estimatedHeight = estimatedHeightForText(tweet.message)
            return CGSize(width: view.frame.width, height: estimatedHeight + 80 )
            
        }
        return CGSize(width: view.frame.width, height: 200) //default: must have
    }
    
    private func estimatedHeightForText(_ text: String) -> CGFloat{
        let approximateWidthOfTweetTextView = view.frame.width - 12 - 50 - 12 - 2 // - left width right // ip7 plus
        let size = CGSize(width: approximateWidthOfTweetTextView, height: 1000)
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
    
    // MARK: Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        //section == 1 ?? .zero
        return CGSize(width: view.frame.width , height: 50)
    }
    // MARK: Footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width , height: 64)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}
