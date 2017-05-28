//
//  SignUpViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/17/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordVerifyTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordValidationText: UILabel!
    var passwordsMatch = false
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let utils = Utilities();
        utils.addBottomBorder(textField: emailTextField);
        utils.addBottomBorder(textField: passwordTextField);
        utils.addBottomBorder(textField: passwordVerifyTextField);
        
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
            passwordsMatch = true
            passwordValidationText.textColor = UIColor.clear;
        } else {
            passwordsMatch = false
            passwordValidationText.textColor = UIColor.white;
        }
    }

    
    //MARK: Actions
    @IBAction func goToGoalsController(_ sender: Any) {

        if(!passwordsMatch) {
            let alert = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
        
            let username = emailTextField.text
            let password = passwordTextField.text
            
            apiWrapper.postUser(username: username!, password: password!, errorAlert: failureAlert() )
            // If positive response, call AUTH user, save token locally
                // then proceed to goalsController
            // if negative response, alert user that the save failed
        
            // self.performSegue(withIdentifier: "GoToGoalsController", sender:self)
        }
    }
    
    func failureAlert() {
        let alert = UIAlertController(title: "Error", message: "Failed to create user", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
