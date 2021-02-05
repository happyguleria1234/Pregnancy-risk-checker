//
//  IAPService.swift
//  Arox
//
//  Created by apple on 8/22/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import StoreKit
import SwiftyStoreKit

var sharedSecret = "74d21d5506c94441910e758889d011d2"
class IAPService: NSObject{
    private override init() { }
    static let shared = IAPService()
    var products = [SKProduct]()
    let paymentQueue = SKPaymentQueue.default()
    //MARK::- Getting products
    func getProducts(){
        let products: Set = [IAPProduct.yearlyPlan.rawValue]
        
        let productRequest = SKProductsRequest(productIdentifiers: products)
        productRequest.delegate = self
        productRequest.start()
        paymentQueue.add(self)
    }
    
    //MARK::- Make a purchase with product
    func purchase(product: IAPProduct){
        guard let productToPurchase = self.products.filter({$0.productIdentifier == product.rawValue}).first else{
            return
        }
        let payment = SKPayment(product: productToPurchase)
        paymentQueue.add(payment)
    }
    
    func makeAPurchase(){
        if SwiftyStoreKit.canMakePayments{
            SwiftyStoreKit.purchaseProduct(products[0]) { (result) in
                print(result)
            }
        }
    }
    
    
    
}

extension IAPService: SKProductsRequestDelegate{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
       self.products = response.products
        var pricingArray = [String]()
        for product in products{
            pricingArray.append(product.localizedPrice ?? "")
            if #available(iOS 12.2, *) {
                print(product.localizedDescription, product.localizedPrice, product.localizedTitle, product.discounts)
            } else {
                // Fallback on earlier versions
            }
        }
     
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pricingFromIAP"), object: nil, userInfo: reqDict)
    }
    
    
}

extension IAPService: SKPaymentTransactionObserver{
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
    }
    
    
}

extension SKPaymentTransactionState{
    func getStatus()->String{
        switch self {
        case .deferred:
            return "deferred"
        case .failed:
            return "failed"
        case .purchased:
            return "purchased"
        case .purchasing:
            return "purchasing"
        case .restored:
            return "restored"
        default:
            return "nil"
        }
    }
}
