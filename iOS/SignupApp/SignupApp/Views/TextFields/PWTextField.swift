//
//  PasswordTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PWTextField: CustomTextField {
    
    func setWrongCaseByUnsuitableTextLength() {
        setWrongCase()
        setMessageCorrectTextLength()
    }
    
    private func setMessageCorrectTextLength() {
        let messageCorrectTextLength = "8자 이상 16자 이하로 입력해주세요."
        Util.setNotCorrectMessage(messageLabel, text: messageCorrectTextLength)
    }
    
    func setWrongCaseByNoUpperCapitalLetter() {
        setWrongCase()
        setMessageWriteUpperCapitalLetter()
    }
    
    private func setMessageWriteUpperCapitalLetter() {
        let messageWriteUpperCapitalLetter = "영문 대문자를 최소 1자 이상 포함해주세요. "
        Util.setNotCorrectMessage(messageLabel, text: messageWriteUpperCapitalLetter)
    }
    
    func setWrongCaseByNoNumber() {
        setWrongCase()
        setMessageWriteNumber()
    }
    
    private func setMessageWriteNumber() {
        let messageWriteNumber = "숫자를 최소 1자 이상 포함해주세요."
        Util.setNotCorrectMessage(messageLabel, text: messageWriteNumber)
    }
    
    func setWrongCaseByNoSpecialCharacter() {
        setWrongCase()
        setMessageWriteSpecialCharacter()
    }
    
    private func setMessageWriteSpecialCharacter() {
        let messageWriteSpecialCharacter = "특수문자를 최소 1자 이상 포함해주세요.(!@#$%)"
        Util.setNotCorrectMessage(messageLabel, text: messageWriteSpecialCharacter)
    }
    
    override func setCorrectCase() {
        super.setCorrectCase()
        setMessageCorrectPassword()
    }
    
    private func setMessageCorrectPassword() {
        let messageCorrectPassword = "안전한 비밀번호입니다."
        Util.setCorrectMessage(messageLabel, text: messageCorrectPassword)
    }
}
