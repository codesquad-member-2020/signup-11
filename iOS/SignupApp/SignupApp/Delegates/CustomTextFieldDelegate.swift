//
//  CustomTextFieldDelegate.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class CustomTextFieldDelegate: NSObject, UITextFieldDelegate {
    var textLimit : Int {
        return 20
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldTextCount = textField.text?.count ?? 0
        let totalLength = textFieldTextCount + string.count - range.length
        return totalLength <= textLimit
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Tag.nextTagBecomeFirstResponder(view: textField)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let textField = textField as? CustomTextField {
            if Controller.isTextLengthZero(count: textField.text?.count) {
                textField.setMessageRequireText()
            }
        }
        return true
    }
}
