//
//  IDTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDTextFieldDelegate: CustomTextFieldDelegate {
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let idTextField = textField as? IDTextField {
            if Controller.isCorrectID(textField.text) {
                idTextField.setMessageCorrectID()
                idTextField.setCorrectTrue()
                return true
            } else {
                idTextField.setMessageNotCorrectID()
                idTextField.setCorrectFalse()
            }
        }
        return super.textFieldShouldEndEditing(textField)
    }
}
