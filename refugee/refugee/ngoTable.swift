//Loads the information in tableview

import UIKit
import CoreData

var globalIndex: Int = 0

class ngoTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var namesNgo = [String]()
    @IBOutlet weak var table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesNgo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.table.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel!.text = self.namesNgo[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell at \(indexPath.row)")
        globalIndex = indexPath.row
        self.performSegue(withIdentifier: "cellDetailSegue", sender: self)
    }
    func retData() {
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NGO_Info")
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let temp = data.value(forKey: "name") as! String
                namesNgo.append(temp)
            }
            
        } catch {
            
            print("Failed")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retData()
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.table.dataSource = self
        self.table.delegate = self
    }
    
}
