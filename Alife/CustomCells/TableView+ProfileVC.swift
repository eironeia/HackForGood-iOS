//
//  TableView+ProfileVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase

extension ProfileViewController {

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch  indexPath.row {

        case 0:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
            return cell
        case 1:
            
            if let cell = tableView.dequeueReusableCellWithIdentifier("imageLabelCell") as? ImageLabelCell {
                cell.customImageView.layer.cornerRadius = cell.customImageView.frame.height / 2
                cell.customImageView.image = UIImage(named: "godJobs")
                cell.customImageView.layer.masksToBounds = true
                cell.customUsernameLabel.text = "Alex"
                return cell
            }
            
        
        case 2:
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
            return cell
        case 3:
            
            if let cell = tableView.dequeueReusableCellWithIdentifier("twoLabelCells") as? TwoLabelCells {
                cell.customTitleLabel.text = "Email"
                cell.customValueLabel.text = "\((FIRAuth.auth()?.currentUser?.email)!)"
                return cell
            }
            
        case 4:

            if let cell = tableView.dequeueReusableCellWithIdentifier("twoLabelCells") as? TwoLabelCells {
                cell.customTitleLabel.text = "Birthday"
                cell.customValueLabel.text = "29 sept 1945"
                return cell
            }
            
        case 5:
            if let cell = tableView.dequeueReusableCellWithIdentifier("twoLabelCells") as? TwoLabelCells {
                cell.customTitleLabel.text = "Contact number"
                cell.customValueLabel.text = "+34 699 132 432"
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCellWithIdentifier("twoLabelCells") as? TwoLabelCells {
                cell.customTitleLabel.text = "Blood type"
                cell.customValueLabel.text = "B+"
                return cell
            }
        case 7:
            if let cell = tableView.dequeueReusableCellWithIdentifier("twoLabelCells") as? TwoLabelCells {
                cell.customTitleLabel.text = "Gender"
                cell.customValueLabel.text = "Male"
                return cell
            }
        case 8:
            if let cell = tableView.dequeueReusableCellWithIdentifier("twoLabelCells") as? TwoLabelCells {
                cell.customTitleLabel.text = "Weight"
                cell.customValueLabel.text = "78 kg"
                return cell
            }
        case 9:
            if let cell = tableView.dequeueReusableCellWithIdentifier("twoLabelCells") as? TwoLabelCells {
                cell.customTitleLabel.text = "Height"
                cell.customValueLabel.text = "170 cm"
                return cell
            }
            
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 2 {
            return 20
        }
        
        if indexPath.row == 1 {
            return 175
        }
        else {
            return 53
        }
        
    }
    

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
