//
//  Service.swift
//  Twitter
//
//  Created by Abz Maxey on 19/03/2017.
//  Copyright © 2017 Abzster. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON


struct Service {
    static let sharedInstance = Service()
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    class JsonError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON error!")
        }
    }
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource) -> ())  { //datatype
        let request : APIRequest<HomeDataSource,JsonError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homeDataSource) in
            print("Successfully parsed Json Objects")
            print(homeDataSource.users.count)
            completion(homeDataSource)
            //self.datasource = homeDataSource // fill controller w/ data!
        }) { (err) in
            print("Error occurred upon parsing Json",err)
        }
    }
}
