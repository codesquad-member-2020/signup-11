//
//  IDTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDTextField: CustomTextField {
    func setMessageCorrectID() {
        let messageCorrectID = "사용 가능한 아이디입니다."
        messageLabel.text = messageCorrectID
        messageLabel.textColor = UIColor.greenColor
        messageLabel.isHidden = false
    }
    
    func setMessageNotCorrectID() {
        let messageNotCorrectID = "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다."
        messageLabel.text = messageNotCorrectID
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
}
