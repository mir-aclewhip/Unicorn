//
//  RecruitTableViewCell.swift
//  Unicorn
//
//  Created by Mir Ali on 3/31/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

class RecruitTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var efficiencyLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var button:UIButton!
    @IBOutlet var profitLabel:UILabel!
    
    
    var currentEmployee:Employee!
    var profit:Double!

    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = 5.0
    }


    func configureCell() {
        let employee = Employee()
        currentEmployee = employee
        nameLabel.text = employee.name
        efficiencyColorChange(employee.efficiency)
        efficiencyLabel.text = "Efficiency: \(employee.efficiency*100)% "
        costLabel.textColor = UIColor.redColor()
        costLabel.text = "Cost: $\(employee.salary)/sec"
        profitLabel.textColor = UIColor.greenColor()
        profitLabel.text = "Profit: $\(employee.efficiency * 10)/sec (HTML)"
        randomLabel.text = employee.catchPhrase
        profit = employee.efficiency * 10 - employee.salary
    }
    
    @IBAction func hireEmployee(sender: UIButton) {
        
    }
    
    
    func efficiencyColorChange(efficiency:Double) {
        if efficiency >= 0.75 {
            efficiencyLabel.textColor = UIColor.greenColor()
        } else if efficiency >= 0.3 && efficiency < 0.75 {
            efficiencyLabel.textColor = UIColor.orangeColor()
        } else {
            efficiencyLabel.textColor = UIColor.redColor()
        }
    }

}
