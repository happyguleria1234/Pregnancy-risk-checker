//
//  EditProfileVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import SKCountryPicker
import Alamofire

class EditProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate , UITextFieldDelegate{
    
    var message = String()
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var bioView: UIView!
    @IBOutlet weak var bioTxtView: UITextView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    var imagePickers = UIImagePickerController()
    var base64String = String()
    var imagePicker: ImagePicker!
    var flagBase64 = String()
    var countryName = String()
    var userDetails = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
        
        passwordTxtFld.isUserInteractionEnabled = false
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        getData()
        guard let country = CountryManager.shared.currentCountry else {
            self.countryImage.isHidden = true
            
            return
        }
        
        countryButton.clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.height/2
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTxtFld {
            nameView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            emailView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            passwordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        } else if textField == emailTxtFld{
            
            nameView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            emailView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            passwordView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        } else if textField == passwordTxtFld {
            
            //            nameView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            //            emailView.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            //            passwordView.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }
    
    
    @IBAction func countryButtonAction(_ sender: Any) {
        
        let countryController = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in
            
            guard let self = self else { return }
            
            self.flagBase64 = country.flag?.toString() ?? ""
            self.countryName = country.countryName
            
            UserDefaults.standard.setValue(country.countryName, forKey: "name")
            self.flagBase64 = country.flag?.toString() ?? ""
            //            print(self.flagImage.image)
            print(self.flagBase64)
            
            
            
        }
        countryController.detailColor = UIColor.red
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
                        //                        self.passwordTxtFld.text = allData["password"] as? String ?? ""
                        self.passwordTxtFld.text = "12345678"
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
                            self.profileImage.image = UIImage(named: "img-1")
                        }
                        
