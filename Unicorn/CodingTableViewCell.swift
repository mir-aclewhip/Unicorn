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


    override func awakeFromNib() {
        super.awakeFromNib()
        select.layer.cornerRadius = 5.0
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
        if knowledge >= requirement {
            totalKnowledgeIncrease += gainedKnowledge
            select.hidden = true
            isActive[select.tag] = false
            updateLearnedSkillLabel()
            knowledge -= requirement
            currentCodingLanguage = codingLanguage
        }
    }
    
    func updateLearnedSkillLabel() {
        requiredLabel.textColor = UIColor.greenColor()
        requiredLabel.text = "Learned!"
    }


}
