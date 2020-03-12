//
//  MyChatTC.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import UIKit

class MyChatTC: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setupView() {
        userImg.layer.cornerRadius = 15
        
        userLbl.textColor = .white
        timeLbl.textColor = .white
        msgLbl.textColor = .white
        
        bgView.backgroundColor = UIColor.init(red: 237/255, green: 63/255, blue: 71/255, alpha: 1)
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOpacity = 0.16
        bgView.layer.shadowOffset = .zero
        bgView.layer.shadowRadius = 4
        bgView.layer.cornerRadius = 8
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
