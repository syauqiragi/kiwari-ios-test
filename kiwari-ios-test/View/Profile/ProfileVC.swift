//
//  ProfileVC.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import UIKit
import SDWebImage
class ProfileVC: UIViewController {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    
    let profileVM = ProfileVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        nameLbl.text = (UserDefaults.standard.value(forKey: "name") as? String ?? "")
        emailLbl.text = (UserDefaults.standard.value(forKey: "email") as? String ?? "")
        
        let avatar = (UserDefaults.standard.value(forKey: "avatar") as? String ?? "")
        userImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        userImg.sd_setImage(with: URL(string: avatar), placeholderImage: UIImage(named: "imgUserDefault"), options: SDWebImageOptions.highPriority)
        
        userImg.layer.cornerRadius = 50
        logoutBtn.layer.cornerRadius = 8
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func clickLogout(_ sender: Any) {
        if profileVM.goLogout() {
            self.navigationController?.popViewController(animated: true)
        }else{
            showAlert(msg: "Logout Failed", vc: self)
        }
    }
    
}
