//
//  IDTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDTextFieldDelegate: SignupTextFieldDelegate {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        judgeCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        judgeCurrentText(of: textField)
        return true
    }
    
    override func judgeCurrentText(of textField: UITextField) {
        guard let idTextField = textField as? IDTextField else { return }
        if Controller.isNotCorrectID(idTextField.text) {
            idTextField.setWrongCaseByWrongID()
        } else {
            Controller.isOverlappedID(idTextField.text) { (result) in
                guard let result = result else { return }
                DispatchQueue.main.async {
                    result ? idTextField.setWrongCaseByOverlappedID() : idTextField.setCorrectCase()
                }
            }
        }
        super.judgeCurrentText(of: textField)
    }
}
