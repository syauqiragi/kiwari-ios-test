//
//  Helper.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import Foundation
import UIKit
func checkLogin() -> Bool {
    if (UserDefaults.standard.value(forKey: "email") as? String ?? "" != ""){
        return true
    }else{
        return false
    }
}

func showAlert(msg: String, vc: UIViewController) {
    let alert = UIAlertController(title: "Message", message:msg, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}
