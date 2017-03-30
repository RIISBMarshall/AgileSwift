//
//  DateImpl.swift
//  UserDefaultsUnitTesting
//
//  Created by Lakshmi Bomma on 10/10/16.
//  Copyright © 2016 riis. All rights reserved.
//

import Foundation



class DateImplementation
{
    var choosenDate : Date?
    
    
    func getPreviousMonth() -> Int
    {
        let cal = Calendar.autoupdatingCurrent
        
        return cal.component(.month, from: cal.date(byAdding: .month, value: -1, to: self.choosenDate!)!)
    }
    
    func getCurrentMonth() -> Int
    {
        let cal = Calendar.autoupdatingCurrent
        
        return cal.component(.month, from: cal.date(byAdding: .month, value:0, to: self.choosenDate!)!)
    }
    
    
    func calculateAge() -> Int
    {
        let calendar  =  NSCalendar.current
        let ageComponents = calendar.dateComponents([.year,.month,.day], from:self.choosenDate!,  to:NSDate() as Date)
        let personAge = ageComponents.year
        
        return personAge!
        
    }
    
    func checkForBirthday() -> Bool
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
//
//        let date = dateFormatter.date(from: forDate)
        let currentDate = Date()
        
        dateFormatter.dateFormat = "MMM"
        let month  = dateFormatter.string(from: choosenDate!)
        let currentMonth  = dateFormatter.string(from: currentDate)
        
        dateFormatter.dateFormat = "dd"
        let day  = dateFormatter.string(from: choosenDate!)
        let currentDay  = dateFormatter.string(from: currentDate)
        
        if currentDay == day && currentMonth == month
        {
            return true
        }
        else
        {
            return false
        }
    }
}


