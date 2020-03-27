//
//  IDTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDTextField: CustomTextField {
    
    override func setCorrectCase() {
        super.setCorrectCase()
        setMessageCorrectID()
    }
    
    private func setMessageCorrectID() {
        let messageCorrectID = "사용 가능한 아이디입니다."
        setCorrectMessage(text: messageCorrectID)
    }
    
    func setWrongCaseByWrongID() {
        setWrongCase()
        setMessageNotCorrectID()
    }
    
    private func setMessageNotCorrectID() {
        let messageNotCorrectID = "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다."
        setNotCorrectMessage(text: messageNotCorrectID)
    }
    
    func setWrongCaseByOverlappedID() {
        setWrongCase()
        setMessageOverlappedID()
    }
    
    private func setMessageOverlappedID() {
        let messageNotCorrectID = "이미 사용중인 아이디입니다."
        setNotCorrectMessage(text: messageNotCorrectID)
    }
}
