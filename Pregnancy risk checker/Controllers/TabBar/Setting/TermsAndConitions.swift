//
//  TermsAndConitions.swift
//  Pregnancy risk checker
//
//  Created by Apple on 06/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import WebKit

class TermsAndConitions: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
