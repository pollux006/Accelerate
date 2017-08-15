import UIKit
import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
class Rank : UIViewController,UITableViewDataSource{
    @IBOutlet weak var RTab: UITableView!
    
    let useruid = Auth.auth().currentUser?.uid
    let root = Database.database().reference()
    var na = ""
    var score : Double = 0
    var personal = [[String : Any]]()
    var ptr=[[String:Any]]()
    
    
    override func viewDidLoad()
    {
        
        
        root.child("scores").observe(.value, with :{ (snap) in
        let g = snap.value as! [String:Any]
        self.personal = g["score"] as! [[String : Any]]
        self.ptr = self.personal.sorted(by: { (t1,t2) -> Bool in
            return t1["score"]as!Double>t2["score"]as!Double
        })
        self.RTab.reloadData()
        
        })
        

       
                 super.viewDidLoad()
        
    }
    
   
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if personal.count<10
        {
        return personal.count
        }
        
        else{
            return 10
        }
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)->UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RCell", for: indexPath) as! Cell
        let q = ptr[indexPath.row]["user"]
        let e:Double = ptr[indexPath.row]["score"]! as! Double
        cell.a.text = q as! String
        cell.b.text = String(e)
        return cell
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
 
    


}
