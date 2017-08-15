//
//  Loading.swift
//  Accelerate
//
//  Created by pollux on 2017/8/3.
//  Copyright © 2017年 pollux. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
class Loading : UIViewController
{
   
    
    let root = Database.database().reference()
    let useruid = Auth.auth().currentUser?.uid
    
    
    
    override func viewDidLoad()
    {
        
        
        root.child("users").child(useruid!).child("name").observe(.value, with: { (snapshot) in
            
            
            
            
            
            
            if snapshot.hasChildren() {
                
                print("true rooms exist")
                let targetBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = targetBoard.instantiateViewController(withIdentifier: "Mnav")
                self.present(vc, animated: true, completion: nil)
                
            }
            else{
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Name")
                self.present(vc!, animated: true, completion: nil)
            
            
            }
            
            
        }
            
            
            
        )
        
        
        
        
        
        
        super.viewDidLoad()
        
}



















}
