//
//  PWAgainTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PWAgainTextFieldDelegate: SignupTextFieldDelegate {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        judgeCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        judgeCurrentText(of: textField)
        return true
    }
    
    override func judgeCurrentText(of textField: UITextField) {
        guard let pwAgainTextField = textField as? PWAgainTextField else { return }
        if !pwAgainTextField.pwTextField.isCorrect {
            pwAgainTextField.setWrongCaseByWrongPrePassWord()
        } else if !Controller.isSameText(lhs: pwAgainTextField.pwTextField.text,
                                         rhs: pwAgainTextField.text) {
            pwAgainTextField.setWrongCaseByNotSamePassword()
        } else {
            pwAgainTextField.setCorrectCase()
        }
        super.judgeCurrentText(of: textField)
    }
}
