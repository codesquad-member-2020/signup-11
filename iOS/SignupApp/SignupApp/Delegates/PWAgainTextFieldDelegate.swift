//
//  PWAgainTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class PWAgainTextFieldDelegate: PWTextFieldDelegate {
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let pwAgainTextField = textField as? PWAgainTextField {
            if !pwAgainTextField.pwTextField.isCorrect {
                pwAgainTextField.setMessagePrePasswordFirst()
                pwAgainTextField.setBorderColorRed()
                pwAgainTextField.setCorrectTrue()
            } else if !Controller.isSameText(lhs: pwAgainTextField.pwTextField.text, rhs: pwAgainTextField.pwTextField.text) {
                pwAgainTextField.setMessageNotSamePassword()
                pwAgainTextField.setBorderColorRed()
                pwAgainTextField.setCorrectFalse()
            } else {
                pwAgainTextField.setMessageSamePassword()
                pwAgainTextField.setBorderColorGrey()
                pwAgainTextField.setCorrectTrue()
                return true
            }
        }
        return super.textFieldShouldEndEditing(textField)
    }
}
