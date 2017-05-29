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
            
            // Clear fields
            passwordTextField.text = ""
            passwordVerifyTextField.text = ""
            passwordsMatch = false
            
            apiWrapper.postUser(username: username!, password: password!, handleResponse: handleResponse )
        }
    }
    
    // Performs logic based on response of the postUser API request 
    // If successful, the message will contain the token of the 
    // account just created.
    //
    // On failure, present an alert w/ the corresponding message
    func handleResponse(passed: Bool, message: String) -> Void {
        if(passed) {
            self.performSegue(withIdentifier: "GoToGoalsController", sender:self)
        } else {
            failureAlert(message: message)
        }
    }
    
    func failureAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: "Failed to create user: \(message)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func successfulUserCreation() {
        print("Great Success")
        // If positive response, call AUTH user, save token locally
        // then proceed to
        
    }
}
