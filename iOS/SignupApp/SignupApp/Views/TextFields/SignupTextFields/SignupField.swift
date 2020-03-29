//
//  CustomTextField.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/25.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SignupField: FormField {
    static let notificationIsCorrectDidChange = Notification.Name("isCorrectDidChange")
    private(set) var isCorrect = false {
        didSet {
            if isCorrect != oldValue {
                NotificationCenter.default.post(name: Self.notificationIsCorrectDidChange,
                                                object: self)
            }
        }
    }
    private let messageLabel = MessageLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMessageLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setMessageLabel()
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
        setWrongMessage(text: messageRequireText)
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
    
    func setWrongMessage(text: String) {
        messageLabel.text = text
        messageLabel.textColor = UIColor.redColor
        messageLabel.isHidden = false
    }
}
