//
//  PWTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class PWTextFieldDelegate: CustomTextFieldDelegate {
    override var textLimit: Int {
        return 16
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let pwTextField = textField as? PWTextField {
            if !Controller.isTextCorrectLength(min: 8,
                                               max: 16,
                                               count: textField.text?.count) {
                pwTextField.setMessageCorrectTextLength()
                pwTextField.setBorderColorRed()
                pwTextField.setCorrectFalse()
            } else if !Controller.hasUpperCaseLetter(textField.text) {
                pwTextField.setMessageWriteUpperCapitalLetter()
                pwTextField.setBorderColorRed()
                pwTextField.setCorrectFalse()
            } else if !Controller.hasNumber(textField.text) {
                pwTextField.setMessageWriteNumber()
                pwTextField.setBorderColorRed()
                pwTextField.setCorrectFalse()
            } else if !Controller.hasSpecialCharacter(textField.text) {
                pwTextField.setMessageWriteSpecialCharacter()
                pwTextField.setBorderColorRed()
                pwTextField.setCorrectFalse()
            } else {
                pwTextField.setMessageCorrectPassword()
                pwTextField.setBorderColorGrey()
                pwTextField.setCorrectTrue()
                return true
            }
        }
        return super.textFieldShouldEndEditing(textField)
    }
}
