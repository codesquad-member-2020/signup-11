//
//  PasswordTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PWTextField: CustomTextField {
    func setMessageCorrectTextLength() {
        let messageCorrectTextLength = "8자 이상 16자 이하로 입력해주세요."
        messageLabel.text = messageCorrectTextLength
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
    
    func setMessageWriteUpperCapitalLetter() {
        let messageWriteUpperCapitalLetter = "영문 대문자를 최소 1자 이상 포함해주세요. "
        messageLabel.text = messageWriteUpperCapitalLetter
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
    
    func setMessageWriteNumber() {
        let messageWriteNumber = "숫자를 최소 1자 이상 포함해주세요."
        messageLabel.text = messageWriteNumber
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
    
    func setMessageWriteSpecialCharacter() {
        let messageWriteSpecialCharacter = "특수문자를 최소 1자 이상 포함해주세요.(!@#$%)"
        messageLabel.text = messageWriteSpecialCharacter
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
    
    func setMessageCorrectPassword() {
        let messageCorrectPassword = "안전한 비밀번호입니다."
        messageLabel.text = messageCorrectPassword
        messageLabel.textColor = UIColor.greenColor
        messageLabel.isHidden = false
    }
}
