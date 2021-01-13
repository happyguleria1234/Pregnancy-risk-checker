//
//  HomeVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataTBView.separatorStyle = .none
        // Do any additional setup after loading the view.
        
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
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTBViewCell", for: indexPath) as! DataTBViewCell
        cell.titleLbl.text = titleArray[indexPath.row]
        cell.descriptionLbl.text = descriptionArray[indexPath.row]
        cell.showImage.image = UIImage(named: imagesArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
