//
//  Tweet.swift
//  Twitter
//
//  Created by Abz Maxey on 15/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable{ // Conform to decode
    let user: User
    let message: String
    
    init(json: JSON) {
        self.user = User(json: json["user"])
        self.message = json["message"].stringValue
    }
}
