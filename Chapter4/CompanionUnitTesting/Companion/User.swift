//
//  User.swift
//  Companion
//
//  Created by Lakshmi Bomma on 10/5/16.
//  Copyright © 2016 riis. All rights reserved.
//

import Foundation



class User
{
    var username :String?
    var birthDate :String?
    var password :String?
    var todayIsBirthday:Bool = false
    var age:Int?


    init(uName: String, pword:String,date:String)
    {
        self.username = uName
        self.birthDate = date
        self.password = pword
    }
    

    func calculateAge()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        let date = dateFormatter.date(from: self.birthDate!)
        let calendar  =  NSCalendar.current
        let ageComponents = calendar.dateComponents([.year,.month,.day], from:date!,  to:NSDate() as Date)
        let personAge = ageComponents.year
        
        if let pAge = personAge
        {
            self.age = pAge
        }
    }
    
    func checkForBirthday()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        
        let date = dateFormatter.date(from: self.birthDate!)
        let currentDate = Date()
        
        
        dateFormatter.dateFormat = "MMM"
        let month  = dateFormatter.string(from: date!)
        let currentMonth  = dateFormatter.string(from: currentDate)
        
        
        dateFormatter.dateFormat = "dd"
        let day  = dateFormatter.string(from: date!)
        let currentDay  = dateFormatter.string(from: currentDate)
        
        if currentDay == day && currentMonth == month
        {
            todayIsBirthday = true
        }
        else
        {
            todayIsBirthday = false
        }
    }
}


