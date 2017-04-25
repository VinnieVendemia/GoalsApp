//
//  LoginViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/17/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Properties 
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let utils = Utilities();
        utils.addBottomBorder(textField: emailTextField);
        utils.addBottomBorder(textField: passwordTextField);
    }
    
    //MARK: Actions 
    @IBAction func goToGoalsController(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToGoalsController", sender:self)
    }
}
