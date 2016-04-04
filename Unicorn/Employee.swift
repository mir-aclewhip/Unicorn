//
//  Employee.swift
//  Unicorn
//
//  Created by Mir Ali on 3/31/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import Foundation

public extension Array {
    /// SwiftRandom extension
    public func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

public extension Int {
    /// SwiftRandom extension
    public static func random(range: Range<Int>) -> Int {
        return range.startIndex + Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex)))
    }
    
    /// SwiftRandom extension
    public static func random(lower: Int = 0, _ upper: Int = 100) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

class Employee {

    
    var name:String = "Bob"
    var catchPhrase:String = "I like to code..."
    var randomQuote:[String] =   ["'Get your facts first, then you can distort them as you please.'", "'Always borrow money from a pessimist. He won’t expect it back.'", "'Friendship is like peeing on yourself: everyone can see it, but only you get the warm feeling that it brings.'", "'Knowledge is knowing a tomato is a fruit; wisdom is not putting it in a fruit salad.'", "'The best way to lie is to tell the truth . . . carefully edited truth.'", "'Do not argue with an idiot. He will drag you down to his level and beat you with experience.'"]
    
    var salary:Double = 0.50
    var efficiency:Double!
    var min:Int = 10
    var max:Int = 75
    //var currentCodingLanguage:CodingLanguage!
    
    init() {
        name = randomFakeName()
        let x = randomInt(min...max)
        efficiency = Double(x)/100
        salary*=(efficiency+0.2)
        catchPhrase = randomQuote.randomItem()
    }
    
}

public func randomFakeName() -> String {
    let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan"]
    let lastNameList = ["Pearson", "Adams", "Cole", "Francis", "Andrews", "Casey", "Gross", "Lane", "Thomas", "Patrick", "Strickland", "Nicolas", "Freeman"]
    return firstNameList.randomItem() + " " + lastNameList.randomItem()
}

public func randomInt(range: Range<Int>) -> Int {
    return Int.random(range.startIndex, range.endIndex)
}