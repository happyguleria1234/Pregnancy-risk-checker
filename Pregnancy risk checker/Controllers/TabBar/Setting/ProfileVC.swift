//
//  ProfileVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var bioTxtView: UITextView!
    @IBOutlet weak var passwordTxtView: UIView!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func editProfileButton(_ sender: Any) {
        let vc = EditProfileVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
