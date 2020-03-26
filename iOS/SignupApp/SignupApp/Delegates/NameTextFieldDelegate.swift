//
//  NameTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NameTextFieldDelegate: CustomTextFieldDelegate {
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let nameTextField = textField as? NameTextField {
            if Controller.isTextLengthZero(count: nameTextField.text?.count) {
                nameTextField.setMessageRequireText()
                nameTextField.setBorderColorRed()
                nameTextField.setCorrectFalse()
            } else {
                nameTextField.setMessageCorrectName()
                nameTextField.setBorderColorGrey()
                nameTextField.setCorrectTrue()
                return true
            }
        }
        return true
    }
}
