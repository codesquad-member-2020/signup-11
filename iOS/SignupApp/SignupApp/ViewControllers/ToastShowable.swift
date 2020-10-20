//
//  ToastShowable.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/07/18.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol ToastShowable: UIViewController {
    var toastLabel: ToastLabel! {get set}
    
    func show(message: String)
    func showToast(by result: Bool)
}

extension ToastShowable {
    func show(message: String) {
        toastLabel.text = message
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut,
                       animations: {
                        self.toastLabel.alpha = 0.0 },
                       completion: { (isCompleted) in
                        self.toastLabel.removeFromSuperview() })
    }
}
