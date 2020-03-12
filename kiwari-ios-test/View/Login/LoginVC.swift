//
//  LoginVC.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 11/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var loginVM = LoginVM()
    override func viewDidLoad() {
        super.viewDidLoad()

        loginBtn.layer.cornerRadius = 8
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        if emailTF.text!.count == 0 || passwordTF.text!.count == 0  {
            showAlert(msg: "Email and Password field can't be empty", vc: self)
        }else{
            if loginVM.checkLogin(email: emailTF.text!, password: passwordTF.text!){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let controller = storyboard.instantiateViewController(withIdentifier :"TabController") as! TabController
                self.navigationController?.pushViewController(controller, animated: true)
            }else{
                showAlert(msg: "Unregistered Email or Password", vc: self)
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}
