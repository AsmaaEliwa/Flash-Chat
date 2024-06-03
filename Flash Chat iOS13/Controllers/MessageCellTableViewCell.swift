//
//  MessageCellTableViewCell.swift
//  Flash Chat iOS13
//
//  Created by asmaa gamal  on 09/05/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class MessageCellTableViewCell: UITableViewCell {
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var reciverImage: UIImageView!
    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var popupView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        popupView.layer.cornerRadius = popupView.frame.size.height / 5
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    override func layoutSubviews() {
//          super.layoutSubviews()
//          popupView.layer.cornerRadius = popupView.frame.size.height / 5
//      }

    
}
