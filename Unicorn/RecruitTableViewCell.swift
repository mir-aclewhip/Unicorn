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
    
    var possibleEmployees:[Employee] = []
    var totalEmployees:Int = 5
    var currentEmployee:Employee!
    var profit:Double!

    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = 5.0
        for _ in 1...totalEmployees {
            let employee = Employee()
            possibleEmployees.append(employee)
        }
    }


    func configureCell(indexPath:Int) {
        currentEmployee = possibleEmployees[indexPath]
        nameLabel.text = currentEmployee.name
        efficiencyColorChange(currentEmployee.efficiency)
        efficiencyLabel.text = "Efficiency: \(currentEmployee.efficiency*100)% "
        costLabel.textColor = UIColor.redColor()
        costLabel.text = "Cost: $\(currentEmployee.salary)/sec"
        profitLabel.textColor = UIColor.greenColor()
        profitLabel.text = "Profit: $\(currentEmployee.efficiency * 10)/sec (HTML)"
        randomLabel.text = currentEmployee.catchPhrase
        profit = currentEmployee.efficiency * 10 - currentEmployee.salary
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
