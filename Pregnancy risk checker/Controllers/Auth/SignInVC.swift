//
//  SignInVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxtFld: UITextField!
    var messgae = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        let vc = SignUpVC.instantiate(fromAppStoryboard: .Auth)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        if (emailTxtFld.text?.isEmpty)!{
            
            ValidateData(strMessage: " Please enter username")
        }        else if (passwordTxtFld.text?.isEmpty)!{
            
            ValidateData(strMessage: " Please enter password")
        }else{
            self.signIn()
        }
        
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        
        let vc = SignUpVC.instantiate(fromAppStoryboard: .Auth)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func signIn()  {
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            IJProgressView.shared.showProgressView()
            let url = Constant.shared.baseUrl + Constant.shared.SignIN
            let params = ["name":emailTxtFld.text ?? "","password":passwordTxtFld.text ?? ""] as [String : Any]
            AFWrapperClass.requestPOSTURL(url, params: params, success: { (response) in
                IJProgressView.shared.hideProgressView()
                self.messgae = response["message"] as? String ?? ""
                let status = response["status"] as? Int
                if status == 1{
                    let allData = response as? [String:Any] ?? [:]
                    print(allData)
                    if let data = allData["user_detail"] as? [String:Any]  {
                        //                        UserDefaults.standard.set(true, forKey: "tokenFString")
                        UserDefaults.standard.set(1, forKey: "tokenFString")
                        UserDefaults.standard.set(data["id"], forKey: "id")
                        UserDefaults.standard.set(data["device_token"], forKey: "authToken")
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
