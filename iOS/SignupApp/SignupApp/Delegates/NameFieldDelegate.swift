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
    
    static let messageShouldNotHaveSpace = "공백이 포함되면 안됩니다."
    static let messageCorrectName = "사용가능한 이름입니다."
    override func judgeCurrentText(of textField: UITextField) {
        guard let nameTextField = textField as? SignupField else { return }
        if Controller.hasSpace(nameTextField.text) {
            nameTextField.setWrongCase(message: Self.messageShouldNotHaveSpace)
        } else {
            nameTextField.setCorrectCase(message: Self.messageCorrectName)
        }
        super.judgeCurrentText(of: textField)
    }
}
