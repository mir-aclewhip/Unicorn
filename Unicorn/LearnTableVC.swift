//
//  LearnTableVC.swift
//  Unicorn
//
//  Created by Mir Ali on 3/31/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

var isActive:[Bool] = []


class LearnTableVC: UITableViewController {
    
    var codingLanguages:[String] = ["HTML & CSS", "JScript", "MySQL", "Terminal", "PHP", "Ruby", "Python", "R", "Perl", "Java", "C#", "Pascal", "C", "Obj-C", "Fortran", "C++", "Haskell", "Assembly", "Prolog", "LISP", "Brainfuck"]
    var codingUses:[String] = ["Start Building Webpages that don't look too good but get the job done", "Improve Webpage Interactivity", "Build Your Own Database", "Master Your Computer", "Make better Websites", "Make even better websites", "Start mining data >:)", "Do stuff what that data", "I dunno what this is...", "Build some legit software", "Make 3d games in Unity", "Idk what this is...", "Do you really want to learn pointers?", "Make Awesome iOS Apps", "Some old ass language", "More C?! Really??", "Sounds kinda scary", "Just shoot yourself now", "Build some AI", "Beware of the robot apocolypse...", "For shits and gigs"]
    var required:[Int] = []
    var gained:[Int] = []
    var averageProfit:[Int] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        for index in 1...codingLanguages.count {
            required.append(100 * index * index)
        }
        
        for index in 1...codingLanguages.count {
            gained.append(2*index + index/2)
        }
        
        for index in 1...codingLanguages.count {
            averageProfit.append(10*index + index/2)
        }
        
        for _ in 1...codingLanguages.count {
            isActive.append(true)
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return codingLanguages.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("CodingLanguages") as? CodingTableViewCell {
            cell.configureCell(codingLanguages[indexPath.row], required: required[indexPath.row], gained: gained[indexPath.row], uses:codingUses[indexPath.row], profit: averageProfit[indexPath.row], onOrNah:isActive[indexPath.row])
            cell.select.tag = indexPath.row

            return cell
        } else {
            return CodingTableViewCell()
        }
    }


}
