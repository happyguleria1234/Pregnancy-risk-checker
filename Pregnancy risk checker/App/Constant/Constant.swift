//
//  Constant.swift
//  racinewalker
//
//  Created by Vivek Dharmani on 7/1/20.
//  Copyright © 2020 Vivek Dharmani. All rights reserved.
//

import Foundation

class Constant: NSObject {
    
    static let shared = Constant()
    let appTitle  = "Pregnancy risk checker"
    let device_token = "1"
    let baseUrl = "https://www.dharmani.com/pregnancyApp/webservices/"
    
    let SignUP = "signUp.php"
    let SignIN = "Login.php"
   
}

class Singleton  {
   static let sharedInstance = Singleton()
    var currentAddress = [String: Any]()
    var lat = Double()
    var long = Double()
    var authToken = String()
    

}
