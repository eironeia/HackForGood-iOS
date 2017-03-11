//
//  EmergencyViewController.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import SwiftLocation
import Firebase

class EmergencyViewController: UIViewController {
    let emergencyAPIStore = EmergencyAPIStore()
    
    var userID:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userID = (FIRAuth.auth()?.currentUser?.uid)!
        

        let button1 = UIBarButtonItem(image: UIImage(named: "abuseIcon"), style: .Plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = button1
        self.navigationController?.navigationItem.rightBarButtonItems = [button1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func getUserLocation(callback: (lat: Double, long: Double) -> Void) {
        SwiftLocation.Location.getLocation(withAccuracy: .Block, frequency: .OneShot, timeout: 50, onSuccess: { (location) in
            //double
            print("EmergencyLocation:   lat = \(location.coordinate.latitude)   long = \(location.coordinate.longitude)")
            callback(lat: location.coordinate.latitude, long: location.coordinate.longitude)
        }) { (lastValidLocation, error) in
            //double
            if let lastLoc = lastValidLocation {
                callback(lat: lastLoc.coordinate.latitude, long: lastLoc.coordinate.longitude)
            } else {
                print("ERROR: \(error)")
                print("FAIL: EmergencyLocation")
            }
            
        }
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
    }
}


