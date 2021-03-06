//
//  SecondViewController.swift
//  Unicorn
//
//  Created by Mir Ali on 3/24/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

var Employees:[Employee] = []
var totalNumEmployees = 1

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var titleLabel:UILabel!

    
    @IBOutlet var currentLocationLabel: UILabel!
    @IBOutlet var locationUpgradeLabel: UILabel!
    @IBOutlet var locationCostLabel: UILabel!
    
    var currentLocation:Int = 0
    
    var locations:[String] = ["Mom's Basement", "Small Office", "Medium Office", "Large Office", "Warehouse", "Building in Seattle", "Building in San Francisco", "Building in NYC", "Building in Beijing"]
    var employeeLimit:[Int] = []
    var locationCost:[Int] = []
    var currNumEmployees:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        for index in 1...locations.count {
            employeeLimit.append(index)
        }
        for index in 1...locations.count {
            locationCost.append(index*index*1250)
        }
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "refresh",
            name: "reloadTableView",
            object: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        currNumEmployees = Employees.count
        titleLabel.text = "Employees \(currNumEmployees)/\(totalNumEmployees)"

        currentLocationLabel.text = "Current : \(locations[currentLocation])"
        locationUpgradeLabel.text = "Upgrade : \(locations[currentLocation + 1]) (+\(employeeLimit[currentLocation+1]) Employees)"
        locationCostLabel.text = "Cost : $\(locationCost[currentLocation])"
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Employees.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("Employees") as? EmployeesTableViewCell {
            cell.configureCell(Employees[indexPath.row])
            
            cell.fireButton.tag = indexPath.row
            let tapGesture = UITapGestureRecognizer(target: self, action: Selector("fireEmployee:"))
            cell.fireButton.addGestureRecognizer(tapGesture)

            return cell
        } else {
            return EmployeesTableViewCell()
        }
    }

    @IBAction func upgradeLocation(sender: AnyObject) {
        if currentLocation < locations.count - 1  && money >= locationCost[currentLocation]{
            money -= locationCost[currentLocation]
            currentLocation++
            currentLocationLabel.text = "Current : \(locations[currentLocation])"
            
            if currentLocation < locations.count - 1 {
                locationUpgradeLabel.text = "Upgrade : \(locations[currentLocation + 1]) (+\(employeeLimit[currentLocation+1]) Employees)"
            } else {
                locationUpgradeLabel.text = "Max Upgrade"
            }

            locationCostLabel.text = "Cost : $\(locationCost[currentLocation])"
            totalNumEmployees += employeeLimit[currentLocation]
            titleLabel.text = "Employees \(currNumEmployees)/\(totalNumEmployees)"
        }

    }
    
    func fireEmployee(sender: UITapGestureRecognizer)
    {
        if let button = sender.view as? UIButton
        {
                
                //Find current cell and add it to Employees
                let indexPath = NSIndexPath(forRow: button.tag, inSection: 0)
                let cell = tableView.cellForRowAtIndexPath(indexPath) as? EmployeesTableViewCell

                Employees.removeAtIndex(button.tag)
                
                totalMoneyIncrease -= (cell?.profit)!
                
                //Update Title

                self.title = "Employees \(Employees.count)/\(totalNumEmployees)"
                
                //Decrememnt number of rows and delete row at index path
                possibleEmployees.removeAtIndex(button.tag)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                self.tableView.reloadData()

        }
    }
    
    func refresh() {
        self.tableView.reloadData()
    }

}

