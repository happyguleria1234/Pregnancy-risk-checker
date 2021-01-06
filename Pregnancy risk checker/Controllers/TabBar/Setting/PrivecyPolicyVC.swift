//
//  PrivecyPolicyVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 06/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import WebKit

class PrivecyPolicyVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let link = URL(string:"https://www.dharmani.com/pregnancyApp/PrivacyPolicy.html")!
        let request = URLRequest(url: link)
        webView.load(request)
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
