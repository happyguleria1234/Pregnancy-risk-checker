//
//  SubscriptionVC.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/02/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import SwiftyStoreKit

class SubscriptionVC: UIViewController {
    
    @IBOutlet weak var priceButton: UIButton!
    var productId:IAPProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceButton.contentHorizontalAlignment = .right
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func subscriptionButton(_ sender: Any) {
        let vc = TabBarVC.instantiate(fromAppStoryboard: .Home)
        self.navigationController?.pushViewController(vc, animated: true)
        if let pid = UserDefaults.standard.value(forKey: "pid") as? String{
            self.verifyPurchase(product: pid)
        }
    }
    
    @IBAction func backBUtton(_ sender: Any) {
    }
    
    @IBAction func termsOFuse(_ sender: Any) {
    }
    
    func verifyPurchase(product: String){
        IJProgressView.shared.showProgressView()
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: sharedSecret)
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
            IJProgressView.shared.hideProgressView()
            switch result {
            case .success(let receipt):
                let productId = product
                let purchaseResult = SwiftyStoreKit.verifySubscription(
                    ofType: .autoRenewable,
                    productId: productId,
                    inReceipt: receipt)
                switch purchaseResult {
                case .purchased(let expiryDate, let items):
                    print("\(productId) is valid until \(expiryDate)\n\(items)\n")
                    
                    let timeStamp = (items[0].subscriptionExpirationDate)!.timeIntervalSince1970
                    print(timeStamp)
                    let fdate = Date(timeIntervalSince1970: timeStamp)
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd-MM-YYYY"
                    formatter.timeZone = .current
                    let expiryString = formatter.string(from: fdate)
                    print("Purchased Already will expire on \(expiryString)", items[0].transactionId)
                    let toDate = expiryDate
                    let fromDate = Calendar.current.date(byAdding: .month, value: -1, to: toDate)
                    //   let expiryString1 = formatter.string(from: fromDate!)
                    let todayDate = Date()
                    let formatter1 = DateFormatter()
                    formatter1.dateFormat = "dd-MM-YYYY"
                    formatter1.timeZone = .current
                    let expiryString1 = formatter1.string(from: todayDate)
                    PurchaseHelper.shared.setPurchaseDefaults(transactionDate: fromDate!, expiryDate: toDate, productId: productId)
                    //                       self.subscribe(productID: productId, productPlan: "Yearly", timeStamp: expiryString1, transactionId: items[0].transactionId)
                    break
                case .expired(let expiryDate, let items):
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd-MM-YYYY"
                    formatter.timeZone = .current
                    let expiryString = formatter.string(from: expiryDate)
                    print("\(productId) is expired since \(expiryString)\n\(items)\n")
                    
                // self.purchaseBtn.setTitle("Pay \(self.priceString)", for: .normal)
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                alert(Constant.shared.appTitle, message: error.localizedDescription, view: self)
            }
        }
    }
    //    func subscribe(productID: String, productPlan: String,timeStamp:String,transactionId: String){
    //        let url = Constant.shared.baseUrl + Constant.shared.SignIN
    //        let uid = UserDefaults.standard.value(forKey: "id") as! String
    //        let params = ["user_id":uid,"purchasePlan":"Yearly","expiredatetime":timeStamp] as [String : Any]
    //        print(params)
    //        IJProgressView.shared.showProgressView()
    //        AFWrapperClass.requestPOSTURL(url, params: params, success: { (dict) in
    //            print("subscribed response is", dict)
    //           IJProgressView.shared.hideProgressView()
    //            if let status = dict["status"] as? Int{
    //                let message = dict["message"] as? String ?? ""
    //                if status == 1{
    //                    UserDefaults.standard.set("1", forKey: "subscribed")
    ////                    UserDefaults.standard.set(purchasePlan, forKey: "purchasePlan")
    ////                    UserDefaults.standard.set(timeStamp, forKey: "expiredatetime")
    //
    //                    if let _ = UserDefaults.standard.value(forKey: "noSubscriptionNeeded") as? Bool{
    //                        UserDefaults.standard.removeObject(forKey: "noSubscriptionNeeded")
    //                    }
    //                   // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "subscribed"), object: nil)
    //                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
    //                    self.navigationController?.pushViewController(vc!, animated: true)
    //                }else{
    //                   alert(Constant.shared.appTitle, message: message, view: self)
    //                }
    //            }
    //        }) { (error) in
    //             IJProgressView.shared.hideProgressView()
    //            print(error.localizedDescription)
    //        }
    //    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func purchaseProduct(product: String){
        IJProgressView.shared.showProgressView()
        SwiftyStoreKit.purchaseProduct(product, quantity: 1, atomically: true) { result in
            IJProgressView.shared.hideProgressView()
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                if purchase.needsFinishTransaction{
                    SwiftyStoreKit.finishTransaction(purchase.transaction)
                }
                self.verifyPurchase(product: product)
            case .error(let error):
                switch error.code {
                case .unknown:
                    print("Unknown error. Please contact support")
                case .clientInvalid:
                    print("Not allowed to make the payment")
                case .paymentCancelled:
                    break
                case .paymentInvalid:
                    print("The purchase identifier was invalid")
                case .paymentNotAllowed:
                    print("The device is not allowed to make the payment")
                case .storeProductNotAvailable:
                    print("The product is not available in the current storefront")
                case .cloudServicePermissionDenied:
                    print("Access to cloud service information is not allowed")
                case .cloudServiceNetworkConnectionFailed:
                    print("Could not connect to the network")
                case .cloudServiceRevoked:
                    print("User has revoked permission to use this cloud service")
                default:
                    print((error as NSError).localizedDescription)
                    alert(Constant.shared.appTitle, message: error.localizedDescription, view: self)
                    break
                }
            }
        }
    }
    
}
