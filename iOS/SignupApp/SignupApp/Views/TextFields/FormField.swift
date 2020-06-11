//
//  FormTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/28.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class FormField: UITextField {
    var nextResonder: UIResponder?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setBorder()
    }
    
    private func setBorder() {
        layer.borderWidth = 0.9
        layer.borderColor = UIColor.greyColor.cgColor
    }
    
    private static let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: FormField.padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: FormField.padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: FormField.padding)
    }
}
