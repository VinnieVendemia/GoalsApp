//
//  SignUpViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/17/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordVerifyTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordValidationText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        passwordVerifyTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func textFieldDidChange() {
        comparePasswordFields();
        
    }
    
    func comparePasswordFields() {
        let pw: String = passwordTextField.text!;
        let pwVerify: String = passwordVerifyTextField.text!;
        
        if pw == pwVerify {
            passwordValidationText.textColor = UIColor.clear;
        } else {
            passwordValidationText.textColor = UIColor.white;
        }
    }
    
}
