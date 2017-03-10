//
//  Buttons+LoginVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

extension LoginViewController {
    
    
    func login(withEmail email: String, andPassword password: String) {
        
        self.authAPIStore.login(email, password: password) { (user, error) in
            
            if let error = error {
                print(error)
            }
            else {
                self.performSegueWithIdentifier("emergencySegue", sender: self)
                
                print("Logged in")
            }
            
        }
    
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("registerScene", sender: self)
    }
    
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        
    }
}
