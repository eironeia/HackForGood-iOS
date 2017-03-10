//
//  BotAPIStore.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 10/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class BotAPIStore {
    
    func sendMessage(withText text: String) {
        
        let URL = NSURL(string: "https://westus.api.cognitive.microsoft.com/qnamaker/v1.0/knowledgebases/4a5d95b4-3943-4fc7-806c-80b83557c8f9/generateAnswer")!
        let URLRequest = NSMutableURLRequest(URL: URL)
        
        URLRequest.HTTPMethod = "POST"
        
        URLRequest.setValue("d0601958c0474370ab64a0eb1f7f02ef", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        let parameters: [String: AnyObject] = [
            "question": "\(text)"
        ]
        
        let encoded = encoding.encode(URLRequest, parameters: parameters).0
        Alamofire.request(encoded).responseJSON { (response) in
            print(response)
            print(response.result)
        }
    }

}
