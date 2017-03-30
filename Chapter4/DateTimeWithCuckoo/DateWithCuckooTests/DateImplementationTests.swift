//
//  DateImplTests.swift
//  UserDefaultsUnitTesting
//
//  Created by Lakshmi Bomma on 10/11/16.
//  Copyright © 2016 riis. All rights reserved.
//

import XCTest
import Cuckoo

@testable import DateWithCuckoo

class DateImplementationTests: XCTestCase
{
    var previousYearDate: Date?
    var mock:MockDateImplementation!
    var mockedDate :Date!

    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let calendar = Calendar.autoupdatingCurrent
        
        let previousYear = calendar.component(.year, from: calendar.date(byAdding: .year, value: -3, to: Date())!)
        let currentMonth = calendar.component(.month, from: calendar.date(byAdding: .month, value: 0, to: Date())!)
        let currentDay = calendar.component(.day, from: calendar.date(byAdding: .day, value: 0, to: Date())!)
        
        let mockDateAndTime = MockDateAndTime()

        previousYearDate = mockDateAndTime.from(previousYear, month: currentMonth, day: currentDay) as Date
        mockedDate = mockDateAndTime.from(2014, month: 05, day: 20) as Date
        
        mock = MockDateImplementation().spy(on: DateImplementation())
        
        stub(mock) {
            (mock) in
            when(mock.choosenDate.get).thenReturn(mockedDate!)
        }
        
        stub(mock) { mock in
            
            when(mock.calculateAge()).thenReturn(3)
        }
        
        
        stub(mock) { mock in
            
            mock.checkForBirthday().thenReturn(true)
            
        }
        
        stub(mock) { mock in
            
            when(mock.getCurrentMonth()).thenReturn(05)
        }
        
        stub(mock) { mock in
            
            when(mock.getPreviousMonth()).thenReturn(04)
        }
    }
    
    
    class MockDateAndTime
    {
        func from(_ year:Int, month:Int, day:Int) -> Date
        {
            var c = DateComponents()
            c.year = year
            c.month = month
            c.day = day
            
            let gregorian = Calendar(identifier:Calendar.Identifier.gregorian)
            let date = gregorian.date(from: c as DateComponents)
            
            return (date! as NSDate) as Date
        }
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.previousYearDate = nil
        self.mockedDate = nil
        reset(mock!)
    }
    
    
    func testDateVerify()
    {
        XCTAssertNotNil(mock.choosenDate)
        XCTAssertEqual(mock.choosenDate, mockedDate)
        XCTAssertNotNil(verify(mock).choosenDate)
    }
    
    func testGetMonths()
    {
        let currentMonth = mock.getCurrentMonth()
        let previousMonth = mock.getPreviousMonth()
        
        XCTAssertEqual(currentMonth,05)
        XCTAssertEqual(previousMonth,04)
    }

    
    func testAge()
    {
        let age = mock.calculateAge()
        
        XCTAssertNotNil(age)
        XCTAssertNotEqual(age, 2)
        XCTAssertEqual(age, 3)
    }
    
    func testForBirthDay()
    {
        let birthday = mock.checkForBirthday()
        
        XCTAssertEqual(birthday, true)
    }
    
}
