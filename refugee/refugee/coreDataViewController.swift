// Stores the data to database

import UIKit
import CoreData

class coreDataViewController: UIViewController {
    @IBOutlet weak var ngoName: UITextField!
    @IBOutlet weak var ngoPurpose: UITextField!
    @IBOutlet weak var ngoContact: UITextField!
    @IBOutlet weak var ngoAddress: UITextField!
    @IBOutlet weak var ngoUrl: UITextField!
    @IBOutlet weak var ngoLongitude: UITextField!
    @IBOutlet weak var ngoLatitude: UITextField!
  
    
    // Stores the data to database
    @IBAction func submitButton(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "NGO_Info", in: context)
        let newData = NSManagedObject(entity: entity!, insertInto: context)
        
        newData.setValue(ngoName.text!, forKey: "name")
        newData.setValue(ngoPurpose.text!, forKey: "purpose")
        newData.setValue(ngoContact.text!, forKey: "phone")
        newData.setValue(ngoAddress.text!, forKey: "address")
        newData.setValue(ngoUrl.text!, forKey: "website")
        newData.setValue(Double(ngoLongitude.text!)!, forKey: "long")
        newData.setValue(Double(ngoLatitude.text!)!, forKey: "lat")
        print(ngoContact.text!)
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("Failed saving")
        }
    }
    
    override func viewDidLoad() {
        
    }

}
