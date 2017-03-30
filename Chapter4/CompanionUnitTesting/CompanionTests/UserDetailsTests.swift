//
//  UserDetailsTests.swift
//  Companion
//
//  Created by Lakshmi Bomma on 10/20/16.
//  Copyright © 2016 riis. All rights reserved.
//

import XCTest
import Cuckoo

@testable import Companion

class UserDetailsTests: XCTestCase
{
    var mockUserDefaults:MockUserDefaultsMock!
    var mock:MockUser!
    var previousYearDate: Date?
    var dateStr:String?

    
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockUserDefaults = MockUserDefaultsMock()
        stub(mockUserDefaults)
        {
            (mockUserDefaults) in
            when(mockUserDefaults.standardUserDefaults.get).thenReturn(UserDefaults.standard)
        }
        
        let calendar = Calendar.autoupdatingCurrent
        
        let previousYear = calendar.component(.year, from: calendar.date(byAdding: .year, value: -3, to: Date())!)
        let currentMonth = calendar.component(.month, from: calendar.date(byAdding: .month, value: 0, to: Date())!)
        let currentDay = calendar.component(.day, from: calendar.date(byAdding: .day, value: 0, to: Date())!)
        
        
        let mockDateAndTime = MockDateAndTime()
        
        previousYearDate = mockDateAndTime.from(previousYear, month: currentMonth, day: currentDay) as Date

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateStr = dateFormatter.string(from: previousYearDate!)
        
        mock = MockUser(uName: "TestUser", pword: "Test@123", date: "Oct 6, 2011").spy(on: User(uName: "TestUser", pword: "Test@123", date: dateStr!))
        
        stub(mock) {
            (mock) in
            when(mock.calculateAge()).thenDoNothing()
        }
        stub(mock) {
            (mock) in
            when(mock.checkForBirthday()).thenDoNothing()
        }

        stub(mock) {
            (mock) in
            when(mock.todayIsBirthday.get).thenReturn(true)
        }
        
        stub(mock) {
            (mock) in
            when(mock.age.get).thenReturn(3)
        }
        mockUserDefaults.standardUserDefaults?.set(mock.username, forKey: "Username")
        mockUserDefaults.standardUserDefaults?.set(mock.password, forKey: "Password")
        mockUserDefaults.standardUserDefaults?.set(mock.birthDate, forKey: "Birthdate")
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
        previousYearDate = nil
        dateStr = nil
        reset(mockUserDefaults)
        reset(mock)
    }
    
    
    func testUserDetails()
    {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCTAssertNotNil(verify(mockUserDefaults).standardUserDefaults)

        XCTAssertNotNil(verify(mock).username)
        XCTAssertNotNil(verify(mock).password)
        XCTAssertNotNil(verify(mock).birthDate)

        XCTAssertEqual(mock.username, "TestUser")
        XCTAssertEqual(mock.password, "Test@123")
        XCTAssertEqual(mock.birthDate, dateStr!)

        let username = mockUserDefaults.standardUserDefaults?.string(forKey: "Username")
        let password = mockUserDefaults.standardUserDefaults?.string(forKey: "Password")
        let birthdate = mockUserDefaults.standardUserDefaults?.string(forKey: "Birthdate")

        XCTAssertEqual(username, "TestUser")
        XCTAssertEqual(password, "Test@123")
        XCTAssertEqual(birthdate, dateStr!)
        
        XCTAssertEqual(mock.age, 3)
        XCTAssertEqual(mock.todayIsBirthday, true)
    }
}
