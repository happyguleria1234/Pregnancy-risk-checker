//
//  FeedBackVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class FeedBackVC: UIViewController , UITextFieldDelegate , UITextViewDelegate{

    @IBOutlet weak var feedbacView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var feedbackTxtView: UITextView!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var nameTxtFld: UITextField!
    var messgae = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        if (nameTxtFld.text?.isEmpty)!{
            
            ValidateData(strMessage: " Please enter username")
            
        }else if (emailTxtFld.text?.isEmpty)!{
            
            ValidateData(strMessage: " Please enter email")
            
        } else if isValidEmail(testStr: (emailTxtFld.text)!) == false{
            
            ValidateData(strMessage: "Enter valid email")
            
        }else if (feedbackTxtView.text.isEmpty){
            
            ValidateData(strMessage: "Feedback field is mandatory")
            
        }else{
            
            self.feedback()

        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTxtFld {

            nameView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            emailView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            feedbacView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        } else if textField == emailTxtFld{

            nameView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            emailView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            feedbacView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == feedbackTxtView {
            nameView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            emailView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            feedbacView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }
    
    
    func feedback() {
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            IJProgressView.shared.showProgressView()
            let id = UserDefaults.standard.value(forKey: "id") ?? ""
            let url = Constant.shared.baseUrl + Constant.shared.feedBack
            let params = ["userName":nameTxtFld.text ?? "","email":emailTxtFld.text ?? "", "message":feedbackTxtView.text ?? "","userID" : id] as [String : Any]
            AFWrapperClass.requestPOSTURL(url, params: params, success: { (response) in
                IJProgressView.shared.hideProgressView()
                self.messgae = response["message"] as? String ?? ""
                let status = response["status"] as? String
                if status == "1"{
                    let allData = response as? [String:Any] ?? [:]
                    print(allData)
                    self.nameTxtFld.text = ""
                    self.emailTxtFld.text = ""
                    self.feedbackTxtView.text = ""
                    alert(Constant.shared.appTitle, message: self.messgae, view: self)
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
