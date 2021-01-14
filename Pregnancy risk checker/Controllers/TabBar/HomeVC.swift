//
//  HomeVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var detailsTBView: UITableView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var dataTBView: UITableView!
    var alldataArray = [AllData]()
    var titleArray = ["Previous pregnancy and birth",
                      "Where to deliver",
                      "Delivery",
                      "Delivery complications",
                      "Blood and clotting problems",
                      "Bleeding in pregnancy",
                      "Medical conditions",
                      "Surgical conditions",
                      "Mental health",
                      "Cervix treatment",
                      "High blood pressure and Pre-eclampsia",
                      "Diabetes and Gestational Diabetes",
                      "Baby problems",
                      "Infections",
                      "Medication",
                      "Ethnicity",
                      "Genetic and family conditions",
                      "Liver and gallbladder problems",
                      "Skin conditions",
                      "Uterus and ovary problems",
                      "Cancer",
                      "Substance misuse"]
    var imagesArray = ["previous_pregnancy_birth","where_deliver","deliver","delivery_complication","blood_clotting_problem","bleeding_in_pregnancy","medical_conditions","surgical_conditions","mental_health","cervix_treatment","high_bp","diabities","baby_problem","infection","medication","ethnicity","genetic","liver","skin","uterus","cancer","cancer"]
    var descriptionArray = [ "Your risk based on previous pregnancy and birth",
                             "Your risk based on where you choose to deliver such as Hospital, midwife unit or homebirth",
                             "Risks associated with various types of deliveries such as forceps, caesarean, vacuum cup and breech",
                             "Risks based on complications during delivery such as bleeding, baby’s shoulder stuck, cord coming out first, etc..",
                             "Risks associated with blood disorders such as anaemia and sickle cell. And clotting problems such as haemophilia, factor V leiden and previous blood clot",
                             "Risks associated with bleeding during pregnancy",
                             "Risks associated with various medical conditions such as Asthma, Lupus, Crohns, and more",
                             "Risks associated with various surgical conditions such appendicitis, cholecystitis, pancreatitis, and more",
                             "Risks associated with depression, bipolar disorders and more",
                             "Risks associated with previous cervix treatments",
                             "Risks associated with high blood pressure conditions",
                             "Risks associated with diabetic conditions Such as type 1 and 2 Diabetes, and gestational diabetes",
                             "Conditions diagnosed on a scan such as big baby, small baby, slow growth, and more",
                             "Risks based on infections such as flu, Covid19, chicken pox, slapped cheek, Group B Strep, herpes, warts and more",
                             "Risks currently known about various medications",
                             "Risks based on ethnicity",
                             "Risks associated with genetic conditions and other problems that run in the family",
                             "Risks associated with liver and gallbladder issues such as Cholestasis",
                             "Risks associated with skin problems such as eczema, psoriasis and polymorphic eruption of pregnancy",
                             "Risks associated with problems such as fibroid and ovarian cyst",
                             "Risks associated with current and previous cancer diagnosis and treatment",""]
    var titleArry2 = ["Previous caesarean section",
                      "Previous normal vaginal birth",
                      "Previous induced birth",
                      "Previous miscarriage",
                      "Previous stillbirth",
                      "Previous preterm birth",
                      "Previous forceps or vacuum birth",
                      "Previous major vaginal or perineum tear",
                      "Previous Group B Strep infection",
                      "Previous Shoulder dystocia",
                      "Previous major blood loss in labour",
                      "Previous blood clot"]
    var descriptionArray2 = ["Risks associated with current pregnancy if you have had previous caesarean delivery",
                             "Risks associated with current pregnancy if you have had normal birth",
                             "Risks associated with current pregnancy if your last birth was induced",
                             "Risks associated with a previous miscarriage",
                             "Risks associated with a previous stillborn",
                             "Risks associated with a previous preterm birth",
                             "Risks associated with a forceps and vacuum cup birth",
                             "Risks associated with a previous significant tear",
                             "Risks associated with a previous Group B streptococcus infection",
                             "Risks associated with a previous Group B streptococcus infection",
                             "Risks associated with a previous major bleeding after delivery",
                             "Rates of delivery routes, complications and more"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataTBView.separatorStyle = .none
        // Do any additional setup after loading the view.
        detailsView.isHidden = true
        dataTBView.reloadData()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.detailsView.isHidden = true
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
    }
}


class DataTBViewCell: UITableViewCell {
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dataView: UIView!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == dataTBView{
            return titleArray.count

        }else{
            return titleArray.count

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == dataTBView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataTBViewCell", for: indexPath) as! DataTBViewCell
            cell.titleLbl.text = titleArray[indexPath.row]
            cell.descriptionLbl.text = descriptionArray[indexPath.row]
            cell.showImage.image = UIImage(named: imagesArray[indexPath.row])
            return cell

        }else{
            let cellB = tableView.dequeueReusableCell(withIdentifier: "DetailsTBViewCell", for: indexPath) as! DetailsTBViewCell
//            cellB.titleLbl.text = titleArry2[indexPath.row]
//            cellB.showImage.image = UIImage(named: imagesArray[indexPath.row])
            return cellB
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == dataTBView {
            self.detailsView.isHidden = false
            self.detailsTBView.reloadData()
        }else{
            
        }
    }
}

struct AllData {
    var title : String
    var description : String
    
    init(title : String , description : String) {
        self.title = title
        self.description = description
    }
}

class DetailsTBViewCell: UITableViewCell {
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dataView: UIView!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

