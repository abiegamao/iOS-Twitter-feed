//
//  User.swift
//  Twitter
//
//  Created by Abz Maxey on 14/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import UIKit
import SwiftyJSON

// We use struct coz its pretty straightforward and already has constructors
struct User {
    let name: String
    let userName: String
    let bioText: String
    let profileImage: UIImage
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.userName = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImage = UIImage()//json["profileImageUrl"].
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
