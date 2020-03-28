//
//  IDTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDTextFieldDelegate: SignupTextFieldDelegate {
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let idTextField = textField as? IDTextField {
            if !Controller.isCorrectID(idTextField.text) {
                idTextField.setWrongCaseByWrongID()
            } else {
                Controller.isOverlappedID(idTextField.text) { (result) in
                    guard let result = result else { return }
                    DispatchQueue.main.async {
                        result ? idTextField.setWrongCaseByOverlappedID() : idTextField.setCorrectCase()
                    }
                }
                return true
            }
        }
        return super.textFieldShouldEndEditing(textField)
    }
}
