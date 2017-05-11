//
//  AddGoalViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/10/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit
import os.log

class AddGoalViewController: UIViewController, UITextFieldDelegate {
    
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
        
        goalTitleField.delegate = self

        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
    }
    
    //Mark: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    //MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = goalTitleField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
}
