//
//  User.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

class User {

    var id:String
    var fullname:String
    var email:String
    
    init(id: String, fullname: String, email: String) {
    
        self.id = id
        self.fullname = fullname
        self.email = email
    }

}
