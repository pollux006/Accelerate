import UIKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
class ResultPage: UIViewController {
    
    let root = Database.database().reference()
    let useruid = Auth.auth().currentUser?.uid
    var New = [Double]()
    var Rank = [[String : Any]]()
    var na :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Top.text = self.textForLabel
        p = self.Topp
        root.child("users").child(useruid!).child("score").observe(.value, with: { (snapshot) in
            
            if snapshot.hasChildren(){
                
                let x = snapshot.value as! [String : [Double]]
                let data = x["score"]!
                
               self.New = data
                print(self.New)
                
            }
                

        })
        
        
        root.child("scores").observe(.value, with: { (snapshot) in
            
            if snapshot.hasChildren(){
                
                let g = snapshot.value as! [String : Any]
                
              self.Rank = g["score"] as! [[String : Any]]
                
            }
           
            
            
        })
        
        root.child("users").child(useruid!).child("name").observe(.value, with: { (snapshot) in
            
           
                
            let n = snapshot.value as! [String:String]
                self.na = n["user"]!
                
                
            
            
            
            
        })
        

    }
    
    var textForLabel : String = ""
    var Topp : Double = 0.0
    var p : Double = 0.0
    @IBOutlet weak var Top: UILabel!
    
    @IBAction func Done(_ sender: Any)
    {
        
        
                
        
        
        self.New.append(self.p)
        print(self.New)
        self.New = self.New.sorted(by: { (a,b) in
            return a > b})
        let n = ["score" : self.New]
        print(n)
        self.root.child("users").child(self.useruid!).child("score").updateChildValues(n)
        print("sucess")
        
        
        Rank.append(["user" : na , "score" : p])
        let Rk = ["score" : Rank]
        self.root.child("scores").updateChildValues(Rk)
        
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "Mnav")
        self.present(vc!, animated: true, completion: nil)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
     
   
       
        
            
            
            
            
            
            
            
            
            
            
      
}
}
