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
        if let url = URL(string: "https://signup11.herokuapp.com/users/login") {
            let user = User(userId: idTextField.text!,
                            password: pwTextField.text!)
            let session = URLSession.shared
            var request = URLRequest(url: url)
            if let jsonData = try? JSONEncoder().encode(user) {
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                request.httpMethod = "POST"
                request.httpBody = jsonData
                session.dataTask(with: request) { (data, urlResponse, error) in
                    guard let data = data else { return }
                    print(String(bytes: data, encoding: .utf8)!)
                }.resume()
            }
        }
    }
    
}
