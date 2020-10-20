//
//  LoginViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController, ToastShowable {
    @IBOutlet weak var idTextField: FormField!
    @IBOutlet weak var pwTextField: FormField!
    var toastLabel: ToastLabel!
    
    private let loginUseCase = LoginUseCase(networkDispatcher: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureToastLabel()
    }
    
    @IBAction func loginButtonTouched(_ sender: UIButton) {
        guard let jsonData = Login(userId: idTextField.text!,
        password: pwTextField.text!).toJson else { return }
        
        loginUseCase.requestIsLogin(with: LoginRequest(data: jsonData)) {
            self.showToast(by: $0)
        }
    }
    
    func showToast(by result: Bool) {
        DispatchQueue.main.async {
            result ? self.show(message: "로그인 성공!") : self.show(message: "로그인 실패!")
        }
    }
    
    private func configureToastLabel() {
        toastLabel = ToastLabel(
            frame: CGRect(
                x: 10,
                y: self.view.frame.size.height - 100,
                width: view.frame.size.width - 2 * 10,
                height: 35)
        )
    }
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
