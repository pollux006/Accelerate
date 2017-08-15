 //
//  username.swift
//  Accelerate
//
//  Created by pollux on 2017/8/1.
//  Copyright © 2017年 pollux. All rights reserved.
//

 import UIKit
 import Firebase
 import FirebaseAuth
 import FirebaseAuthUI
 import FirebaseDatabase
 class username : UIViewController
 {
    @IBOutlet weak var Username: UITextField!
    
    let root = Database.database().reference()
    let useruid = Auth.auth().currentUser?.uid
    
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    }
    
        
    
    
    
    
    
    @IBAction func Bu(_ sender: Any) {
        
       
        
        
        
        
        
        
        
        

        
        
        
        
        if let str = Username.text{
            if str.characters.count <= 8{
        let us = ["user" : Username.text]
        root.child("users").child(useruid!).child("name").setValue(us)
               
        let targetBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = targetBoard.instantiateViewController(withIdentifier: "Mnav")
                self.present(vc, animated: true, completion: nil)

            }
            else{
                let alertController = UIAlertController(title: "Error", message: "user name cannot exceed 8 characters", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
            
            
        }
        else {
            let alertController = UIAlertController(title: "Error", message: "user name cannot be empty", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        
        
        }
        
    }
 
 
 
 
 
 
 }
 
 

 
 
 
 
