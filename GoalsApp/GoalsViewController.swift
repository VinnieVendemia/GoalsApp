//
//  GoalsViewController.swift
//  GoalsApp
//
//  Created by Christopher Vincent Vendemia on 4/21/17.
//  Copyright © 2017 Vinnie Vendemia. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class GoalsViewController: UITableViewController {
    
    //MARK: Properties
    var goals = [Goal]()
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        axisFormatDelegate = self
        
        loadSampleGoals()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GoalTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GoalTableViewCell  else {
            fatalError("The dequeued cell is not an instance of GoalTableViewCell.")
        }
        
        let goal = goals[indexPath.row]
        
        cell.titleLable.text = goal.title
        cell.descriptionLabel.text = goal.goalDescription
        cell.goalLineChartView.data = updateChartWithData(goal: goal);
        configureChartView(goalLineChartView: cell.goalLineChartView)
        
        // Configure date format
        let xaxis = cell.goalLineChartView.xAxis
        xaxis.valueFormatter = axisFormatDelegate
        
        return cell
    }
    
    private func configureChartView(goalLineChartView: LineChartView){
        goalLineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInCubic)
        goalLineChartView.xAxis.drawAxisLineEnabled = false
        goalLineChartView.chartDescription?.text = ""
        goalLineChartView.isUserInteractionEnabled = false
    }
    
    
    //MARK: Private Methods
    private func updateChartWithData(goal: Goal) -> LineChartData {
        let dataEntries: [ChartDataEntry] = addProgressEntries(goal: goal)
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Goal Progress")
        chartDataSet.colors = [UIColor.blue];
        chartDataSet.drawCubicEnabled = true
        chartDataSet.drawFilledEnabled = true
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.drawValuesEnabled = false
        let chartData = LineChartData(dataSet: chartDataSet)
        return chartData
    }
    
    private func addProgressEntries(goal: Goal) -> [ChartDataEntry] {
        var dataEntries: [ChartDataEntry] = []
        for index in 0...9 {
            let y = Double(arc4random_uniform(10));
            let date = goal.progress[index]
            let timeIntervalForDate: TimeInterval = date.date.timeIntervalSinceNow
            let dataEntry = ChartDataEntry(x: Double(timeIntervalForDate), y: y)
            dataEntries.append(dataEntry)
        }
        
        return dataEntries;
    }
    
    private func sampleProgress(progress: List<Progress>){
        
        for index in 1...10 {
            let p1 = Progress()
            p1.progressDesciption = "P: \(index)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm"
            let testDate = "2017/04/0\(index) 08:00"
            let someDateTime: Date = formatter.date(from: testDate)!
            p1.date = someDateTime
            progress.append(p1)
        }
        
    }
    
    private func loadSampleGoals() {
        let goal1 = Goal()
        goal1.title = "Test Goal"
        goal1.goalDescription = "Test Goal Description"
        sampleProgress(progress: goal1.progress)
        goal1.save()
        
        let goal2 = Goal()
        goal2.title = "Test Goal 2"
        goal2.goalDescription = "Test Goal 2 Description"
        sampleProgress(progress: goal2.progress)
        goal2.save()
        
        goals += [goal1, goal2]
    }
}

// MARK: axisFormatDelegate
extension GoalsViewController: IAxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        return dateFormatter.string(from: Date(timeIntervalSinceNow: value))
    }
}
