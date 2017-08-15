import UIKit
import CoreMotion
class CountPage: UIViewController{
    var a:Double = 0
    var highest:Double = 0
    var motionmanager = CMMotionManager()
    override func viewDidLoad(){
        super.viewDidLoad()
        motionmanager.accelerometerUpdateInterval = 0.01
        motionmanager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let mydata = data
            {
                let ax = mydata.acceleration.x
                let ay = mydata.acceleration.y
                let az = mydata.acceleration.z
                let a = sqrt((ax * ax) + (ay * ay) + (az * az))
                if a >= self.highest {
                    self.highest = a
                }
                self.Highestvale.text = String(self.highest)
                self.Nowvale.text = String(a)
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var Nowvale: UILabel!
    
    @IBOutlet weak var Highestvale: UILabel!
    
    


    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayTop" {
                print("Table view cell tapped")
                let vc = segue.destination as! ResultPage
                vc.textForLabel = String(highest)
                vc.Topp = highest
            }
    
    
            }
    }
}

