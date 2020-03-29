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
    
    override func judgeCurrentText(of textField: UITextField) {
        guard let pwTextField = textField as? PasswordField else { return }
        if Controller.isNotCorrectLength(min: 8,
                                           max: 16,
                                           count: pwTextField.text?.count) {
            pwTextField.setWrongCaseByUnsuitableTextLength()
        } else if Controller.hasNoUpperCaseLetter(pwTextField.text) {
            pwTextField.setWrongCaseByNoUpperCapitalLetter()
        } else if Controller.hasNoNumber(pwTextField.text) {
            pwTextField.setWrongCaseByNoNumber()
        } else if Controller.hasNoSpecialCharacter(pwTextField.text) {
            pwTextField.setWrongCaseByNoSpecialCharacter()
        } else {
            pwTextField.setCorrectCase()
        }
        super.judgeCurrentText(of: textField)
    }
}