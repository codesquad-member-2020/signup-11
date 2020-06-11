//
//  CustomTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SignupValidator: NSObject, UITextFieldDelegate {
    var textLimit : Int {
        return 20
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldTextCount = textField.text?.count ?? 0
        let totalLength = textFieldTextCount + string.count - range.length
        return totalLength <= textLimit
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let signupTextField = textField as? SignupField {
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
    
    static let messageRequireText = "필수 항목입니다."
    func validateCurrentText(of textField: UITextField) {
        guard let signupTextField = textField as? SignupField else { return }
        guard isNotZeroLength(count: signupTextField.text?.count)
            else { signupTextField.setWrongCase(message: Self.messageRequireText); return }
        
        signupTextField.clearMessage()
    }
    
    private func isNotZeroLength(count: Int?) -> Bool {
        guard let count = count else { return false }
        return count != 0
    }
}
