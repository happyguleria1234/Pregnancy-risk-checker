//
//  HomeVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class HomeVC: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backButtonImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var searchTxtFld: UITextField!
    @IBOutlet weak var searchViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var dataTBView: UITableView!
    var issearchSelected = false
    var isdetailSelected = false
    var currentArray = [String]()
    var currentArrayDes = [String]()
    var selectedIndex = Int()
    var alldataArray = [AllData]()
    var filteredData: [String]!
    var searchResults = [String]()
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
        filteredData = titleArray
        searchViewHeight.constant = 0
        closeButton.isHidden = true
        backButton.isHidden = true
        backButtonImage.isHidden = true
        currentArray = titleArray
        currentArrayDes = descriptionArray
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        isdetailSelected = false
        backButton.isHidden = true
        homeLbl.isHidden = false
        backButtonImage.isHidden = true
        self.titleLbl.text = "Pregnancy Risk Checker"
        DispatchQueue.main.async {
            self.dataTBView.reloadData()
        }
    }
    @IBAction func cloaseButton(_ sender: UIButton) {
        searchViewHeight.constant = 0
        closeButton.isHidden = true
        issearchSelected = false
        searchTxtFld.text = ""
        searchResults.removeAll()
        DispatchQueue.main.async {
            self.dataTBView.reloadData()
        }
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        
        if sender.isSelected {
            
            searchViewHeight.constant = 0
            closeButton.isHidden = true
            sender.isSelected = false
        }else{
            
            searchViewHeight.constant = 40
            sender.isSelected = true
            closeButton.isHidden = false
            

        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchData(word: searchTxtFld.text ?? "")
        return true
    }
    
    
    func searchData(word : String) {
        
        searchResults.removeAll()
        for item in titleArray {
            if item.lowercased().contains(word.lowercased()) {
                searchResults.append(item)
                
            }
        }
        print(searchResults)
        issearchSelected = true
        
        DispatchQueue.main.async {
            self.dataTBView.reloadData()
        }
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
        
        
        if issearchSelected == true{
            
            return searchResults.count
            
        }else{
            if isdetailSelected == true{
                switch selectedIndex {
                case 0:
                    return subArray1.count
                case 1:
                    return subArray2.count
                case 2:
                    return subArray3.count
                case 3:
                    return subArray4.count
                case 4:
                    return subArray5.count
                case 5:
                    return subArray6.count
                case 6:
                    return subArray7.count
                case 7:
                    return subArray8.count
                case 8:
                    return subArray8.count
                case 9:
                    return subArray10.count
                case 10:
                    return subArray11.count
                case 11:
                    return subArray12.count
                case 12:
                    return subArray13.count
                case 13:
                    return subArray14.count
                case 14:
                    return subArray15.count
                case 15:
                    return subArray16.count
                case 16:
                    return subArray17.count
                case 17:
                    return subArray18.count
                case 18:
                    return subArray19.count
                case 19:
                    return subArray20.count
                case 20:
                    return subArray21.count
                case 21:
                    return subArray22.count
                case 22:
                    return subArray23.count
                default:
                    return 0
                }
            }else{
                return filteredData.count

            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        if issearchSelected == true {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataTBViewCell") as! DataTBViewCell
            cell.titleLbl.text = searchResults[indexPath.row]
//            cell.descriptionLbl.text = currentArrayDes[indexPath.row]
            return cell
            
        }else{
            
            if isdetailSelected == true{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DataTBViewCell") as! DataTBViewCell
                var selectedArrayForTitle = [String]()
                var selectedArrayForDes = [String]()
    //            var imgArray = [String]()
                switch selectedIndex {
                case 0:
                    selectedArrayForTitle = subArray1
                    selectedArrayForDes = subArrayDes1
                case 1:
                    selectedArrayForTitle = subArray2
                    selectedArrayForDes = subArrayDes2
                case 2:
                    selectedArrayForTitle = subArray3
                    selectedArrayForDes = subArrayDes3
                case 3:
                    selectedArrayForTitle = subArray4
                    selectedArrayForDes = subArrayDes4
                case 4:
                    selectedArrayForTitle = subArray5
                    selectedArrayForDes = subArrayDes5
                case 5:
                    selectedArrayForTitle = subArray6
                    selectedArrayForDes = subArrayDes6
                case 6:
                    selectedArrayForTitle = subArray7
                    selectedArrayForDes = subArrayDes7
                case 7:
                    selectedArrayForTitle = subArray8
                    selectedArrayForDes = subArrayDes8
                case 8:
                    selectedArrayForTitle = subArray9
                    selectedArrayForDes = subArrayDes9
                case 9:
                    selectedArrayForTitle = subArray10
                    selectedArrayForDes = subArrayDes10
                case 10:
                    selectedArrayForTitle = subArray11
                    selectedArrayForDes = subArrayDes11
                case 11:
                    selectedArrayForTitle = subArray12
                    selectedArrayForDes = subArrayDes12
                case 12:
                    selectedArrayForTitle = subArray13
                    selectedArrayForDes = subArrayDes13
                case 13:
                    selectedArrayForTitle = subArray14
                    selectedArrayForDes = subArrayDes14
                case 14:
                    selectedArrayForTitle = subArray15
                    selectedArrayForDes = subArrayDes15
                case 15:
                    selectedArrayForTitle = subArray16
                    selectedArrayForDes = subArrayDes16
                case 16:
                    selectedArrayForTitle = subArray17
                    selectedArrayForDes = subArrayDes17
                case 17:
                    selectedArrayForTitle = subArray18
                    selectedArrayForDes = subArrayDes18
                case 18:
                    selectedArrayForTitle = subArray19
                    selectedArrayForDes = subArrayDes19
                case 19:
                    selectedArrayForTitle = subArray20
                    selectedArrayForDes = subArrayDes20
                case 20:
                    selectedArrayForTitle = subArray21
                    selectedArrayForDes = subArrayDes21
                case 21:
                    selectedArrayForTitle = subArray22
                    selectedArrayForDes = subArrayDes22
                case 22:
                    selectedArrayForTitle = subArray23
                    selectedArrayForDes = subArrayDes23
                default:
                    print(subArray1)
                }
                if selectedArrayForTitle.count > 0 {
                    cell.titleLbl.text = selectedArrayForTitle[indexPath.row]
                    cell.descriptionLbl.text = selectedArrayForDes[indexPath.row]
                }
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DataTBViewCell") as! DataTBViewCell
                cell.titleLbl.text = filteredData[indexPath.row]
                cell.descriptionLbl.text = descriptionArray[indexPath.row]
                cell.showImage.image = UIImage(named: imagesArray[indexPath.row])
                return cell

            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isdetailSelected == true{
            
        }else{
            isdetailSelected = true
            selectedIndex = indexPath.row
            homeLbl.isHidden = true
            backButton.isHidden = false
            backButtonImage.isHidden = false
            self.titleLbl.text = titleArray[indexPath.row]
            DispatchQueue.main.async {
                self.dataTBView.reloadData()
            }
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

