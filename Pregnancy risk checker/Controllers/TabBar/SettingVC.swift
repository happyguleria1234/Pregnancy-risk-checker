//
//  SettingVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var settingTBView: UITableView!
    var nameArray = ["Change Password","About","Privacy Policy","Terms","Logout"]
    var iconsArray = ["pass","ab","pp","terms","log"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        settingTBView.separatorStyle = .none
        settingTBView.reloadData()
    }
    
    @IBAction func gotoProfileVC(_ sender: Any) {
        let vc = ProfileVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class settingTBViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension SettingVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingTBViewCell", for: indexPath) as! settingTBViewCell
        cell.nameLbl.text = nameArray[indexPath.row]
        cell.iconImage.image = UIImage(named: iconsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            
        }else if indexPath.row == 1{
            
        }else if indexPath.row == 2{
            let vc = PrivecyPolicyVC.instantiate(fromAppStoryboard: .Home)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
         
            
        }else if indexPath.row == 4{
            let dialogMessage = UIAlertController(title: Constant.shared.appTitle, message: "Are you sure you want to Logout?", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button click...")
                UserDefaults.standard.set(false, forKey: "tokenFString")
                //                            self.logout()
                
            })
            
            // Create Cancel button with action handlder
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel button click...")
            }
            
            //Add OK and Cancel button to dialog message
            dialogMessage.addAction(ok)
            dialogMessage.addAction(cancel)
            
            // Present dialog message to user
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
