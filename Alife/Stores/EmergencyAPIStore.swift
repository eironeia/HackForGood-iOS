//
//  EmergencyAPIStore.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import Alamofire
import Firebase
import SwiftyJSON

class EmergencyAPIStore {
    
    //  End point: /users/:id/emergencies
    func postEmergency(userID: String, type: Int, lat: Double, long: Double) {
        let URL = NSURL(string: "\(Constants.Server.URI_API)/users/\(userID)/emergencies")!
        let URLRequest = NSMutableURLRequest(URL: URL)
        
        URLRequest.HTTPMethod = "POST"
        
        URLRequest.setValue("key=\(Constants.Firebase.API_KEY)", forHTTPHeaderField: "Authorization")
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        let parameters: [String: AnyObject] = [
            "location": ["latitude": lat,
                "longitude": long],
            "type": type
        ]
        
        let encoded = encoding.encode(URLRequest, parameters: parameters).0
        Alamofire.request(encoded)
    }
    
    func getUserEmergenciesID(userID: String, callback: (emergencyID: String) -> Void) {
        print(FIRDatabase.database().reference().child("/userEmergencies/\(userID)"))
        FIRDatabase.database().reference().child("/userEmergencies/\(userID)").queryOrderedByValue().observeEventType(.ChildAdded, withBlock:  { (snapshot) in
            callback(emergencyID: snapshot.key)
            
        })
        
    }
    
    func getEmergency(emergencyID: String, callback: Emergency -> Void)  {
        
        FIRDatabase.database().reference().child("/emergencies/\(emergencyID)").queryOrderedByChild("_timestamp").observeEventType(.Value, withBlock: { (snapshot) in
            if let emergencyDictionary = snapshot.value as? Dictionary<String, AnyObject> {
                
                let emergencyJSON = JSON(emergencyDictionary)
                print(emergencyJSON["_timestamp"])
//                print("Success with JSON: \(emergencyJSON)")
                if let emergency = Emergency.object(fromJSON: emergencyJSON, withEmergencyID: emergencyID) as? Emergency {
                    callback(emergency)
                }
            }
        })
    }
}
