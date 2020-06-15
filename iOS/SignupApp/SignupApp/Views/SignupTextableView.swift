//
//  SignupTextableView.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/06/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol SignupTextableView where Self: UIView {
    var isCorrect: Bool {get set}
    var text: String? {get set}
    
    func setWrongCase(message: String)
    func setCorrectCase(message: String)
}
