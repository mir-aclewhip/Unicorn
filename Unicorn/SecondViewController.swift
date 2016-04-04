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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        let currNumEmployees = Employees.count
        titleLabel.text = "Employees \(currNumEmployees)/\(totalNumEmployees)"
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
            //totalMoneyIncrease += Int(cell.profit)
            return cell
        } else {
            return EmployeesTableViewCell()
        }
    }


}

