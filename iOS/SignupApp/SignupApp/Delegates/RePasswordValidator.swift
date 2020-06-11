//
//  PWAgainTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class RePasswordValidator: SignupValidator {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        validateCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateCurrentText(of: textField)
        return true
    }
    
    private static let messagePrePasswordFirst = "이전 비밀번호를 먼저 올바르게 입력해주시기 바랍니다."
    private static let messageNotSamePassword = "비밀번호가 일치하지 않습니다."
    private static let messageSamePassword = "비밀번호가 일치합니다."
    override func validateCurrentText(of textField: UITextField) {
        super.validateCurrentText(of: textField)
        guard let pwAgainTextField = textField as? RePasswordField,
            !pwAgainTextField.isEqual(message: SignupValidator.messageRequireText) else { return }
        
        guard pwAgainTextField.pwTextField.isCorrect
            else { pwAgainTextField.setWrongCase(message: Self.messagePrePasswordFirst); return }
        guard isSameText(lhs: pwAgainTextField.pwTextField.text, rhs: pwAgainTextField.text)
            else { pwAgainTextField.setWrongCase(message: Self.messageNotSamePassword); return }
        
        pwAgainTextField.setCorrectCase(message: Self.messageSamePassword)
    }
    
    private func isSameText(lhs: String?, rhs: String?) -> Bool {
        guard let lhs = lhs, let rhs = rhs else { return false }
        return lhs == rhs
    }
}
