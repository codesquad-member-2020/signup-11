//
//  CustomTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SignupTextFieldDelegate: NSObject, UITextFieldDelegate {
    var textLimit : Int {
        return 20
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldTextCount = textField.text?.count ?? 0
        let totalLength = textFieldTextCount + string.count - range.length
        return totalLength <= textLimit
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let signupTextField = textField as? SignupTextField {
            signupTextField.nextResonder?.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let signupTextField = textField as? SignupTextField else { return }
        if Controller.isTextLengthZero(count: signupTextField.text?.count) {
            signupTextField.setWrongCaseByNoText()
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let signupTextField = textField as? SignupTextField {
            if Controller.isTextLengthZero(count: signupTextField.text?.count) {
                signupTextField.setWrongCaseByNoText()
            }
        }
        return true
    }
}
