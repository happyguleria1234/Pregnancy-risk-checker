//
//  SignUpVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxtView: UITextField!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTxtFld: UITextField!
    var messgae = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInbuttonAction(_ sender: Any) {
        let vc = SignInVC.instantiate(fromAppStoryboard: .Auth)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signupButtonAction(_ sender: Any) {
        
        if (nameTxtFld.text?.isEmpty)!{
                  
                  ValidateData(strMessage: " Please enter name")
              }
              else if (emailTxtView.text?.isEmpty)!{
                  
                  ValidateData(strMessage: " Please enter email address")
              }
              else if isValidEmail(testStr: (emailTxtView.text)!) == false{
                  
                  ValidateData(strMessage: "Enter valid email")
              }
              else if (passwordTxtFld.text?.isEmpty)!{
                  
                  ValidateData(strMessage: " Please enter password")
              }else if (passwordTxtFld!.text!.count) < 4 || (passwordTxtFld!.text!.count) > 15{
                  
                  ValidateData(strMessage: "Please enter minimum 4 digit password")
                  UserDefaults.standard.string(forKey: "password")
                  
              }
//            else if unchecked == false{
//
//                  ValidateData(strMessage: "Please agree terms and conditions")
//              }
              else{
                  signUp()
              }
        
    }
    
    
        func signUp()  {
                    
            if Reachability.isConnectedToNetwork() == true {
                print("Internet connection OK")
                IJProgressView.shared.showProgressView()
                let url = Constant.shared.baseUrl + Constant.shared.SignUP
                let params = ["userName":nameTxtFld.text ?? "","email":emailTxtView.text ?? "", "password":passwordTxtFld.text ?? ""] as [String : Any]
                AFWrapperClass.requestPOSTURL(url, params: params, success: { (response) in
                    IJProgressView.shared.hideProgressView()
                    self.messgae = response["message"] as? String ?? ""
                    let status = response["status"] as? Int
                    if status == 1{
    //                    UserDefaults.standard.set(true, forKey: "tokenFString")
                        UserDefaults.standard.set(1, forKey: "tokenFString")

                        let allData = response as? [String:Any] ?? [:]
                        print(allData)
                        if let data = allData["data"] as? [String:Any]  {
                            UserDefaults.standard.set(data["id"], forKey: "id")
                            print(data)
                        }
                         let vc = TabBarVC.instantiate(fromAppStoryboard: .Home)
                         self.navigationController?.pushViewController(vc, animated: true)
                    }else{
                        IJProgressView.shared.hideProgressView()
                        alert(Constant.shared.appTitle, message: self.messgae, view: self)
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
