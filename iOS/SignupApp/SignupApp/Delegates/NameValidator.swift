//
//  NameTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class NameValidator: SignupValidator {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        validateCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateCurrentText(of: textField)
        return true
    }
    
    static let messageShouldNotHaveSpace = "공백이 포함되면 안됩니다."
    static let messageCorrectName = "사용가능한 이름입니다."
    @discardableResult
    override func validateCurrentText(of textField: UITextField) -> Bool {
        guard super.validateCurrentText(of: textField) else { return false }
        
        guard let nameTextField = textField as? SignupField else { return false }
        guard hasNoSpace(nameTextField.text) else {
            nameTextField.setWrongCase(message: Self.messageShouldNotHaveSpace)
            return false 
        }
        
        nameTextField.setCorrectCase(message: Self.messageCorrectName)
        return true
    }
    
    private static let spaceCharacterPattern = "[\\s]"
    private func hasNoSpace(_ text: String?) -> Bool {
        guard let text = text else { return false }
        
        let range = NSRange(location: 0, length: text.count)
        let regex = try! NSRegularExpression(pattern: Self.spaceCharacterPattern)
        return regex.firstMatch(in: text, range: range) == nil
    }
}
