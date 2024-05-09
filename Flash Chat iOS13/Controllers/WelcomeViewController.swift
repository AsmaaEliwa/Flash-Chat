//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = Constants.appName// much easier by using CLTypingLabel library
//        titleLabel.text = ""
//        let welcomText = "⚡️FlashChat"
//        var idx = 0.0
//        for letter in welcomText{
//            Timer.scheduledTimer(withTimeInterval: 0.1 * idx, repeats: false) { Timer in
//                self.titleLabel.text?.append(letter)
//            
//            }
//            idx+=1
//        }
       
    }
    

}
