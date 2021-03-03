//
//  SubCatDetailsVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 15/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import WebKit

class SubCatDetailsVC: UIViewController , WKNavigationDelegate{

    @IBOutlet weak var showData: WKWebView!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    var subcatTitle = String()
    var subCatDetails = String()
    
    var type = ["Black","Green","Orange","Red"]

    @IBOutlet weak var detailsTBView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = subcatTitle
        detailsLbl.text = subCatDetails
        self.detailsTBView.separatorStyle = .none
        // Do any additional setup after loading the view.
        print(subcatTitle)
        let nib = UINib(nibName: "SecondCellTableViewCell", bundle: nil)
        detailsTBView.register(nib, forHeaderFooterViewReuseIdentifier: "SecondCellTableViewCell")

        
        let nib1 = UINib(nibName: "ThirdCellXIB_s", bundle: nil)
        detailsTBView.register(nib1, forHeaderFooterViewReuseIdentifier: "ThirdCellXIB_s")

        let nib2 = UINib(nibName: "FourthCellXIB_s", bundle: nil)
        detailsTBView.register(nib2, forHeaderFooterViewReuseIdentifier: "FourthCellXIB_s")

        let nib3 = UINib(nibName: "FifthCellXIB_s", bundle: nil)
        detailsTBView.register(nib3, forHeaderFooterViewReuseIdentifier: "FifthCellXIB_s")
        
        
        
        let url = URL (string: "https://www.dharmani.com/single-page/Aspose-mobile-app/")
        let request = URLRequest(url: url!)
        showData.load(request)
        self.showData.navigationDelegate = self
//        IJProgressView.shared.showProgressView()
        
