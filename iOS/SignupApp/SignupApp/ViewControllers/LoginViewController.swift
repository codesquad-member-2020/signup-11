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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureToastLabel()
    }
    
    @IBAction func loginButtonTouched(_ sender: UIButton) {
        isLogin { result in
            guard let result = result else { return }
            
            self.showToast(by: result)
        }
    }
    
    func showToast(by result: Bool) {
        DispatchQueue.main.async {
            result ? self.show(message: "로그인 성공!") : self.show(message: "로그인 실패!")
        }
    }
    
    // 이 부분도 분리하자 
    private func isLogin(resultHandler: @escaping (Bool?) -> ()) {
        let login = Login(userId: idTextField.text!,
                          password: pwTextField.text!)
        guard let jsonData = DataCoder.encodeJSONData(login) else { return }
        
        NetworkManager.excuteURLSession(
            method: .post,
            from: Endpoints.urlStringLoginInfo,
            data: jsonData
        ) { data in
            guard let data = data else { return }
            guard let loginResponse = DataCoder.decodeJSONData(
                type: LoginResponse.self,
                data: data,
                dateDecodingStrategy: nil
                ) else { return }
            
            resultHandler(loginResponse.success)
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
