//
//  AppDelegate.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 11/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        
        if checkLogin() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier :"TabController") as! TabController
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.navigationBar.isTranslucent = false
            navigationController.isNavigationBarHidden = true
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier :"LoginVC") as! LoginVC
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.navigationBar.isTranslucent = false
            navigationController.isNavigationBarHidden = true
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
        
        
        return true
    }
    
    
}

