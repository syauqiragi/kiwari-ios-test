//
//  ProfileVM.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import Foundation

class ProfileVM {

    init() {
        print("ProfileVM allocated")
    }
    
    deinit {
      print("ProfileVM deallocated")
    }
    
    func goLogout() -> Bool{
        UserDefaults.standard.set("", forKey: "name")
        UserDefaults.standard.set("", forKey: "avatar")
        UserDefaults.standard.set("", forKey: "email")
        UserDefaults.standard.synchronize()
        return true
    }
}
