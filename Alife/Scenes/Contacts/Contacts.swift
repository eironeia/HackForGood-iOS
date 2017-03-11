//
//  Contacts.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 11/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit


class Contacts: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var contactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactTableView.tableFooterView = UIView()
    }
    

}
