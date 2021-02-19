//
//  SubCatDetailsVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 15/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class SubCatDetailsVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    var subcatTitle = String()
    var mainDataArray = [MainData]()
    var allDataDetailsArrayForBlack = [AllDataDetailsForBlack]()
    var allDataDetailsArrayForGreen = [AllDataDetailsForGreen]()
    var allDataDetailsArrayForOrange = [AllDataDetailsForOrange]()
    var allDataDetailsArrayForRed = [AllDataDetailsForRed]()
    var allDataDetailsArrayForWhite = [AllDataDetailsForWhite]()
    
    var deliveryFirstBlackk = (["title" : spontaneousVaginalBirthHeadingArrayBlack, "des" : spontaneousVaginalBirthDetailsArrayBlack , "image" : spontaneousVaginalBirthImagesArrayBlack])
    var deliveryFirstGreenn = (["title" : spontaneousVaginalBirthHeadingArrayGreen, "des" : spontaneousVaginalBirthDetailsArrayGreen , "image" : spontaneousVaginalBirthImagesArrayGreen])
    var deliveryFirstOrangee = (["title" : spontaneousVaginalBirthHeadingArrayOrange, "des" : spontaneousVaginalBirthDetailsArrayOrange , "image" : spontaneousVaginalBirthImagesArrayOrange])
    var deliveryFirstRedd = (["title" : spontaneousVaginalBirthHeadingArrayRed, "des" : spontaneousVaginalBirthDetailsArrayRede , "image" : spontaneousVaginalBirthImagesArrayRed])
    
    
    
    var type = ["Black","Green","Orange","Red"]

    @IBOutlet weak var detailsTBView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = subcatTitle
        self.detailsTBView.separatorStyle = .none
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "SecondCellTableViewCell", bundle: nil)
        detailsTBView.register(nib, forHeaderFooterViewReuseIdentifier: "SecondCellTableViewCell")

        
        let nib1 = UINib(nibName: "ThirdCellXIB_s", bundle: nil)
        detailsTBView.register(nib1, forHeaderFooterViewReuseIdentifier: "ThirdCellXIB_s")

        let nib2 = UINib(nibName: "FourthCellXIB_s", bundle: nil)
        detailsTBView.register(nib2, forHeaderFooterViewReuseIdentifier: "FourthCellXIB_s")

        let nib3 = UINib(nibName: "FifthCellXIB_s", bundle: nil)
        detailsTBView.register(nib3, forHeaderFooterViewReuseIdentifier: "FifthCellXIB_s")
        
        allDataDetailsArrayForBlack.append(AllDataDetailsForBlack(headline: spontaneousVaginalBirthHeadingArrayBlack, images: spontaneousVaginalBirthImagesArrayBlack, description: spontaneousVaginalBirthDetailsArrayBlack, source: pontaneousVaginalBirthSourceHeadingData, sourceDetails: pontaneousVaginalBirthSourceData, type: "Black"))
        
        allDataDetailsArrayForGreen.append(AllDataDetailsForGreen(headline: spontaneousVaginalBirthHeadingArrayGreen, images: spontaneousVaginalBirthImagesArrayGreen, description: spontaneousVaginalBirthDetailsArrayGreen, source: pontaneousVaginalBirthSourceHeadingData, sourceDetails: pontaneousVaginalBirthSourceData, type: "Green"))
        
        allDataDetailsArrayForOrange.append(AllDataDetailsForOrange(headline: spontaneousVaginalBirthHeadingArrayOrange, images: spontaneousVaginalBirthImagesArrayOrange, description: spontaneousVaginalBirthDetailsArrayOrange, source: pontaneousVaginalBirthSourceHeadingData, sourceDetails: pontaneousVaginalBirthSourceData, type: "Orange"))
        
        allDataDetailsArrayForRed.append(AllDataDetailsForRed(headline: spontaneousVaginalBirthHeadingArrayRed, images: spontaneousVaginalBirthImagesArrayRed, description: spontaneousVaginalBirthDetailsArrayRede, source: pontaneousVaginalBirthSourceHeadingData, sourceDetails: pontaneousVaginalBirthSourceData, type: "Rad"))
        
        
        self.mainDataArray.append(MainData(dataforBlack: allDataDetailsArrayForBlack, dataforGreen: allDataDetailsArrayForGreen, dataforOrange: allDataDetailsArrayForOrange, dataforRed: allDataDetailsArrayForRed, dataforWhite: allDataDetailsArrayForWhite, type: colorType))
        
        
        detailsTBView.reloadData()
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
class DetailsTBViewCell: UITableViewCell {
    
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
        
