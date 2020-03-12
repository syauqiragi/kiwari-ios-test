//
//  ChatRoomTC.swift
//  kiwari-ios-test
//
//  Created by Ahmad Syauqi Albana on 12/03/20.
//  Copyright © 2020 Ahmad Syauqi Albana. All rights reserved.
//

import UIKit

class ChatRoomTC: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setupView() {
        userImg.layer.cornerRadius = 25
        
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
