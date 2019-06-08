//
//  WebViewController.swift
//  refugee
//
//  Created by admin on 06/06/19.
//  Copyright © 2019 ACE. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let myUrl = URL(string: "https://www.google.com")

    @IBOutlet weak var NewsWebKit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: myUrl!)
        NewsWebKit.load(request)
        
        
    }
    

    
}
