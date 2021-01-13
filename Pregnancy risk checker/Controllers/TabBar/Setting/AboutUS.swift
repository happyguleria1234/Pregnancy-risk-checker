//
//  AboutUS.swift
//  Pregnancy risk checker
//
//  Created by Apple on 06/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import WebKit

class AboutUS: UIViewController {

    @IBOutlet weak var webKitView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let link = URL(string:"https://www.dharmani.com/pregnancyApp/AboutUs.html")!
        let request = URLRequest(url: link)
        webKitView.load(request)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
}
