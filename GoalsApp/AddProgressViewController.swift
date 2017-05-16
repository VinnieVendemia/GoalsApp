//
//  AddProgressViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 5/15/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit
import SearchTextField

class AddProgresViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var descriptionTextField: SearchTextField!
    @IBOutlet weak var scalePicker: UIPickerView!
    let pickerData: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let utils = Utilities();
        utils.addBottomBorder(textField: descriptionTextField);
        
        configureSimpleSearchTextField()
        
        self.scalePicker.delegate = self
        self.scalePicker.dataSource = self
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // 1 - Configure a simple search text view
    func configureSimpleSearchTextField() {
        // Start visible - Default: false
        descriptionTextField.startVisible = true
        
        // Set data source (using colors as example for now)
        descriptionTextField.filterStrings(["Red", "Blue", "Yellow"])
    }
}