        detailsTBView.isHidden = true
        detailsTBView.reloadData()
        
    }
    
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        alert(Constant.shared.appTitle, message: error.localizedDescription, view: self)
        IJProgressView.shared.hideProgressView()
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error){
        alert(Constant.shared.appTitle, message: error.localizedDescription, view: self)
//        IJProgressView.shared.hideProgressView()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
class DetailsTBViewCell: UITableViewCell {
    
    @IBOutlet weak var showColorLbl: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension SubCatDetailsVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if subcatTitle == "Spontaneous vaginal birth" {
            
            if section == 0{
                
                return spontaneousVaginalBirthHeadingArrayBlack.count
                
            }else if section == 1{
                
                return spontaneousVaginalBirthHeadingArrayGreen.count
                
            }else if section == 2 {
                
                return spontaneousVaginalBirthHeadingArrayOrange.count
                
            }else if section == 3{
                
                return spontaneousVaginalBirthHeadingArrayRed.count
                
            }else if section == 4{
                
                return spontaneousVaginalBirthSourceHeadingData.count
                
            }
        }else{
            
        }
        if subcatTitle == "Induced vaginal birth" {
            
            if section == 0{
                
                return inducedVaginalBirthBlackTitle.count
                
            }else if section == 1{
                
                return inducedVaginalBirthGreenTitle.count
                
            }else if section == 2 {
                
                return inducedVaginalBirthOrangeTitle.count
                
            }else if section == 3{
                
                return inducedVaginalBirthRedTitle.count
                
            }else if section == 4{
                
                return spontaneousVaginalBirthSourceHeadingData.count
                
            }
        }else{
            
        }
        
        if subcatTitle == "Forceps delivery" {
            
            if section == 0{
                
                return forcepsDeliveryForBlackTitle.count
                
            }else if section == 1{
                
                return forcepsDeliveryForGreenTitle.count
                
            }else if section == 2 {
                
                return forcepsDeliveryForOrangeTitle.count
                
            }else if section == 3{
                
                return forcepsDeliveryForRedTitle.count
                
            }else if section == 4{
                
                return spontaneousVaginalBirthSourceHeadingData.count
                
            }
        }else{
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "DetailsTBViewCell", for: indexPath) as! DetailsTBViewCell

        if subcatTitle == "Spontaneous vaginal birth" {
            if indexPath.section == 0{
                
//                cell1.showColorLbl.isHidden = false
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cell1.titleLbl.text = spontaneousVaginalBirthHeadingArrayBlack[indexPath.row]
                cell1.detailsLbl.text = spontaneousVaginalBirthDetailsArrayBlack[indexPath.row]
                cell1.showImage.image = UIImage(named: spontaneousVaginalBirthImagesArrayBlack[indexPath.row])
                
            }else if indexPath.section == 1{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0.002239175302, green: 0.7885866117, blue: 0.003474284358, alpha: 1)
                cell1.titleLbl.text = spontaneousVaginalBirthHeadingArrayGreen[indexPath.row]
                cell1.detailsLbl.text = spontaneousVaginalBirthDetailsArrayGreen[indexPath.row]
                cell1.showImage.image = UIImage(named: spontaneousVaginalBirthImagesArrayGreen[indexPath.row])
                
                
            }else if indexPath.section == 2{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0.902779981, green: 0.5237263523, blue: 0.01161545236, alpha: 1)
                cell1.titleLbl.text = spontaneousVaginalBirthHeadingArrayOrange[indexPath.row]
                cell1.detailsLbl.text = spontaneousVaginalBirthDetailsArrayOrange[indexPath.row]
                cell1.showImage.image = UIImage(named: spontaneousVaginalBirthImagesArrayOrange[indexPath.row])
                
                
            }else if indexPath.section == 3{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                cell1.titleLbl.text = spontaneousVaginalBirthHeadingArrayRed[indexPath.row]
                cell1.detailsLbl.text = spontaneousVaginalBirthDetailsArrayRede[indexPath.row]
                cell1.showImage.image = UIImage(named: spontaneousVaginalBirthImagesArrayRed[indexPath.row])
                
                
            }else if indexPath.section == 4{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell1.titleLbl.text = spontaneousVaginalBirthSourceHeadingData[indexPath.row]
                cell1.detailsLbl.text = spontaneousVaginalBirthSourceData[indexPath.row]
                
            }
        }else{
            
            
//            cell1.showColorLbl.isHidden = true
            
        }
        
        
        if subcatTitle == "Induced vaginal birth"{
            
//            cell1.showColorLbl.isHidden = false
            
            if indexPath.section == 0{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cell1.titleLbl.text = inducedVaginalBirthBlackTitle[indexPath.row]
                cell1.detailsLbl.text = inducedVaginalBirthBlackDetails[indexPath.row]
                cell1.showImage.image = UIImage(named: inducedVaginalBirthBlackImages[indexPath.row])
                
            }else if indexPath.section == 1{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0.002239175302, green: 0.7885866117, blue: 0.003474284358, alpha: 1)
                cell1.titleLbl.text = inducedVaginalBirthGreenTitle[indexPath.row]
                cell1.detailsLbl.text = inducedVaginalBirthGreenDetails[indexPath.row]
                cell1.showImage.image = UIImage(named: inducedVaginalBirthGreenImages[indexPath.row])
                
                
            }else if indexPath.section == 2{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0.902779981, green: 0.5237263523, blue: 0.01161545236, alpha: 1)
                cell1.titleLbl.text = inducedVaginalBirthOrangeTitle[indexPath.row]
                cell1.detailsLbl.text = spontaneousVaginalBirthDetailsArrayOrange[indexPath.row]
                cell1.showImage.image = UIImage(named: inducedVaginalBirthOrangeImages[indexPath.row])
                
                
            }else if indexPath.section == 3{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                cell1.titleLbl.text = inducedVaginalBirthRedTitle[indexPath.row]
                cell1.detailsLbl.text = inducedVaginalBirthRedTitle[indexPath.row]
                cell1.showImage.image = UIImage(named: inducedVaginalBirthRedTitle[indexPath.row])
                
                
            }else if indexPath.section == 4{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell1.titleLbl.text = spontaneousVaginalBirthSourceHeadingData[indexPath.row]
                cell1.detailsLbl.text = spontaneousVaginalBirthSourceData[indexPath.row]
                
            }
            
        }else{
            
//            cell1.showColorLbl.isHidden = true
            
        }
        
        if subcatTitle == "Forceps delivery"{
            
//            cell1.showColorLbl.isHidden = false
            
            if indexPath.section == 0{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cell1.titleLbl.text = forcepsDeliveryForBlackTitle[indexPath.row]
                cell1.detailsLbl.text = forcepsDeliveryForBlackDetails[indexPath.row]
                cell1.showImage.image = UIImage(named: forcepsDeliveryForBlackImages[indexPath.row])
                
            }else if indexPath.section == 1{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0.002239175302, green: 0.7885866117, blue: 0.003474284358, alpha: 1)
                cell1.titleLbl.text = forcepsDeliveryForGreenTitle[indexPath.row]
                cell1.detailsLbl.text = forcepsDeliveryForGreenDetails[indexPath.row]
                cell1.showImage.image = UIImage(named: forcepsDeliveryForGreenImages[indexPath.row])
                
                
            }else if indexPath.section == 2{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 0.902779981, green: 0.5237263523, blue: 0.01161545236, alpha: 1)
                cell1.titleLbl.text = forcepsDeliveryForOrangeTitle[indexPath.row]
                cell1.detailsLbl.text = forcepsDeliveryForOrangeDetails[indexPath.row]
                cell1.showImage.image = UIImage(named: forcepsDeliveryForOrangeImages[indexPath.row])
                
                
            }else if indexPath.section == 3{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                cell1.titleLbl.text = forcepsDeliveryForRedTitle[indexPath.row]
                cell1.detailsLbl.text = forcepsDeliveryForredDetails[indexPath.row]
                cell1.showImage.image = UIImage(named: forcepsDeliveryForRedImages[indexPath.row])
                
                
            }else if indexPath.section == 4{
                
                cell1.showColorLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell1.titleLbl.text = spontaneousVaginalBirthSourceHeadingData[indexPath.row]
                cell1.detailsLbl.text = spontaneousVaginalBirthSourceData[indexPath.row]
                
            }
            
            
        }else{
            
//            cell1.showColorLbl.isHidden = true
            
        }
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
