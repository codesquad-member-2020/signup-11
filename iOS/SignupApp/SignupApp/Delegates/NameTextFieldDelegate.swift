//
//  NameTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NameTextFieldDelegate: SignupTextFieldDelegate {
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let nameTextField = textField as? NameTextField {
            if !Controller.isNoHaveSpace(nameTextField.text) {
                nameTextField.setWrongCaseByNotHaveSpace()
            } else {
                nameTextField.setCorrectCase()
            }
        }
        return super.textFieldShouldEndEditing(textField)
    }
}
