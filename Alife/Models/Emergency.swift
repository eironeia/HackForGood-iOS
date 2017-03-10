//
//  Emergency.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import SwiftyJSON


public protocol EmergencySerializable {
    static func object(fromJSON json: JSON, withEmergencyID emergencyID: String) -> AnyObject?
}


class Emergency: EmergencySerializable {
    let id:String
    let type:Int
    let location: Location
    let timestamp: Int64
    
    init(id: String, type: Int, location: Location, timestamp: Int64) {
        
        self.id = id
        self.type = type
        self.location = location
        self.timestamp = timestamp
    }
    
    static func object(fromJSON json: JSON, withEmergencyID emergencyID: String) -> AnyObject? {
        
        if let location = Location.object(fromJSON: json["location"]) as? Location {
            guard let type = json["type"].int
                , let timestamp = json["_timestamp"].int64
                else {
                    print("ERROR: Parsing emergency")
                    return nil
            }
            
            return Emergency(id: emergencyID, type: type, location: location, timestamp: timestamp)
        }
        return nil
    }
}
