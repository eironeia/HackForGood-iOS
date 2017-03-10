//
//  RegisterViewController.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 05/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var authAPIStore: AuthAPIStore = AuthAPIStore()
    
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    
    var email: String = "hack@forgood.com"
    var password: String = "test123"
    var name: String = "Hackerman"
    var age: String = "29/09/1993"
    
    var user:User?
    
    override func viewWillDisappear(animated: Bool) {
        //        self.navigationController?.navigationBar.setItems([], animated: true)
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.delegate = self
        ageTextField.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "emergencySegue") {
            let destinationVC: UITabBarController = segue.destinationViewController as! TabBar
            destinationVC.navigationItem.hidesBackButton = true   
        }
    }
    
    func registerButtonPressed() {
        self.view.endEditing(true)
        self.authAPIStore.register(self.name, email: self.email, password: self.password) { (user) in
            
            self.performSegueWithIdentifier("emergencySegue", sender: self)
            
            print("Logged in")
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}


