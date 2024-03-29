//
//  SignUpVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var checkuncheckButton: UIButton!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxtView: UITextField!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTxtFld: UITextField!
    var messgae = String()
    var unchecked = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInbuttonAction(_ sender: Any) {
        let vc = SignInVC.instantiate(fromAppStoryboard: .Auth)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTxtFld {
            nameView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            emailView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            passwordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        } else if textField == emailTxtView{
            
            nameView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            emailView.borderColor =  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            passwordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        else if textField == passwordTxtFld{
            
            nameView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            emailView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            passwordView.borderColor =  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }
    
    @IBAction func termsAndCondition(_ sender: Any) {
    }
    
    @IBAction func checkUncheckButton(_ sender: Any) {
        if (unchecked == false)
        {
            checkuncheckButton.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)
            unchecked = true
        }
        else
        {
            checkuncheckButton.setBackgroundImage(UIImage(named: "uncheck"), for: UIControl.State.normal)
            unchecked = false
        }
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
            else if unchecked == false{

                  ValidateData(strMessage: "Please agree terms and conditions")
              }
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
                    let status = response["status"] as? String
                    if status == "1"{
//                        UserDefaults.standard.set(true, forKey: "tokenFString")
                        UserDefaults.standard.set(1, forKey: "tokenFString")
                        let allData = response as? [String:Any] ?? [:]
                        print(allData)
                        if let data = allData["data"] as? [String:Any]  {
                            UserDefaults.standard.set(data["userID"], forKey: "id")
                            print(data)
                        }
                        
                        let vc = SubscriptionVC.instantiate(fromAppStoryboard: .Home)
                        self.navigationController?.pushViewController(vc, animated: true)
                        
//                         let vc = TabBarVC.instantiate(fromAppStoryboard: .Home)
//                         self.navigationController?.pushViewController(vc, animated: true)
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
