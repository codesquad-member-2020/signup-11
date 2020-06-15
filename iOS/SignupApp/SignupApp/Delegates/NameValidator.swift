//
//  NameTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NameValidator: SignupValidator {
    private static let spaceCharacterPattern = "[\\s]"
    private func hasNoSpace(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: Self.spaceCharacterPattern)
        return regex.firstMatch(in: text, range: range) == nil
    }
}

extension NameValidator {
    static let messageShouldNotHaveSpace = "공백이 포함되면 안됩니다."
    static let messageCorrectName = "사용가능한 이름입니다."
    
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let nameTextField = textField as? SignupField else { return }
        
        if !hasNoSpace(nameTextField.text) {
            nameTextField.setWrongCase(message: Self.messageShouldNotHaveSpace)
        } else {
            nameTextField.setCorrectCase(message: Self.messageCorrectName)
        }
    
        super.textFieldDidChangeSelection(textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let nameTextField = textField as? SignupField else { return false }
        
        if !hasNoSpace(nameTextField.text) {
            nameTextField.setWrongCase(message: Self.messageShouldNotHaveSpace)
        } else {
            nameTextField.setCorrectCase(message: Self.messageCorrectName)
        }
        
        return super.textFieldShouldEndEditing(textField)
    }
}
