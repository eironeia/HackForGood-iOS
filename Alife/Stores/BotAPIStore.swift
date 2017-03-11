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

typealias SendMessageCompletionHandler = String -> Void

class BotAPIStore {
    
    func sendMessage(withText text: String, completion: SendMessageCompletionHandler) {
        
        let URL = NSURL(string: Constants.BotVG.url)!
        let URLRequest = NSMutableURLRequest(URL: URL)
        
        URLRequest.HTTPMethod = "POST"
        
        URLRequest.setValue(Constants.BotVG.subscriptionValue, forHTTPHeaderField: Constants.BotVG.subscriptionHeader)
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        let parameters: [String: AnyObject] = [
            "question": "\(text)"
        ]
        
        let encoded = encoding.encode(URLRequest, parameters: parameters).0
        Alamofire.request(encoded).responseJSON { (response) in

            if let result = response.result.value {
                print(result)
                if let answerString = result["answer"] as?  String {
                    let htmlString = answerString
                    if let htmldata = htmlString.dataUsingEncoding(NSUTF8StringEncoding), let attributedString = try? NSAttributedString(data: htmldata, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil) {
                        let finalString = attributedString.string
                        print(finalString)
                        completion(finalString)
                        
                    }
                }
            }
        }
    }
    
    /*
     {
     answer = "Hola! &#191;Qu&#233; queires saber sobre la violencia de g&#233;nero?";
     score = 100;
     }
     
     */

}
