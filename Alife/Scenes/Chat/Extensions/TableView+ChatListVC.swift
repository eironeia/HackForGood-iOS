//
//  TableView+ChatListVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

extension ChatListViewController {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emergencies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("chatListCell") as? ChatListCell {

            let emergency = self.emergencies[indexPath.row]
            
            cell.emergencyLocationTextView.text = "Emergency in Barcelona"
            cell.emergencyGravityTextView.text = self.minutesDifference(emergency.timestamp)
            
            cell.gravityColor.layer.cornerRadius = cell.gravityColor.frame.height / 2
            switch emergency.type {
            case 2:
                cell.gravityColor.backgroundColor = UIColor(red:0.81, green:0.24, blue:0.24, alpha:1.0)
            case 1:
                cell.gravityColor.backgroundColor = UIColor(red:0.89, green:0.45, blue:0.08, alpha:1.0)
            case 0:
                cell.gravityColor.backgroundColor = UIColor(red:1.00, green:0.90, blue:0.00, alpha:1.0)
            default:
                cell.gravityColor.backgroundColor = UIColor(red:1.00, green:0.90, blue:0.00, alpha:1.0)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func minutesDifference(timestamp: Int64) -> String {
        let newDate = NSDate()
        
        let calendar = NSCalendar.currentCalendar()
        
        let emergencyDate = NSDate(timeIntervalSince1970: Double(Int(timestamp/1000)))
        let datecomponents = calendar.components(NSCalendarUnit.Minute, fromDate: emergencyDate, toDate: newDate, options: [])
        print(datecomponents)
        if datecomponents.minute < 1 {
            return "Less than a minute"
        }
        else {
            return "\(datecomponents.minute) minutes ago"
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.selectedEmergencyID = self.emergencies[indexPath.row].id
        
        self.performSegueWithIdentifier("chatMessagesSegue", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
}
