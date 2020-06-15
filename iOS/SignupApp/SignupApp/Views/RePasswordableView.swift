//
//  RePasswordView.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/06/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol RePasswordableView: SignupTextableView {
    var passwordTextableView: SignupTextableView? {get set}
}
