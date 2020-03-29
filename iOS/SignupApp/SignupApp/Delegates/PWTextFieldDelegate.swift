//
//  PWTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class PWTextFieldDelegate: SignupTextFieldDelegate {
    override var textLimit: Int {
        return 16
    }
    
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let pwTextField = textField as? PWTextField else { return }
        if !Controller.isTextCorrectLength(min: 8,
                                           max: 16,
                                           count: pwTextField.text?.count) {
            pwTextField.setWrongCaseByUnsuitableTextLength()
        } else if !Controller.hasUpperCaseLetter(pwTextField.text) {
            pwTextField.setWrongCaseByNoUpperCapitalLetter()
        } else if !Controller.hasNumber(pwTextField.text) {
            pwTextField.setWrongCaseByNoNumber()
        } else if !Controller.hasSpecialCharacter(pwTextField.text) {
            pwTextField.setWrongCaseByNoSpecialCharacter()
        } else {
            pwTextField.setCorrectCase()
        }
        super.textFieldDidChangeSelection(textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let pwTextField = textField as? PWTextField else { return false }
        if !Controller.isTextCorrectLength(min: 8,
                                           max: 16,
                                           count: pwTextField.text?.count) {
            pwTextField.setWrongCaseByUnsuitableTextLength()
        } else if !Controller.hasUpperCaseLetter(pwTextField.text) {
            pwTextField.setWrongCaseByNoUpperCapitalLetter()
        } else if !Controller.hasNumber(pwTextField.text) {
            pwTextField.setWrongCaseByNoNumber()
        } else if !Controller.hasSpecialCharacter(pwTextField.text) {
            pwTextField.setWrongCaseByNoSpecialCharacter()
        } else {
            pwTextField.setCorrectCase()
        }
        return super.textFieldShouldEndEditing(textField)
    }
}
