//
//  PWAgainTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PWAgainTextField: CustomTextField {
    @IBOutlet weak var pwTextField: PWTextField!
    
    override func setCorrectCase() {
        super.setCorrectCase()
        setMessageSamePassword()
    }
    
    private func setMessageSamePassword() {
        let messageSamePassword = "비밀번호가 일치합니다."
        Util.setCorrectMessage(messageLabel, text: messageSamePassword)
    }
    
    func setWrongCaseByNotSamePassword() {
        setWrongCase()
        setMessageNotSamePassword()
    }
    
    private func setMessageNotSamePassword() {
        let messageNotSamePassword = "비밀번호가 일치하지 않습니다."
        Util.setNotCorrectMessage(messageLabel, text: messageNotSamePassword)
    }
    
    func setWrongCaseByWrongPrePassWord() {
        setWrongCase()
        setMessagePrePasswordFirst()
    }
    
    private func setMessagePrePasswordFirst() {
        let messagePrePasswordFirst = "이전 비밀번호를 먼저 올바르게 입력해주시기 바랍니다."
        Util.setNotCorrectMessage(messageLabel, text: messagePrePasswordFirst)
    }
}
