//  This class is used to display detailed information of cell tapped in tableview.

import UIKit
import CoreData

var checkCondition = 0

class cellInfo: UIViewController {
    
    //Required lables.
    @IBOutlet weak var ngoName: UILabel!
    @IBOutlet weak var ngoPurpose: UILabel!
    @IBOutlet weak var ngoContact: UILabel!
    @IBOutlet weak var ngoAddress: UILabel!
    @IBOutlet weak var ngoWebsite: UILabel!
    
    
    func retData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NGO_Info")
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            var temp = 0
            for data in result as! [NSManagedObject] {
                if(temp == globalIndex)
                {
                    ngoName.text = data.value(forKey: "name") as? String
                    ngoPurpose.text = data.value(forKey: "purpose") as? String
                    ngoContact.text = data.value(forKey: "phone") as? String
                    ngoAddress.text = data.value(forKey: "address") as? String
                    ngoWebsite.text = data.value(forKey: "website") as? String
                }
                temp = temp + 1
                //data.value(forKey: "name") as! String
            }
            
        } catch {
            
            print("Failed")
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "registeredNGOs") {
            checkCondition = 1
            return true
        }
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        retData()
    }
}


