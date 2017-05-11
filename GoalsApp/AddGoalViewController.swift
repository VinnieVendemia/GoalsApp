//
//  AddGoalViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/10/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit
import os.log

class AddGoalViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet var goalTitleField: UITextField!
    @IBOutlet var goalDescriptionField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var goal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let utils = Utilities();
        utils.addBottomBorder(textField: goalTitleField);
        utils.addBottomBorder(textField: goalDescriptionField);
    }
    
    //Mark: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            return
        }
        
        let title = goalTitleField.text ?? ""
        let description = goalDescriptionField.text ?? ""
        goal = Goal()
        goal?.title = title
        goal?.goalDescription = description
    }
    
}
