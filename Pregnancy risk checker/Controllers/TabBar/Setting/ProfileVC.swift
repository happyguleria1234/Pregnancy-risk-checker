//
//  ProfileVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileVC: UIViewController {

    @IBOutlet weak var nameTxtFld: UITextField!
    var message = String()
    @IBOutlet weak var bioTxtView: UITextView!
    @IBOutlet weak var passwordTxtView: UIView!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTxtFld.isUserInteractionEnabled = false
        emailTxtFld.isUserInteractionEnabled = false
        bioTxtView.isUserInteractionEnabled = false

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.height/2
    }
    
    @IBAction func editProfileButton(_ sender: Any) {
        let vc = EditProfileVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func getData() {
        let id = UserDefaults.standard.value(forKey: "id") ?? ""
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            IJProgressView.shared.showProgressView()
            let signInUrl = Constant.shared.baseUrl + Constant.shared.profile
            print(signInUrl)
            let parms : [String:Any] = ["userID" : id]
            print(parms)
            AFWrapperClass.requestPOSTURL(signInUrl, params: parms, success: { (response) in
                IJProgressView.shared.hideProgressView()
                print(response)
                self.message = response["message"] as? String ?? ""
                let status = response["status"] as? String
                if status == "1"{
                    if let allData = response["userDetails"] as? [String:Any]{
                        self.nameLbl.text = allData["name"] as? String ?? ""
                        self.emailTxtFld.text = allData["email"] as? String ?? ""
                        self.passwordTxtFld.text = allData["password"] as? String ?? ""
                        self.bioTxtView.text = allData["bio"] as? String ?? ""
                        self.nameTxtFld.text = allData["name"] as? String ?? ""
                        self.profileImage.sd_setImage(with: URL(string:allData["profileImage"] as? String ?? ""), placeholderImage: UIImage(named: "img"))
//                        self.flagImage.sd_setImage(with: URL(string:allData["country_image"] as? String ?? ""), placeholderImage: UIImage(named: "img"))

                        let url = URL(string:allData["profileImage"] as? String ?? "")
                        if url != nil{
                            if let data = try? Data(contentsOf: url!)
                            {
                                if let image: UIImage = (UIImage(data: data)){
                                    self.profileImage.image = image
                                    self.profileImage.contentMode = .scaleToFill
                                    IJProgressView.shared.hideProgressView()
                                }
                            }
                        }
                        else{
                            self.profileImage.image = UIImage(named: "img")
                        }

                    }
                }else{
                    IJProgressView.shared.hideProgressView()
                    alert(Constant.shared.appTitle, message: self.message, view: self)
                }
            }) { (error) in
                IJProgressView.shared.hideProgressView()
                alert(Constant.shared.appTitle, message: error.localizedDescription, view: self)
                print(error)
            }
            
        } else {
            print("Internet connection FAILED")
            alert(Constant.shared.appTitle, message: "Check internet connection", view: self)
        }
    }
    
}
