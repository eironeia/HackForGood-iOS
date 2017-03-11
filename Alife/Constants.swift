//
//  Constants.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import Foundation


struct Constants {
    
    struct Firebase {
        static let API_KEY = "AIzaSyAuSQYw7yG9dN23RDOj41FvH3r1GXSTlHk"
    }
    
    struct Server {
        static let URI_API = "https://alifeapidev.herokuapp.com"
    }
    
    struct BotVG {
        static let url = "https://westus.api.cognitive.microsoft.com/qnamaker/v1.0/knowledgebases/4a5d95b4-3943-4fc7-806c-80b83557c8f9/generateAnswer"
        
        static let subscriptionHeader = "Ocp-Apim-Subscription-Key"
        static let subscriptionValue = "d0601958c0474370ab64a0eb1f7f02ef"
    }
    
    struct BotBL {
        static let url = "https://westus.api.cognitive.microsoft.com/qnamaker/v1.0/knowledgebases/4a5d95b4-3943-4fc7-806c-80b83557c8f9/generateAnswer"
        
        static let subscriptionHeader = "d0601958c0474370ab64a0eb1f7f02ef"
        static let subscriptionValue = "d0601958c0474370ab64a0eb1f7f02ef"
    }
    
}