//
//  ViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    private let idTextFieldDelegate = IDTextFieldDelegate()
    @IBOutlet weak var idTextField: IDTextField!
    
    private let pwTextFieldDelegate = PWTextFieldDelegate()
    @IBOutlet weak var pwTextField: PWTextField!
    
    private let pwAgainTextFieldDelegate = PWAgainTextFieldDelegate()
    @IBOutlet weak var pwAgainTextField: PWAgainTextField!
    
    private let nameTextFieldDelegate = NameTextFieldDelegate()
    @IBOutlet weak var nameTextField: NameTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldsDelegate()
    }
    
    private func setTextFieldsDelegate() {
        idTextField.delegate = idTextFieldDelegate
        pwTextField.delegate = pwTextFieldDelegate
        pwAgainTextField.delegate = pwAgainTextFieldDelegate
        nameTextField.delegate = nameTextFieldDelegate
    }
}

