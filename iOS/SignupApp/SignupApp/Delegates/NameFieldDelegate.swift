//
//  NameTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NameFieldDelegate: SignupFieldDelegate {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        judgeCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        judgeCurrentText(of: textField)
        return true
    }
    
    override func judgeCurrentText(of textField: UITextField) {
        guard let nameTextField = textField as? NameField else { return }
        if Controller.hasSpace(nameTextField.text) {
            nameTextField.setWrongCaseByHasSpace()
        } else {
            nameTextField.setCorrectCase()
        }
        super.judgeCurrentText(of: textField)
    }
}
