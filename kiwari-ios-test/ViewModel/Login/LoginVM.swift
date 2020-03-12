//
//  LoginVM.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 11/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import Foundation

class LoginVM {

    init() {
        print("LoginVM allocated")
    }
    
    deinit {
      print("LoginVM deallocated")
    }
    func checkLogin(email: String, password: String) -> Bool{
        if email == "jarjit@mail.com" && password == "123456"{
            UserDefaults.standard.set("Jarjit Singh", forKey: "name")
            UserDefaults.standard.set("https://api.adorable.io/avatars/160/jarjit@mail.com.png", forKey: "avatar")
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.synchronize()
            return true
        }else if email == "ismail@mail.com" && password == "123456"{
            UserDefaults.standard.set("Ismail bin Mail", forKey: "name")
            UserDefaults.standard.set("https://api.adorable.io/avatars/160/ismail@mail.com.png", forKey: "avatar")
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.synchronize()
            return true
        }else{
            UserDefaults.standard.set("", forKey: "name")
            UserDefaults.standard.set("", forKey: "avatar")
            UserDefaults.standard.set("", forKey: "email")
            UserDefaults.standard.synchronize()
            return false
        }
    }
}
