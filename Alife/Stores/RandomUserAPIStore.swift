//
//  RandomUserAPIStore.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 11/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Alamofire



typealias NewUserCompletionHandler = User -> Void

class RandomUserAPIStore {
    
    func getNewUser(completion: NewUserCompletionHandler) {
        
        let URL = NSURL(string: "https://randomuser.me/api/")!
        
        let URLRequest = NSMutableURLRequest(URL: URL)
        
        Alamofire.request(URLRequest).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
}
