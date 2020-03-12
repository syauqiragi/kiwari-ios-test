//
//  ChatsVC.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import UIKit
import SDWebImage
class ChatsVC: UIViewController {

    @IBOutlet weak var tableList: UITableView!
    
    let chatVM = ChatsVM()
    var data = [ChatsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [ChatsModel]()
        chatVM.delegate = self
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        data = [ChatsModel]()
        chatVM.getList()
    }
    
    func setupView() {
        tableList.delegate = self
        tableList.dataSource = self
        tableList.backgroundView = UIImageView(image: UIImage(named: "bgChat"))
        tableList.separatorStyle = .none
        tableList.rowHeight = UITableView.automaticDimension
        tableList.estimatedRowHeight = 100
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}

extension ChatsVC : ChatsVMDelegate {
    func reciveData(data: ChatsModel) {
        self.data.append(data)
        self.tableList.reloadData()
    }
}

extension ChatsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatRoomTC", for: indexPath) as! ChatRoomTC
        let dataChat = self.data[indexPath.row]
        cell.userLbl.text = dataChat.name
        cell.timeLbl.text = dataChat.datetime
        
        cell.userImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.userImg.sd_setImage(with: URL(string: dataChat.avatar), placeholderImage: UIImage(named: "imgUserDefault"), options: SDWebImageOptions.highPriority)

        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataChat = self.data[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier : "MessagesVC") as! MessagesVC
        controller.titlePage = dataChat.name
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
