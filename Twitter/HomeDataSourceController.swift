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
    
    // Rotate Screen
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBarItems()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        //let homeDataSource = HomeDataSource()
        //self.datasource = homeDataSource
        fetchHomeFeed()
    }
    
    
    
    class Home: JSONDecodable{
        let users: [User]
        
        required init(json: JSON) {
            print("Now Ready to parse that Json: ",json)
            var users = [User]()
            
            let array = json["users"].array
            //print(array)
            for userJson in array!{
                let name = userJson["name"].stringValue
                let username = userJson["username"].stringValue
                //let profile_imageUrl =  userJson["profileImageUrl"].stringValue
                let bio = userJson["bio"].stringValue
                let user = User(name: name, userName: username, bioText: bio, profileImage: UIImage())
                users.append(user)
                //print(user.userName)
            }
            self.users = users
        }
    }
    
    class JsonError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON error!")
        }
    }
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    fileprivate func fetchHomeFeed() {
        let request : APIRequest<HomeDataSource,JsonError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homeDataSource) in
            print("Successfully parsed Json Objects")
            print(homeDataSource.users.count)
            self.datasource = homeDataSource // fill controller w/ data!
        }) { (err) in
            print("Error occurred upon parsing Json",err)
        }
        //print("123")
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
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 88 ) // + top padding height of 2 labels
        }
        return CGSize(width: view.frame.width, height: 200) //default: must have
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
