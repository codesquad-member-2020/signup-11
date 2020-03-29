//
//  IDTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class IDFieldDelegate: SignupFieldDelegate {
    override func textFieldDidChangeSelection(_ textField: UITextField) {
        judgeCurrentText(of: textField)
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        judgeCurrentText(of: textField)
        return true
    }
    
    private static let messageNotCorrectID = "5~20자의 영문 소문자, 숫자와 특수기호(_)(-)만 사용 가능합니다."
    private static let messageOverlappedID = "이미 사용중인 아이디입니다."
    private static let messageCorrectID = "사용 가능한 아이디입니다."
    override func judgeCurrentText(of textField: UITextField) {
        guard let idTextField = textField as? SignupField else { return }
        if Controller.isNotCorrectID(idTextField.text) {
            idTextField.setWrongCase(message: Self.messageNotCorrectID)
        } else {
            Controller.isOverlappedID(idTextField.text) { (result) in
                guard let result = result else { return }
                DispatchQueue.main.async {
                    if result {
                        idTextField.setWrongCase(message: Self.messageOverlappedID)
                    } else {
                        idTextField.setCorrectCase(message: Self.messageCorrectID)
                    }
                }
            }
        }
        super.judgeCurrentText(of: textField)
    }
}
