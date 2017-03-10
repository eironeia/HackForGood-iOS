//
//  TableView+EmergencyVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase

extension EmergencyViewController {

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return UITableViewCell()
        }
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("buttonCell") as? ButtonCell {
        
            cell.customButton.layer.cornerRadius = cell.customButton.frame.height / 2
            
            if indexPath.row == 1 {
                cell.customButton.backgroundColor = UIColor(red:0.81, green:0.24, blue:0.24, alpha:1.0)
                cell.customButton.layer.borderWidth = 4
                cell.customButton.layer.borderColor = UIColor.blackColor().CGColor
                cell.customButton.addTarget(self, action: #selector(deadRisk), forControlEvents: .TouchUpInside)
            }
            else if indexPath.row == 2 {
                cell.customButton.backgroundColor = UIColor(red:0.89, green:0.45, blue:0.08, alpha:1.0)
                cell.customButton.layer.borderWidth = 4
                cell.customButton.layer.borderColor = UIColor.blackColor().CGColor
                cell.customButton.addTarget(self, action: #selector(severe), forControlEvents: .TouchUpInside)
            }
            else if indexPath.row == 3 {
                cell.customButton.backgroundColor = UIColor(red:1.00, green:0.90, blue:0.00, alpha:1.0)
                cell.customButton.layer.borderWidth = 4
                cell.customButton.layer.borderColor = UIColor.blackColor().CGColor
                cell.customButton.addTarget(self, action: #selector(hazard), forControlEvents: .TouchUpInside)
            }
            else if indexPath.row == 4 {
                if let cell2 = tableView.dequeueReusableCellWithIdentifier("injuredInfoCell") {
                    return cell2
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
 
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120
        }
        if indexPath.row == 4 {
            return 84
        }
        
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
