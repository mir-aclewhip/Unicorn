//
//  CodingTableViewCell.swift
//  Unicorn
//
//  Created by Mir Ali on 3/31/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

var currentCodingLanguage:String = ""

class CodingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var select:UIButton!
    @IBOutlet weak var requiredLabel:UILabel!
    @IBOutlet weak var gainedLabel:UILabel!
    @IBOutlet weak var codingUsesLabel:UILabel!
    @IBOutlet weak var averageProfitLabel:UILabel!
    
    var requirement:Int!
    var averageProfit:Int!
    var gainedKnowledge:Int!
    var codingLanguage:String!
    
    var codingLanguages:[String] = ["HTML & CSS", "JScript", "MySQL", "Terminal", "PHP", "Ruby", "Python", "R", "Perl", "Java", "C#", "Pascal", "C", "Obj-C", "Fortran", "C++", "Haskell", "Assembly", "Prolog", "LISP", "Brainfuck"]
    var languageKnowledge = [String:Int]()


    override func awakeFromNib() {
        super.awakeFromNib()
        select.layer.cornerRadius = 5.0
        for index in 1...codingLanguages.count {
            languageKnowledge[codingLanguages[index-1]] = (10*index + index/2)
        }
    }
    
    func configureCell(title:String, required:Int, gained:Int, uses:String, profit:Int, onOrNah:Bool) {
        
        if knowledge >= required && onOrNah == true{
            requiredLabel.textColor = UIColor.greenColor()
            requiredLabel.text = "Required: \(required) knowledge"
            select.hidden = false
        } else if knowledge >= required && onOrNah == false {
            updateLearnedSkillLabel()
            select.hidden = true
        } else if knowledge <= required && onOrNah == false {
            select.hidden = true
            updateLearnedSkillLabel()
        } else {
            requiredLabel.textColor = UIColor.redColor()
            requiredLabel.text = "Required: \(required) knowledge"
            select.hidden = true
        }
        gainedLabel.textColor = UIColor.greenColor()
        averageProfitLabel.textColor = UIColor.greenColor()
        
        
        self.title.text = title
        codingUsesLabel.text = uses
        averageProfitLabel.text = "Avg Profit: $\(profit)/sec"
        gainedLabel.text = "Recieve: \(gained) knowledge/sec"
        
        averageProfit = profit
        requirement = required
        gainedKnowledge = gained
        codingLanguage = title
        
    }
    
    
    @IBAction func learnLanguage(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("reloadTableView", object: self)
        if knowledge >= requirement {
            totalKnowledgeIncrease += gainedKnowledge
            select.hidden = true
            isActive[select.tag] = false
            updateLearnedSkillLabel()
            knowledge -= requirement
            currentCodingLanguage = codingLanguage
            
            totalMoneyIncrease = 0
            if Employees.count > 0 {
                let increase = Double(languageKnowledge[currentCodingLanguage]!)
                //employee.profit = profit
                for index in 0...Employees.count-1 {
                    Employees[index].profit = Int(Employees[index].efficiency * increase - Employees[index].salary)
                    totalMoneyIncrease += Employees[index].profit
                    print(Employees[index].profit)
                    print(totalMoneyIncrease)
                }
            }

            
        }
    }
    
    func updateLearnedSkillLabel() {
        requiredLabel.textColor = UIColor.greenColor()
        requiredLabel.text = "Learned!"
    }


}
