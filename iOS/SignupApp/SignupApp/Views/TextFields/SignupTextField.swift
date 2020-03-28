//
//  CustomTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

extension SignupTextField {
    private static let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: SignupTextField.padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: SignupTextField.padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: SignupTextField.padding)
    }
}

class SignupTextField: UITextField {
    private(set) var isCorrect = false
    private let messageLabel = MessageLabel()
    
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
        setMessageLabel()
    }
    
    private func setBorder() {
        layer.borderWidth = 0.9
        layer.borderColor = UIColor.greyColor.cgColor
    }
    
    private func setMessageLabel() {
        addSubview(messageLabel)
        messageLabel.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 2).isActive = true
    }
    
    func setWrongCaseByNoText() {
        setMessageRequireText()
        setWrongCase()
    }
    
    private func setMessageRequireText() {
        let messageRequireText = "필수 항목입니다."
        setNotCorrectMessage(text: messageRequireText)
    }
    
    func setCorrectCase() {
        setBorderColorGrey()
        setCorrectTrue()
    }
    
    func setWrongCase() {
        setBorderColorRed()
        setCorrectFalse()
    }
    
    private func setCorrectTrue() {
        isCorrect = true
    }
    
    private func setCorrectFalse() {
        isCorrect = false
    }
    
    private func setBorderColorGrey() {
        layer.borderColor = UIColor.greyColor.cgColor
    }
    
    private func setBorderColorRed() {
        layer.borderColor = UIColor.redColor.cgColor
    }
    
// MARK:- Methods related to MessageLabel
    
    func setCorrectMessage(text: String) {
        messageLabel.text = text
        messageLabel.textColor = UIColor.greenColor
        messageLabel.isHidden = false
    }
    
    func setNotCorrectMessage(text: String) {
        messageLabel.text = text
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
}
