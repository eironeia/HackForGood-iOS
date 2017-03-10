//
//  AuthAPIStore.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import Alamofire
import Firebase

class AuthAPIStore {

    typealias RegisterUserCompletionHandler = (user: User?) -> Void
    
    func postUser(userID: String, withName name: String, andEmail email: String, completion: RegisterUserCompletionHandler) {
        
        let parameters: [String : AnyObject] = [
            "name": name,
            "email": email
        ]
        
        let URL = NSURL(string: "\(Constants.Server.URI_API)/users/\(userID)")!
        let URLRequest = NSMutableURLRequest(URL: URL)
        
        URLRequest.HTTPMethod = "POST"
        
        URLRequest.setValue("key=\(Constants.Firebase.API_KEY)", forHTTPHeaderField: "Authorization")
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        let encoded = encoding.encode(URLRequest, parameters: parameters).0
        
        Alamofire.request(encoded).responseJSON { (response) in
            
            switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                completion(user: User(id: userID, fullname: name, email: email))
                
            case .Failure(let error):
                print(error)
                completion(user: nil)
            }
            
        }
        
    }
    
    
    func register(name: String, email: String, password: String, completion: RegisterUserCompletionHandler) {
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
            if error == nil {
                //registration successful
                self.postUser(user!.uid, withName: name, andEmail: email, completion: completion)
                
            }else{
                completion(user: nil)
                print(error)
                
            }
        })
        
    }
    
    func login(email: String, password: String, completion: (FIRUser?, NSError?) -> Void) {
        //FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
        FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
            if error == nil {
                print(user?.uid)
                completion(user, error)
            } else {
                print(error)
            }
        })
        
    }
    
}