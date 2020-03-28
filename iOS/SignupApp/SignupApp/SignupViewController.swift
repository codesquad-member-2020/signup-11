//
//  ViewController.swift
//  SignupApp
//
//  Created by kimdo2297 on 2020/03/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var idTextField: IDTextField!
    @IBOutlet weak var pwTextField: PWTextField!
    @IBOutlet weak var pwAgainTextField: PWAgainTextField!
    @IBOutlet weak var nameTextField: NameTextField!
    @IBOutlet weak var nextButton: NextButton!
    private lazy var textFields = [idTextField, pwTextField, pwAgainTextField, nameTextField]
    
    private let idTextFieldDelegate = IDTextFieldDelegate()
    private let pwAgainTextFieldDelegate = PWAgainTextFieldDelegate()
    private let nameTextFieldDelegate = NameTextFieldDelegate()
    private let pwTextFieldDelegate = PWTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldsDelegate()
        setNextResponders()
    }
    
    private func setTextFieldsDelegate() {
        idTextField.delegate = idTextFieldDelegate
        pwTextField.delegate = pwTextFieldDelegate
        pwAgainTextField.delegate = pwAgainTextFieldDelegate
        nameTextField.delegate = nameTextFieldDelegate
    }
    
    private func setNextResponders() {
        idTextField.nextResonder = pwTextField
        pwTextField.nextResonder = pwAgainTextField
        pwAgainTextField.nextResonder = nameTextField
        nameTextField.nextResonder = nextButton
    }
    
    @IBAction func nextButtonTouchedUpInside(_ sender: NextButton) {
        var allCorrect = true
        for textField in textFields {
            guard let textField = textField
                else {
                    allCorrect = false
                    break
            }
            if !textField.isCorrect {
                allCorrect = false
                textField.becomeFirstResponder()
                break
            }
        }
        if allCorrect {
            sender.setTitleColor(UIColor.greenColor, for: .normal)
            sender.tintColor = UIColor.greenColor
        }
    }
}

