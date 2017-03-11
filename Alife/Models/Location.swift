//
//  Location.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import SwiftyJSON

public protocol LocationSerializable {
    static func object(fromJSON json: JSON) -> AnyObject?
}

class Location: LocationSerializable {
    var lat: Double
    var long: Double
    
    init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
    }
    
    static func object(fromJSON json: JSON) -> AnyObject? {
        guard let lat = json["latitude"].double
            , let long = json["longitude"].double
            else {
                print("ERROR: Parsing location")
                
                return nil
        }
        
        return Location(lat: lat, long: long)
    }
}