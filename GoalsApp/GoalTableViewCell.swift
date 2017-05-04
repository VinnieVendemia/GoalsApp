//
//  Goal.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/22/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import Foundation
import UIKit
import Charts

class GoalTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet var goalLineChartView: LineChartView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
}
