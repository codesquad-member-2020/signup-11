//
//  PWAgainTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class RePasswordFieldDelegate: SignupFieldDelegate {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        judgeCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        judgeCurrentText(of: textField)
        return true
    }
    
    private static let messagePrePasswordFirst = "이전 비밀번호를 먼저 올바르게 입력해주시기 바랍니다."
    private static let messageNotSamePassword = "비밀번호가 일치하지 않습니다."
    private static let messageSamePassword = "비밀번호가 일치합니다."
    override func judgeCurrentText(of textField: UITextField) {
        guard let pwAgainTextField = textField as? RePasswordField else { return }
        if !pwAgainTextField.pwTextField.isCorrect {
            pwAgainTextField.setWrongCase(message: Self.messagePrePasswordFirst)
        } else if Controller.isNotSameText(lhs: pwAgainTextField.pwTextField.text,
                                           rhs: pwAgainTextField.text) {
            pwAgainTextField.setWrongCase(message: Self.messageNotSamePassword)
        } else {
            pwAgainTextField.setCorrectCase(message: Self.messageSamePassword)
        }
        super.judgeCurrentText(of: textField)
    }
}
