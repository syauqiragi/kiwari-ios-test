//
//  ChatsVM.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import Foundation
import Firebase

protocol ChatsVMDelegate:class {
    func reciveData(data: ChatsModel)
}
class ChatsVM {
    var ref: DatabaseReference!
    weak var delegate : ChatsVMDelegate?
    init() {
        ref = Database.database().reference()
    }
    
    func getList(){
        let avatar = (UserDefaults.standard.value(forKey: "avatar") as? String ?? "")
        var check = false
        let query = ref.child("c1").queryOrdered(byChild: "datetimesort")
        query.observe(.childAdded) { (DataSnapshot) in
            let value = DataSnapshot.value as? NSDictionary
            if !check {
                if (value?["is_mychat"] as? String ?? "0" == "1") && (value?["avatar"] as? String ?? "" == avatar){
                    check = true
                    let name = value?["myname"] as? String ?? ""
                    let avatar = value?["myavatar"] as? String ?? ""
                    let datetime = value?["datetime"] as? String ?? ""
                    self.delegate?.reciveData(data: ChatsModel(name: name, avatar: avatar, datetime: datetime))
                }else if (value?["is_mychat"] as? String ?? "0" == "0") && (value?["myavatar"] as? String ?? "" == avatar){
                    check = true
                    let name = value?["name"] as? String ?? ""
                    let avatar = value?["avatar"] as? String ?? ""
                    let datetime = value?["datetime"] as? String ?? ""
                    self.delegate?.reciveData(data: ChatsModel(name: name, avatar: avatar, datetime: datetime))
                }
            }
        }
    }
}
