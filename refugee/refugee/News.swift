// Shows all the news channels

import UIKit

class News: UIViewController {

    
    @IBOutlet weak var TOI: UIButton!
    
    @IBOutlet weak var IEx: UIButton!
    
    @IBOutlet weak var TNow: UIButton!
    
    @IBOutlet weak var ndtv: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func TOI(_ sender: Any) {
 
        UIApplication.shared.open(NSURL(string: "https://timesofindia.indiatimes.com")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func IEx(_ sender: Any) {

        UIApplication.shared.open(NSURL(string: "https://indianexpress.com")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func TNow(_ sender: Any) {
    
         UIApplication.shared.open(NSURL(string: "https://www.timesnownews.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func ndtv(_ sender: Any) {
   
         UIApplication.shared.open(NSURL(string: "https://www.ndtv.com")! as URL, options: [:], completionHandler: nil)
    }
}
