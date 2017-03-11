//
//  ChatViewController.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase


class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let emergencyAPIStore = EmergencyAPIStore()
    
    @IBOutlet var chatTableView: UITableView!
    
    var userID:String = ""
    var selectedEmergencyID:String!
    
    var emergenciesID: [String] = []
    var emergencies: [Emergency] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userID = (FIRAuth.auth()?.currentUser?.uid)!
        
        
        emergencyAPIStore.getUserEmergenciesID(userID) { (emergencyID) in
            self.emergenciesID.append(emergencyID)
            self.emergencyAPIStore.getEmergency(emergencyID, callback: { (emergency) in
                self.emergencies.insert(emergency, atIndex: 0)
                let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                self.chatTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            })
            
        }    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        let chatMessagesVC = segue.destinationViewController as! ChatMessages
        chatMessagesVC.emergencyID = selectedEmergencyID
        
    }
    
}















