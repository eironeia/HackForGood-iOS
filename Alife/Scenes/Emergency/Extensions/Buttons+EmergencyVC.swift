//
//  Buttons+EmergencyVC.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

extension EmergencyViewController {
    func sendEmergency(type: Int) {
        getUserLocation { (lat, long) in
            self.emergencyAPIStore.postEmergency(self.userID, type: type, lat:
                lat, long: long)
            
        }
    }
    
    func deadRisk() {
        let type = 2
        sendEmergency(type)
        
        let alert = UIAlertController(title: "Notification sent", message: "We are processing your request. We already have your location and we will contact you as soon as possible", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Accept", style: .Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func severe() {
        let type = 1
        sendEmergency(type)
        
        let alert = UIAlertController(title: "Notification sent", message: "We are processing your request. We already have your location and we will contact you as soon as possible", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Accept", style: .Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func hazard() {
        let type = 0
        sendEmergency(type)
        
        let alert = UIAlertController(title: "Notification sent", message: "We are processing your request. We already have your location and we will contact you as soon as possible", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Accept", style: .Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func emergencyButton1Pressed(sender: AnyObject) {
        deadRisk()
    }
    
    @IBAction func emergencyButton2Pressed(sender: AnyObject) {
        deadRisk()
    }
    
    @IBAction func chatBot1Pressed(sender: AnyObject) {
        self.goToChatBot()
    }
    
    @IBAction func chatBot2Pressed(sender: AnyObject) {
        self.goToChatBot()
    }
    
    func goToChatBot() {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("chatBot") as UIViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}