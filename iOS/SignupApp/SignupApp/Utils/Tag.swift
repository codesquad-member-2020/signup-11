//
//  Tag.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/26.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class Tag {
    static func nextTagBecomeFirstResponder(view: UIView) {
        let nextTag = view.tag + 1
        guard let nextResponder = view.superview?.viewWithTag(nextTag) else { return }
        nextResponder.becomeFirstResponder()
    }
}
