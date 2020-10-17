//
//  ToastLabel.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/07/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class ToastLabel: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureView()
    }
    
    private func configureView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        textColor = UIColor.white
        textAlignment = .center;
        font = UIFont(name: "Montserrat-Light", size: 12.0)
        alpha = 1.0
        layer.cornerRadius = 10;
        clipsToBounds  =  true
    }
}
