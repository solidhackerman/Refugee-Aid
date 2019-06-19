//Shows the websites to learn Indian languages

import UIKit

class languageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func google(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "https://translate.google.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func home(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "https://www.languageshome.com")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func Bhashi(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "https://www.dwibhashi.org")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func dictionary(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "http://hindi-english.org")! as URL, options: [:], completionHandler: nil)
    }
}
