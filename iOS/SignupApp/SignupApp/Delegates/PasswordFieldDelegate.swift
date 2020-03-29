//
//  PWTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PasswordFieldDelegate: SignupFieldDelegate {
    override var textLimit: Int {
        return 16
    }
    
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        judgeCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        judgeCurrentText(of: textField)
        return true
    }
    
    private static let messageCorrectTextLength = "8자 이상 16자 이하로 입력해주세요."
    private static let messageWriteUpperCapitalLetter = "영문 대문자를 최소 1자 이상 포함해주세요. "
    private static let messageWriteNumber = "숫자를 최소 1자 이상 포함해주세요."
    private static let messageWriteSpecialCharacter = "특수문자를 최소 1자 이상 포함해주세요.(!@#$%)"
    private static let messageCorrectPassword = "안전한 비밀번호입니다."
    override func judgeCurrentText(of textField: UITextField) {
        guard let pwTextField = textField as? SignupField else { return }
        if Controller.isNotCorrectLength(min: 8,
                                         max: 16,
                                         count: pwTextField.text?.count) {
            pwTextField.setWrongCase(message: Self.messageCorrectTextLength)
        } else if Controller.hasNoUpperCaseLetter(pwTextField.text) {
            pwTextField.setWrongCase(message: Self.messageWriteUpperCapitalLetter)
        } else if Controller.hasNoNumber(pwTextField.text) {
            pwTextField.setWrongCase(message: Self.messageWriteNumber)
        } else if Controller.hasNoSpecialCharacter(pwTextField.text) {
            pwTextField.setWrongCase(message: Self.messageWriteSpecialCharacter)
        } else {
            pwTextField.setCorrectCase(message: Self.messageCorrectPassword)
        }
        super.judgeCurrentText(of: textField)
    }
}
