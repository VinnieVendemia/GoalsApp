//
//  ViewController.swift
//  GoalsApp
//
//  Created by Vinnie Vendemia on 3/29/17.
//  Copyright (c) 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Action 
    
    @IBAction func loginAction(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToLoginController", sender:self)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToSignUpController", sender:self)
    }
}