                        let urls = URL(string:allData["countryImage"] as? String ?? "")
                        if urls != nil{
                            if let data = try? Data(contentsOf: urls!)
                            {
                                if let image: UIImage = (UIImage(data: data)){
                                    self.countryImage.image = image
                                    self.countryImage.contentMode = .scaleToFill
                                    IJProgressView.shared.hideProgressView()
                                }
                            }
                        }
                        else{
                            self.countryImage.image = UIImage(named: "")
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
    
    //MARK:-->    Upload Images
    
    func showActionSheet(){
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetController: UIAlertController = UIAlertController(title: NSLocalizedString("Upload Image", comment: ""), message: nil, preferredStyle: .actionSheet)
        actionSheetController.view.tintColor = UIColor.black
        let cancelActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { action -> Void in
            print("Cancel")
        }
        actionSheetController.addAction(cancelActionButton)
        
        let saveActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Take Photo", comment: ""), style: .default)
        { action -> Void in
            self.openCamera()
        }
        actionSheetController.addAction(saveActionButton)
        
        let deleteActionButton: UIAlertAction = UIAlertAction(title: NSLocalizedString("Choose From Gallery", comment: ""), style: .default)
        { action -> Void in
            self.gallery()
        }
        actionSheetController.addAction(deleteActionButton)
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePickers.delegate = self
            imagePickers.sourceType = UIImagePickerController.SourceType.camera
            imagePickers.allowsEditing = true
            self.present(imagePickers, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func gallery()
    {
        
        let myPickerControllerGallery = UIImagePickerController()
        myPickerControllerGallery.delegate = self
        myPickerControllerGallery.sourceType = UIImagePickerController.SourceType.photoLibrary
        myPickerControllerGallery.allowsEditing = true
        self.present(myPickerControllerGallery, animated: true, completion: nil)
        
    }
    
    
    //MARK:- ***************  UIImagePickerController delegate Methods ****************
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //        guard let image = info[UIImagePickerController.InfoKey.originalImage]
        guard let image = info[UIImagePickerController.InfoKey.editedImage]
                as? UIImage else {
            return
        }
        //        let imgData3 = image.jpegData(compressionQuality: 0.4)
        self.profileImage.contentMode = .scaleToFill
        self.profileImage.image = image
        guard let imgData3 = image.jpegData(compressionQuality: 0.2) else {return}
        base64String = imgData3.base64EncodedString(options: .lineLength64Characters)
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePickers = UIImagePickerController()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        let vc = TabBarVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func editProfile() {
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            IJProgressView.shared.showProgressView()
            let id = UserDefaults.standard.value(forKey: "id") ?? ""
            let url = Constant.shared.baseUrl + Constant.shared.editProfile
            print(url)
            
            
            let parms : [String:Any] = ["userID" : id,"name" : nameTxtFld.text ?? "","bio" : bioTxtView.text ?? "","profileImage" : base64String,"countryName" : countryName ?? ""]
            print(parms)
            AFWrapperClass.requestPOSTURL(url, params: parms, success: { (response) in
                IJProgressView.shared.hideProgressView()
                self.message = response["message"] as? String ?? ""
                let status = response["status"] as? String
                if status == "1"{
                    if let allData = response["userDetails"] as? [String:Any] {
                        IJProgressView.shared.hideProgressView()
                    }
                    showAlertMessage(title: Constant.shared.appTitle, message: self.message, okButton: "Ok", controller: self) {
                        let vc = TabBarVC.instantiate(fromAppStoryboard: .Home)
                        self.navigationController?.pushViewController(vc, animated: true)
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
    
    
    func updateData()  {
        
        let id = UserDefaults.standard.value(forKey: "id") ?? ""
        
        userDetails = ["userID" : id,"name" : nameTxtFld.text ?? "","bio" : bioTxtView.text ?? "","countryName" : countryName]
        
        if base64String != nil {
            let decodedData = NSData(base64Encoded: flagBase64, options: [])
            if let data = decodedData {
                let decodedimage = UIImage(data: data as Data)
                countryImage.image = decodedimage
            } else {
                print("error with decodedData")
            }
        } else {
            print("error with base64String")
        }
        
        
        let url = Constant.shared.baseUrl + Constant.shared.editProfile
        IJProgressView.shared.showProgressView()
        print(self.userDetails)
        AF.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in self.userDetails {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            print(multipartFormData)
            let imageData1 = self.profileImage.image!.jpegData(compressionQuality: 0.3)
            multipartFormData.append(imageData1!, withName: "profileImage" , fileName: "\(String.random(length: 8))", mimeType: "image/jpeg")
            
            let imageData2 = self.countryImage.image!.jpegData(compressionQuality: 0.3)
            multipartFormData.append(imageData2!, withName: "countryImage" , fileName: "\(String.random(length: 8))", mimeType: "image/jpeg")
            
        }, to: url, usingThreshold: UInt64.init(), method: .post, headers: nil, interceptor: nil, fileManager: .default)
        
        .uploadProgress(closure: { (progress) in
            print("Upload Progress: \(progress.fractionCompleted)")
        })
        .responseJSON { (response) in
            IJProgressView.shared.hideProgressView()
            switch response.result {
            case .success(let value):
                if let JSON = value as? [String: Any] {
                    if let dataDict = JSON as? NSDictionary{
                        let message = dataDict["message"] as? String ?? ""
                        let status = JSON["status"] as? String ?? ""
                        if status == "1"{
                            showAlertMessage(title: Constant.shared.appTitle, message: message, okButton: "Ok", controller: self) {
                                self.navigationController?.popViewController(animated: true)
                            }
                        }else{
                            alert(Constant.shared.appTitle, message: message, view: self)
                        }
                    }
                }
                
            case .failure(let error):
                if let JSON2 = error as? AFError {
                    print(JSON2)
                    alert(Constant.shared.appTitle, message: "\(JSON2)", view: self)
                }
                break
                
            }
            self.userDetails.removeAll()
        }
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeImageButton(_ sender: Any) {
        showActionSheet()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        if (nameTxtFld.text?.isEmpty)!{
            
            ValidateData(strMessage: " Name should not be empty")
            
        }else if (emailTxtFld.text?.isEmpty)!{
            
            ValidateData(strMessage: "Email should not be empty")
            
        }else{
            
            self.updateData()
            
        }
        
    }
    
}

extension EditProfileVC: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.profileImage.image = image
    }
}
extension String {
    
    static func random(length: Int = 8) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
