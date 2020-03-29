//
//  LoginViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/27.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: FormTextField!
    @IBOutlet weak var pwTextField: FormTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTouched(_ sender: UIButton) {
        let login = Login(userId: idTextField.text!,
                          password: pwTextField.text!)
        guard let jsonData = DataCoder.encodeJSONData(login) else { return }
        Network.excuteURLSession(method: .post,
                                 from: SignupURL.urlStringLoginInfo,
                                 data: jsonData) { data in
                                    guard let data = data else { return }
                                    print(String(bytes: data, encoding: .utf8)!)
                                    
        }
    }
}
