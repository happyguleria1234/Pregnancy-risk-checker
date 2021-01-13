//
//  EditProfileVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import SKCountryPicker


class EditProfileVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var message = String()

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
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
        
        
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
    
    
    @IBAction func countryButtonAction(_ sender: Any) {
        
        let countryController = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in

           guard let self = self else { return }
            
            self.flagBase64 = country.flag?.toString() ?? ""
            self.countryName = country.countryName
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
    
    
    func updateData() {
        if Reachability.isConnectedToNetwork() == true {
            IJProgressView.shared.showProgressView()
            let id = UserDefaults.standard.value(forKey: "id") ?? ""
            let url = Constant.shared.baseUrl + Constant.shared.editProfile
            print(url)
            let parms : [String:Any] = ["userID" : id,"name" : nameTxtFld.text ?? "","bio" : bioTxtView.text ?? "","profileImage" : base64String,"countryName" : countryName ]
            print(parms)
            AFWrapperClass.requestPOSTURL(url, params: parms) { (response) in
                IJProgressView.shared.hideProgressView()
                print(response)
            } failure: { (error) in
                IJProgressView.shared.hideProgressView()
                alert(Constant.shared.appTitle, message: error.localizedDescription, view: self)
                print(error)
            }

        }else{
            
        }
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeImageButton(_ sender: Any) {
        showActionSheet()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        updateData()
    }
    
}

extension EditProfileVC: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.profileImage.image = image
    }
}
