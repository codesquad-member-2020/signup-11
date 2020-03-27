//
//  Util.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/26.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class Util {
    static func setCorrectMessage(_ messageLabel: UILabel, text: String) {
        messageLabel.text = text
        messageLabel.textColor = UIColor.greenColor
        messageLabel.isHidden = false
    }
    
    static func setNotCorrectMessage(_ messageLabel: UILabel, text: String) {
        messageLabel.text = text
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
}
