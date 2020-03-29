//
//  NameTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NameTextFieldDelegate: SignupTextFieldDelegate {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let nameTextField = textField as? NameTextField else { return }
        if !Controller.isNoHaveSpace(nameTextField.text) {
            nameTextField.setWrongCaseByNotHaveSpace()
        } else {
            nameTextField.setCorrectCase()
        }
        return super.textFieldDidChangeSelection(textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let nameTextField = textField as? NameTextField else { return false }
        if !Controller.isNoHaveSpace(nameTextField.text) {
            nameTextField.setWrongCaseByNotHaveSpace()
        } else {
            nameTextField.setCorrectCase()
        }
        return super.textFieldShouldEndEditing(textField)
    }
}
