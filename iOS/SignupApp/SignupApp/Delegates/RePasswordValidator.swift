//
//  PWAgainTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class RePasswordValidator: SignupValidator {
    private func isSameText(lhs: String?, rhs: String?) -> Bool {
        guard let lhs = lhs, let rhs = rhs else { return false }
        return lhs == rhs
    }
}

extension RePasswordValidator {
    private static let messagePrePasswordFirst = "이전 비밀번호를 먼저 올바르게 입력해주시기 바랍니다."
    private static let messageNotSamePassword = "비밀번호가 일치하지 않습니다."
    private static let messageSamePassword = "비밀번호가 일치합니다."
    
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let pwAgainTextField = textField as? RePasswordField else { return }
        
        if !pwAgainTextField.pwTextField.isCorrect{
            pwAgainTextField.setWrongCase(message: Self.messagePrePasswordFirst)
        } else if !isSameText(lhs: pwAgainTextField.pwTextField.text, rhs: pwAgainTextField.text) {
            pwAgainTextField.setWrongCase(message: Self.messageNotSamePassword)
        } else {
            pwAgainTextField.setCorrectCase(message: Self.messageSamePassword)
        }
    
        super.textFieldDidChangeSelection(textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let pwAgainTextField = textField as? RePasswordField else { return false }
        
        if !pwAgainTextField.pwTextField.isCorrect{
            pwAgainTextField.setWrongCase(message: Self.messagePrePasswordFirst)
        } else if !isSameText(lhs: pwAgainTextField.pwTextField.text, rhs: pwAgainTextField.text) {
            pwAgainTextField.setWrongCase(message: Self.messageNotSamePassword)
        } else {
            pwAgainTextField.setCorrectCase(message: Self.messageSamePassword)
        }
        
        return super.textFieldShouldEndEditing(textField)
    }
}
