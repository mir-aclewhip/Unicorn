//
//  EmployeesTableViewCell.swift
//  Unicorn
//
//  Created by Mir Ali on 4/1/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

class EmployeesTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var efficiencyLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var profitLabel:UILabel!
    
    var profit:Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(employee:Employee) {
        nameLabel.text = employee.name
        efficiencyLabel.text = "Efficiency: \(employee.efficiency*100)% "
        costLabel.textColor = UIColor.redColor()
        costLabel.text = "Cost: $\(employee.salary)/sec"
        profitLabel.textColor = UIColor.greenColor()
        profitLabel.text = "Profit: $\(employee.efficiency * 10)/sec (HTML)"
        randomLabel.text = employee.catchPhrase
        profit = Int(employee.efficiency)*10 - Int(employee.salary)
    }

}
