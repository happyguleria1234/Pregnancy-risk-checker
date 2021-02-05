//
//  PurchaseHelper.swift
//  Arox
//
//  Created by apple on 9/17/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyStoreKit
import Alamofire

class PurchaseHelper{
    static let shared = PurchaseHelper()
    func setPurchaseDefaults(transactionDate: Date, expiryDate: Date, productId: String){
        let ud = UserDefaults.standard
        ud.set(transactionDate, forKey: "transactionDate")
        ud.set(expiryDate, forKey: "expiryDate")
        ud.set(productId, forKey: "purchasedProductId")
        UserDefaults.standard.set("1", forKey: "subscribed")
        if productId == "free"{
            ud.set("free", forKey: "freeVal")
        }
        ud.synchronize()
    }
    func removePurchaseDefaults(){
        let ud = UserDefaults.standard
        if ud.value(forKey: "transactionDate") != nil,ud.value(forKey: "expiryDate") != nil,ud.value(forKey: "purchasedProductId") != nil{
            ud.removeObject(forKey: "transactionDate")
            ud.removeObject(forKey: "expiryDate")
            ud.removeObject(forKey: "purchasedProductId")
            ud.synchronize()
        }
        if let _ = ud.value(forKey: "freeVal"){
            ud.removeObject(forKey: "freeVal")
        }
        UserDefaults.standard.set("0", forKey: "subscribed")
    }
    
    func validateReceipt(productId: String, secretKey: String, transactionId: String){
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: secretKey)
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
            switch result {
            case .success(let receipt):
                let purchaseResult = SwiftyStoreKit.verifySubscription(
                    ofType: .autoRenewable,
                    productId: productId,
                    inReceipt: receipt)
                switch purchaseResult {
                case .purchased(let expiryDate, let items):
                    if (expiryDate.timeIntervalSinceNow.sign == .plus){
                        let toDate = expiryDate;
                        let fromDate = Calendar.current.date(byAdding: .month, value: -1, to: toDate)
                        let filterTid = items.filter {$0.transactionId == transactionId}

                        if filterTid.count > 0{
                            let todayDate = Date()
                            let formatter1 = DateFormatter()
                            formatter1.dateFormat = "dd-MM-YYYY"
                            formatter1.timeZone = .current
                            let expiryString1 = formatter1.string(from: todayDate)
//                            let formatter = DateFormatter()
//                            formatter.dateFormat = "dd-MM-YYYY"
//                            formatter.timeZone = .current
//                            let expiryString1 = formatter.string(from: fromDate!)
                            self.setPurchaseDefaults(transactionDate: fromDate!, expiryDate: toDate, productId: productId)
                            var planString = ""
                            if productId == IAPProduct.yearlyPlan.rawValue{
                                planString = "yearlyPlan"
                            }
                            if transactionId != items[0].transactionId{
                            //    self.subscribe(productID: productId, productPlan: planString, timeStamp: expiryString1, transactionId: items[0].transactionId)
                            }
                        }else{
                            self.removePurchaseDefaults()
                        }
                        
                        for i in 0..<items.count{
                            if transactionId == items[i].transactionId{
                                print("transaction is at \(i)th index \(items)")
                            }
                        }
                        
                        
                        let timeStamp = expiryDate.timeIntervalSince1970
                        let fdate = Date(timeIntervalSince1970: timeStamp)
                        let formatter = DateFormatter()
                        formatter.dateFormat = "dd/MM/YYYY hh:mm a"
                        formatter.timeZone = .current
                        let expiryString = formatter.string(from: fdate)
                        print("Expiry date is in future \(expiryString)", items[0].originalTransactionId);
                        break
                    }else{
                        UserDefaults.standard.set(expiryDate, forKey: "dateExpired")
                        self.removePurchaseDefaults()
                    }
                case .expired(let expiryDate, let items):
                    self.removePurchaseDefaults()
                    UserDefaults.standard.set(expiryDate, forKey: "dateExpired")
                    print("\(productId) is expired since \(expiryDate)\n\(items[0].transactionId)\n\(items[0].isInIntroOfferPeriod)")
                case .notPurchased:
                    self.removePurchaseDefaults()
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                self.removePurchaseDefaults()
                print("Receipt verification failed: \(error)")
            }
        }
    }
    
//      func subscribe(productID: String, productPlan: String,timeStamp:String,transactionId: String){
//        let url = Constant.shared.baseurl + Constant.shared.signup
//         let uid = UserDefaults.standard.value(forKey: "id") as! String
//         var purchasePlan = ""
//         if productID == IAPProduct.weeklyPlan.rawValue{
//             purchasePlan = "weeklyPlan"
//         }else if productID == IAPProduct.monthlyPlan.rawValue{
//             purchasePlan = "monthlyPlan"
//         }else if productID == IAPProduct.yearlyPlan.rawValue{
//            purchasePlan = "yearlyPlan"
//        }
//         let params = ["user_id":uid,"purchasePlan":purchasePlan,"expiredatetime":timeStamp] as [String : Any]
//         print(params)
//         AFWrapperClass.requestPOSTURL(url, params: params, success: { (dict) in
//             print("subscribed response is", dict)
//             if let status = dict.value(forKey: "status") as? Int{
//                 if status == 1{
//                     UserDefaults.standard.set("1", forKey: "subscribed")
//                 }
//             }
//         }) { (error) in
//             print(error.localizedDescription)
//         }
//     }
    
    func isSubscriptionValid()->Bool{
        let ud = UserDefaults.standard
        if  ud.value(forKey: "transactionDate") != nil,ud.value(forKey: "expiryDate") != nil,ud.value(forKey: "purchasedProductId") != nil{
            return true
        }else{
            return false
        }
    }
    
}


