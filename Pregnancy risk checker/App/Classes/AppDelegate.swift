//
//  AppDelegate.swift
//  Pregnancy risk checker
//
//  Created by Apple on 05/01/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


func appDelegate() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        getLoggedUser()
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        // Override point for customization after application launch.
        return true
    }

//    // MARK: UISceneSession Lifecycle
//    @available(iOS 13.0, *)
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//     @available(iOS 13.0, *)
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }

    
    func getLoggedUser(){
           let credentials = UserDefaults.standard.value(forKey: "tokenFString") as? Int
           if credentials == 1{
               
               let navigationController: UINavigationController? = (self.window?.rootViewController as? UINavigationController)
               let storyBoard = UIStoryboard.init(name: "Home", bundle: nil)
               let rootVc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
               navigationController?.pushViewController(rootVc, animated: false)
               
           }else if credentials == 0{
               
               let navigationController: UINavigationController? = (self.window?.rootViewController as? UINavigationController)
               let storyBoard = UIStoryboard.init(name: "Auth", bundle: nil)
               let rootVc = storyBoard.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
               navigationController?.pushViewController(rootVc, animated: false)
           }
       }
    
}

