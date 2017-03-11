//
//  LoginViewController.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController, UITextFieldDelegate, UIViewControllerTransitioningDelegate {

    
    var authAPIStore: AuthAPIStore = AuthAPIStore()

    let fields:[UITableViewCell] = []
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    var user:User? 
    
    override func viewWillDisappear(animated: Bool) {
//        self.navigationController?.navigationBar.setItems([], animated: true)
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
//        self.signOut()
        
        if let _ = FIRAuth.auth()?.currentUser {

            self.performSegueWithIdentifier("emergencySegue", sender: self)
            
            print("Logged in")
        }
        else {
            print("Not logged in")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.secureTextEntry = true
        
        emailTextField.text = "newuser@hotmail.com"
        passwordTextField.text = "test123"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "emergencySegue") {
            let destinationVC: UITabBarController = segue.destinationViewController as! TabBar
            
            let button1 = UIBarButtonItem(image: UIImage(named: "profileIconNav"), style: .Plain, target: self, action: #selector(goToProfile))
            destinationVC.navigationItem.hidesBackButton = true
            destinationVC.navigationItem.leftBarButtonItem = button1
            
        }
        
    }
    
    func goToProfile() {
        
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("profileViewController") as UIViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

    func signOut() {
        do{
            try FIRAuth.auth()?.signOut()
        }
        catch{
            print("Error while signing out!")
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