        if section == 0{
            
            return 1
            
        }else if section == 1{
            
            return 8
            
        }else if section == 2 {
            
            return 8
            
        }else if section == 3{
            
            return 2
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        if mainDataArray[indexPath.section].type?[0] == "Black"{
        //            let cell1 = tableView.dequeueReusableCell(withIdentifier: "DetailsTBViewCell", for: indexPath) as! DetailsTBViewCell
        //            cell1.titleLbl.text = allDataDetailsArrayForBlack[indexPath.section].headline[indexPath.row]
        //            cell1.detailsLbl.text = allDataDetailsArrayForBlack[indexPath.section].description[indexPath.row]
        //            cell1.showImage.image = UIImage(named: allDataDetailsArrayForBlack[indexPath.section].images[indexPath.row])
        //            return cell1
        //
        //        }else if mainDataArray[indexPath.section].type?[1] == "Green"{
        //
        //            var cell2: SecondCellTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "SecondCellTableViewCell") as? SecondCellTableViewCell
        //            tableView.register(UINib(nibName: "SecondCellTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondCellTableViewCell")
        //            cell2 = tableView.dequeueReusableCell(withIdentifier: "SecondCellTableViewCell") as? SecondCellTableViewCell
        //            cell2!.titleLbl.text = allDataDetailsArrayForGreen[indexPath.section].headline[indexPath.row]
        //            cell2!.detailsLbl.text = allDataDetailsArrayForGreen[indexPath.section].description[indexPath.row]
        //            cell2!.showImage.image = UIImage(named: allDataDetailsArrayForGreen[indexPath.section].images[indexPath.row])
        //            return cell2!
        //
        //        }else if mainDataArray[indexPath.section].type?[2] == "Orange"{
        //
        //            var cell3: ThirdCellXIB_s? = tableView.dequeueReusableCell(withIdentifier: "ThirdCellXIB_s") as? ThirdCellXIB_s
        //            tableView.register(UINib(nibName: "ThirdCellXIB_s", bundle: nil), forCellReuseIdentifier: "ThirdCellXIB_s")
        //            cell3 = tableView.dequeueReusableCell(withIdentifier: "ThirdCellXIB_s") as? ThirdCellXIB_s
        //            cell3!.titleLbl.text = allDataDetailsArrayForOrange[indexPath.section].headline[indexPath.row]
        //            cell3!.detailsLbl.text = allDataDetailsArrayForOrange[indexPath.section].description[indexPath.row]
        //            cell3!.showImage.image = UIImage(named: allDataDetailsArrayForOrange[indexPath.section].images[indexPath.row])
        //            return cell3!
        //
        //        }else if mainDataArray[indexPath.section].type?[3] == "Red"{
        //
        //            var cell4: FourthCellXIB_s? = tableView.dequeueReusableCell(withIdentifier: "FourthCellXIB_s") as? FourthCellXIB_s
        //            tableView.register(UINib(nibName: "FourthCellXIB_s", bundle: nil), forCellReuseIdentifier: "FourthCellXIB_s")
        //            cell4 = tableView.dequeueReusableCell(withIdentifier: "FourthCellXIB_s") as? FourthCellXIB_s
        //            cell4!.titleLbl.text = allDataDetailsArrayForRed[indexPath.section].headline[indexPath.row]
        //            cell4!.detailsLbl.text = allDataDetailsArrayForRed[indexPath.section].description[indexPath.row]
        //            cell4!.showImage.image = UIImage(named: allDataDetailsArrayForRed[indexPath.section].images[indexPath.row])
        //            return cell4!
        //
        //        }else{
        //
        //            var cell5: FifthCellXIB_s? = tableView.dequeueReusableCell(withIdentifier: "FifthCellXIB_s") as? FifthCellXIB_s
        //            tableView.register(UINib(nibName: "FifthCellXIB_s", bundle: nil), forCellReuseIdentifier: "FifthCellXIB_s")
        //            cell5 = tableView.dequeueReusableCell(withIdentifier: "FifthCellXIB_s") as? FifthCellXIB_s
        //            cell5!.titleLbl.text = allDataDetailsArrayForWhite[indexPath.section].headline[indexPath.row]
        //            cell5!.detailsLbl.text = allDataDetailsArrayForWhite[indexPath.section].description[indexPath.row]
        //            return cell5!
        
        
        //        }
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "DetailsTBViewCell", for: indexPath) as! DetailsTBViewCell
        if indexPath.section == 0{
            
            cell1.titleLbl.text = deliveryFirstBlack["title"]
            cell1.detailsLbl.text = deliveryFirstBlack["des"]
            cell1.showImage.image = UIImage(named: deliveryFirstBlack["image"] ?? "")
            
        }else if indexPath.section == 1{
            
            cell1.titleLbl.text = deliveryFirstBlack["title"]
            cell1.detailsLbl.text = deliveryFirstBlack["des"]
            cell1.showImage.image = UIImage(named: deliveryFirstBlack["image"] ?? "")
            
            
        }else if indexPath.section == 2{
            
            cell1.titleLbl.text = deliveryFirstBlack["title"]
            cell1.detailsLbl.text = deliveryFirstBlack["des"]
            cell1.showImage.image = UIImage(named: deliveryFirstBlack["image"] ?? "")
            
            
        }else if indexPath.section == 3{
            
            cell1.titleLbl.text = deliveryFirstBlack["title"]
            cell1.detailsLbl.text = deliveryFirstBlack["des"]
            cell1.showImage.image = UIImage(named: deliveryFirstBlack["image"] ?? "")
            
            
        }
        return cell1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
