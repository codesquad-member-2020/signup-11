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
        
        configureDelegate()
        makeDisabled()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureDelegate()
        makeDisabled()
    }
    
    deinit {
        removeTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        delegate?.completeButtonTapped()
    }
    
    private func configureDelegate() {
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func makeDisabled() {
        configureGreyButton()
        isEnabled = false
    }
    
    private func configureGreyButton() {
        setTitleColor(UIColor.greyColor, for: .disabled)
        tintColor = UIColor.greyColor
    }
    
    func makeEnabled() {
        configureGreenButton()
        isEnabled = true
    }
    
    private func configureGreenButton() {
        setTitleColor(UIColor.greenColor, for: .normal)
        tintColor = UIColor.greenColor
    }
    
    override func becomeFirstResponder() -> Bool {
        delegate?.completeButtonBecomeFirstResponder()
        return true
    }
}
