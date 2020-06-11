//
//  NextButton.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol CompleteButtonDelegate: class {
    func completeButtonBecomeFirstResponder()
    func completeButtonTapped()
}

final class CompleteButton: UIButton {
    weak var delegate: CompleteButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    deinit {
        removeTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        delegate?.completeButtonTapped()
    }
    
    private func setup() {
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        disabled()
    }
    
    func disabled() {
        setGreyButton()
        isEnabled = false
    }
    
    private func setGreyButton() {
        setTitleColor(UIColor.greyColor, for: .disabled)
        tintColor = UIColor.greyColor
    }
    
    func enabled() {
        setGreenButton()
        isEnabled = true
    }
    
    private func setGreenButton() {
        setTitleColor(UIColor.greenColor, for: .normal)
        tintColor = UIColor.greenColor
    }
    
    override func becomeFirstResponder() -> Bool {
        delegate?.completeButtonBecomeFirstResponder()
        return true
    }
}
