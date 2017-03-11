//
//  Message.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import SwiftyJSON

public protocol MessageSerializable {
    static func object(fromJSON json: JSON) -> AnyObject?
}

class Message: MessageSerializable {

    var type: String
    var content: String
    var sentDate: String
    var senderID: String
    var senderName: String
    
    
    init(type: String, content: String, sentDate: String, senderID: String, senderName: String) {
        
        self.type = type
        self.content = content
        self.sentDate = sentDate
        self.senderID = senderID
        self.senderName = senderName
    }
    
    static func object(fromJSON json: JSON) -> AnyObject? {
        guard let type = json["type"].string
            , let content = json["content"].string
            , let sentDate = json["sentDate"].string
            , let senderID = json["senderID"].string
            , let senderName = json["senderName"].string
            else {
                print("ERROR: Parsing Message")
                return nil
        }
        
        
        return Message(type: type, content: content, sentDate: sentDate, senderID: senderID, senderName: senderName)
        
    }
}
