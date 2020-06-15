//
//  CustomTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SignupValidator: NSObject {
    var textLimit : Int {
        return 20
    }
    
    static let messageRequireText = "필수 항목입니다."
    @discardableResult
    func validateCurrentText(of textField: UITextField) -> Bool {
        guard let signupTextField = textField as? SignupField else { return false }
        guard !isTextLengthZero(count: signupTextField.text?.count) else {
            signupTextField.setWrongCase(message: Self.messageRequireText)
            return false
        }
        return true
    }
    
    private func isTextLengthZero(count: Int?) -> Bool {
        guard let count = count else { return false }
        return count == 0
    }
}

extension SignupValidator: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldTextCount = textField.text?.count ?? 0
        let totalLength = textFieldTextCount + string.count - range.length
        return totalLength <= textLimit
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let signupTextField = textField as? FormField {
            signupTextField.nextResonder?.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        validateCurrentText(of: textField)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        validateCurrentText(of: textField)
        return true
    }
}
