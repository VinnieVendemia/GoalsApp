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
        addBottomBorder(textField: emailTextField);
        addBottomBorder(textField: passwordTextField);
    }
    
    func addBottomBorder(textField: UITextField) {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
}
