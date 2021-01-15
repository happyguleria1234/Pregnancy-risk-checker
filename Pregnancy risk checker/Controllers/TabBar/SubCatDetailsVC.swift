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
    @IBOutlet weak var detailsTBView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = subcatTitle
        self.detailsTBView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
class DetailsTBViewCell: UITableViewCell {
    
    @IBOutlet weak var setColorView: UIView!
    @IBOutlet weak var desLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var iconImgs: UIImageView!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension SubCatDetailsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTBViewCell", for: indexPath) as! DetailsTBViewCell
        cell.titleLbl.text = detailsTitleArray[indexPath.row]
        cell.desLbl.text = detailsArray[indexPath.row]
        cell.setColorView.backgroundColor = UIColor.random
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
