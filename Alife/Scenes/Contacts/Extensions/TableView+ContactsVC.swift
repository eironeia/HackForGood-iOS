//
//  TableView+ContactsVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 11/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Kingfisher


extension Contacts {

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("contactCell") as? ContactCell {
            
            cell.selectionStyle = .None
            
            if indexPath.row == 0 {
                
                cell.customName.text = "Alex"
                cell.customPhone.text = "+34 627 11 71 52"
                let URL = NSURL(string: "https://randomuser.me/api/portraits/med/men/70.jpg")!
                cell.customImage.kf_setImageWithURL(URL)
                cell.customImage.layer.cornerRadius = cell.customImage.frame.height / 2
                cell.customImage.layer.masksToBounds = true
            
            }
            
            if indexPath.row == 1 {
                cell.customName.text = "Cristian"
                cell.customPhone.text = "+34 627 56 71 52"
                let URL = NSURL(string: "https://randomuser.me/api/portraits/med/men/31.jpg")!
                cell.customImage.kf_setImageWithURL(URL)
                cell.customImage.layer.cornerRadius = cell.customImage.frame.height / 2
                cell.customImage.layer.masksToBounds = true
            }
            
            if indexPath.row == 2 {
                cell.customName.text = "Daniel"
                cell.customPhone.text = "+34 622 51 72 52"
                let URL = NSURL(string: "https://randomuser.me/api/portraits/med/men/32.jpg")!
                cell.customImage.kf_setImageWithURL(URL)
                cell.customImage.layer.cornerRadius = cell.customImage.frame.height / 2
                cell.customImage.layer.masksToBounds = true
            }
            
            if indexPath.row == 3 {
                cell.customName.text = "Sufian"
                cell.customPhone.text = "+34 627 11 89 52"
                let URL = NSURL(string: "https://randomuser.me/api/portraits/med/men/33.jpg")!
                cell.customImage.kf_setImageWithURL(URL)
                cell.customImage.layer.cornerRadius = cell.customImage.frame.height / 2
                cell.customImage.layer.masksToBounds = true
                
            }
            return cell
        }
        
        return UITableViewCell()
    }
}