//
//  Signup.swift
//  Accelerate
//
//  Created by pollux on 2017/7/30.
//  Copyright © 2017年 pollux. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
class Signup : UIViewController{
    
    let root = Database.database().reference()
    // 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func createAccount(_ sender: Any)
    {
       
        if emailField.text == "" {
            let alertController = UIAlertController( title:"Error", message:"email adress and password cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated:true , completion: nil)
        
        }
        else {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!)
            { (user, error) in
                
                if error == nil
                    {
                        
                    print("You have successfully signed up")
                       
                        
                        Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text!) { (user, error) in
                            
                            if error == nil {
                                
                                //Go to the HomeViewController if the login is sucessful
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Name")
                                self.present(vc!, animated: true, completion: nil)
                                
                            } else {
                                
                                // 提示用戶從 firebase 返回了一個錯誤。
                                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                                
                                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                alertController.addAction(defaultAction)
                                
                                self.present(alertController, animated: true, completion: nil)
                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Nav")
                                self.present(vc!, animated: true, completion: nil)
                                
                            }
                        }
                    
                }
                else
                    {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                    
                        self.present(alertController, animated: true, completion: nil)
                    }
            }
        
    }
}
}
