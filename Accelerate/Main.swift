//
//  Main.swift
//  Accelerate
//
//  Created by pollux on 2017/8/2.
//  Copyright © 2017年 pollux. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
class Main : UIViewController,UITableViewDataSource{
    
    @IBOutlet weak var Tab: UITableView!
    
    var dat = [Double]()
    var na = ""
    let useruid = Auth.auth().currentUser?.uid
    let root = Database.database().reference()
    
    override func viewDidLoad() {
        
    root.child("users").child(useruid!).child("score").observe(.value, with: { (snapshot) in
    
    if snapshot.hasChildren(){
        print("yes")
    let x = snapshot.value as! [String : [Double]]
    let data = x["score"]
    
    self.dat = data!
    self.Tab.reloadData()
    }
    
    
    
    else
    {
        print("no")
        let n:Double=0
    let y = [n]
    let  x = ["score" : y ]
    
    self.root.child("users").child(self.useruid!).child("score").updateChildValues(x)
    
        self.dat = [0]
       self.Tab.reloadData()
        }
    
    
    })

        
        
        root.child("users").child(useruid!).child("name").observe(.value, with: { (snap) in
            let n = snap.value as! [String : String]
            self.na = n["user"]!
          
        })
        
       
        
        super.viewDidLoad()
        
        print (dat)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dat.count
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.a.text = na
        cell.b.text = String(dat[indexPath.row])
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
