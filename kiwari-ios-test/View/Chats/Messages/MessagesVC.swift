//
//  MessagesVC.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import UIKit
import GrowingTextView
import SDWebImage

class MessagesVC: UIViewController {
    
    var titlePage: String? = ""
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageTV: GrowingTextView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var tableList: UITableView!
    
    let msgVM = MessagesVM()
    var data = [MessageModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [MessageModel]()
        msgVM.delegate = self
        setupView()
        msgVM.getAllMessage()
    }
    
    func setupView() {
        userLabel.text = titlePage
        
        tableList.delegate = self
        tableList.dataSource = self
        tableList.backgroundView = UIImageView(image: UIImage(named: "bgChat"))
        tableList.separatorStyle = .none
        tableList.separatorStyle = .none
        tableList.rowHeight = UITableView.automaticDimension
        tableList.estimatedRowHeight = 100
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSend(_ sender: Any) {
        if self.data.count > 0 {
            if messageTV.text.count > 0 {
                let dataChat = self.data[0]
                msgVM.sendMessage(data : dataChat, message: messageTV.text)
                messageTV.text = ""
            }else{
                showAlert(msg: "Your message can't be empty", vc: self)
            }
        }else{
            showAlert(msg: "Loading Data", vc: self)
        }
        
    }
}

extension MessagesVC : MessagesVMDelegate {
    func reciveData(data: MessageModel) {
        self.data.append(data)
        self.tableList.reloadData()
        let indexPath = IndexPath(row: self.data.count-1, section: 0)
        self.tableList.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}

extension MessagesVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.data.count > 0 {
            let dataChat = self.data[indexPath.row]
            let avatar = (UserDefaults.standard.value(forKey: "avatar") as? String ?? "")
            if dataChat.isMychat == "1" && dataChat.myavatar == avatar {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyChatTC", for: indexPath) as! MyChatTC
                
                cell.userLbl.text = dataChat.myname
                cell.msgLbl.text = dataChat.message
                cell.timeLbl.text = dataChat.datetime
                cell.userImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
                cell.userImg.sd_setImage(with: URL(string: dataChat.myavatar ?? ""), placeholderImage: UIImage(named: "imgUserDefault"), options: SDWebImageOptions.highPriority)
                
                cell.selectionStyle = .none
                return cell
            }else if dataChat.isMychat == "1" && dataChat.avatar == avatar {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TheyChatTC", for: indexPath) as! TheyChatTC
                
                cell.userLbl.text = dataChat.myname
                cell.msgLbl.text = dataChat.message
                cell.timeLbl.text = dataChat.datetime
                cell.userImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
                cell.userImg.sd_setImage(with: URL(string: dataChat.myavatar ?? ""), placeholderImage: UIImage(named: "imgUserDefault"), options: SDWebImageOptions.highPriority)
                
                cell.selectionStyle = .none
                return cell
            }else if dataChat.isMychat == "0" && dataChat.myavatar == avatar {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TheyChatTC", for: indexPath) as! TheyChatTC
                
                cell.userLbl.text = dataChat.name
                cell.msgLbl.text = dataChat.message
                cell.timeLbl.text = dataChat.datetime
                cell.userImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
                cell.userImg.sd_setImage(with: URL(string: dataChat.avatar ?? ""), placeholderImage: UIImage(named: "imgUserDefault"), options: SDWebImageOptions.highPriority)
                
                cell.selectionStyle = .none
                return cell
            }else if dataChat.isMychat == "0" && dataChat.avatar == avatar {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyChatTC", for: indexPath) as! MyChatTC
                
                cell.userLbl.text = dataChat.name
                cell.msgLbl.text = dataChat.message
                cell.timeLbl.text = dataChat.datetime
                cell.userImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
                cell.userImg.sd_setImage(with: URL(string: dataChat.avatar ?? ""), placeholderImage: UIImage(named: "imgUserDefault"), options: SDWebImageOptions.highPriority)
                
                cell.selectionStyle = .none
                return cell
            }else{
                return UITableViewCell()
            }
        }else{
            return UITableViewCell()
        }
    }
    
}
