//
//  MessagesVM.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import Foundation
import Firebase

protocol MessagesVMDelegate:class {
    func reciveData(data: MessageModel)
}
class MessagesVM {
    var ref: DatabaseReference!
    weak var delegate : MessagesVMDelegate?
    init() {
        ref = Database.database().reference()
    }
    
    func getAllMessage(){
        let query = ref.child("c1").queryOrdered(byChild: "datetimesort")
        query.observe(.childAdded) { (DataSnapshot) in
            let value = DataSnapshot.value as? NSDictionary
            
            let name = value?["name"] as? String ?? ""
            let avatar = value?["avatar"] as? String ?? ""
            
            let myname = value?["myname"] as? String ?? ""
            let myavatar = value?["myavatar"] as? String ?? ""
            
            let datetime = value?["datetime"] as? String ?? ""
            let datetimesort = value?["datetimesort"] as? String ?? ""
            let isMychat = value?["is_mychat"] as? String ?? ""
            let message = value?["message"] as? String ?? ""
            self.delegate?.reciveData(data: MessageModel(avatar: avatar, datetime: datetime, datetimesort: datetimesort, isMychat: isMychat, message: message, myavatar: myavatar, myname: myname, name: name))
        }
    }
    
    func sendMessage(data : MessageModel, message: String) {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        
        let dateFormatter2 : DateFormatter = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date2 = Date()
        let dateString2 = dateFormatter2.string(from: date2)
        

        let avatar = (UserDefaults.standard.value(forKey: "avatar") as? String ?? "")
        if data.isMychat == "1" && data.myavatar == avatar {
            self.ref.child("c1").child(dateString).setValue([
                "name" : data.name,
                "avatar" : data.avatar,
                "myname" : data.myname,
                "myavatar" : data.myavatar,
                "message" : message,
                "datetime" : dateString2,
                "datetimesort" : dateString,
                "is_mychat" : "1"
            ])
        }else if data.isMychat == "1" && data.avatar == avatar {
            self.ref.child("c1").child(dateString).setValue([
                "myname" : data.name,
                "myavatar" : data.avatar,
                "name" : data.myname,
                "avatar" : data.myavatar,
                "message" : message,
                "datetime" : dateString2,
                "datetimesort" : dateString,
                "is_mychat" : "1"
            ])
        }else if data.isMychat == "0" && data.myavatar == avatar {
            self.ref.child("c1").child(dateString).setValue([
                "myname" : data.name,
                "myavatar" : data.avatar,
                "name" : data.myname,
                "avatar" : data.myavatar,
                "message" : message,
                "datetime" : dateString2,
                "datetimesort" : dateString,
                "is_mychat" : "0"
            ])
        }else if data.isMychat == "0" && data.avatar == avatar {
            self.ref.child("c1").child(dateString).setValue([
                "name" : data.name,
                "avatar" : data.avatar,
                "myname" : data.myname,
                "myavatar" : data.myavatar,
                "message" : message,
                "datetime" : dateString2,
                "datetimesort" : dateString,
                "is_mychat" : "0"
            ])
        }
    }
}
