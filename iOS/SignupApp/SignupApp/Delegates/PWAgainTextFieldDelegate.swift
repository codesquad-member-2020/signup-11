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
            if pwAgainTextField.pwTextField.isCorrect,
               Controller.isSameText(lhs: pwAgainTextField.pwTextField.text, rhs: pwAgainTextField.pwTextField.text) {
                pwAgainTextField.setMessageSamePassword()
                pwAgainTextField.setCorrectTrue()
                return true
            } else {
                pwAgainTextField.setMessageNotSamePassword()
                pwAgainTextField.setCorrectFalse()
            }
        }
        return super.textFieldShouldEndEditing(textField)
    }
}
