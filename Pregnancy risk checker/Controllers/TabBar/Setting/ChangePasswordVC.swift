//
//  ChangePasswordVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 12/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var newPasswordView: UIView!
    @IBOutlet weak var currntPasswordView: UIView!
    var password = String()
    var message = String()
    @IBOutlet weak var confirmPasswordTxtFld: UITextField!
    @IBOutlet weak var newPasswordTxtFld: UITextField!
    @IBOutlet weak var currentPasswordTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        if (currentPasswordTxtFld.text!.isEmpty){
            
            ValidateData(strMessage: "Please enter current password")
            
        }else if (password == currentPasswordTxtFld.text){
            
            ValidateData(strMessage: "Password matches")
            
        }else if (newPasswordTxtFld.text!.isEmpty){
            
            ValidateData(strMessage: "Please enter new password")
            
        }else if (newPasswordTxtFld!.text!.count) < 4 || (newPasswordTxtFld!.text!.count) > 15{
            
            ValidateData(strMessage: "Please enter minimum 4 digit password")
        }
        else if(confirmPasswordTxtFld.text!.isEmpty){
            
            ValidateData(strMessage: "Please enter confirm password")
            
        }
        else if newPasswordTxtFld.text != confirmPasswordTxtFld.text{
            
            ValidateData(strMessage: "New password and Confirm password should be same")
            
        }else if currentPasswordTxtFld.text == confirmPasswordTxtFld.text{
            
            ValidateData(strMessage: "New & old password should be different")
            
        }else{
            self.changePassword()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == currentPasswordTxtFld {
            currntPasswordView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            newPasswordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            confirmPasswordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        } else if textField == newPasswordTxtFld{
            
            currntPasswordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            newPasswordView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            confirmPasswordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        } else if textField == confirmPasswordTxtFld {
            
            currntPasswordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            newPasswordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            confirmPasswordView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }
    
    
    func changePassword()  {
        let id = UserDefaults.standard.value(forKey: "id") ?? ""
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            IJProgressView.shared.showProgressView()
            let signInUrl = Constant.shared.baseUrl + Constant.shared.ChangePassword
            print(signInUrl)
            let parms : [String:Any] = [ "userID" : id, "newPassword" : newPasswordTxtFld.text ?? "", "oldPassword" : currentPasswordTxtFld.text ?? "", "confirmPassword" : confirmPasswordTxtFld.text ?? ""]
            print(parms)
            AFWrapperClass.requestPOSTURL(signInUrl, params: parms, success: { (response) in
                IJProgressView.shared.hideProgressView()
                //                print(response)
                self.message = response["message"] as? String ?? ""
                let status = response["status"] as? String ?? ""
                if status == "1"{
                    showAlertMessage(title: Constant.shared.appTitle, message: self.message, okButton: "OK", controller: self) {
                        self.navigationController?.popViewController(animated: true)
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
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
