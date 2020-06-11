//
//  LoginViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: FormField!
    @IBOutlet weak var pwTextField: FormField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTouched(_ sender: UIButton) {
        isLogin { result in
            guard let result = result else { return }
            DispatchQueue.main.async {
                result ? self.showToast(message: "로그인 성공!") : self.showToast(message: "로그인 실패!")
            }
        }
    }
    
    private func isLogin(resultHandler: @escaping (Bool?) -> ()) {
        let login = Login(userId: idTextField.text!,
                          password: pwTextField.text!)
        guard let jsonData = DataCoder.encodeJSONData(login) else { return }
        NetworkManager.excuteURLSession(method: .post,
                                 from: SignupURL.urlStringLoginInfo,
                                 data: jsonData) { data in
                                    guard let data = data else { return }
                                    guard let loginResponse = DataCoder.decodeJSONData(type: Response.self,
                                                                                       data: data,
                                                                                       dateDecodingStrategy: nil) else { return }
                                    resultHandler(loginResponse.success)
                                    
        }
    }
    
    private func showToast(message : String) {
        let toastLabel = ToastLabel(frame: CGRect(x: 10,
                                                  y: self.view.frame.size.height-100,
                                                  width: view.frame.size.width - 2 * 10,
                                                  height: 35))
        toastLabel.text = message
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

private class ToastLabel: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        textColor = UIColor.white
        textAlignment = .center;
        font = UIFont(name: "Montserrat-Light", size: 12.0)
        alpha = 1.0
        layer.cornerRadius = 10;
        clipsToBounds  =  true
    }
}
