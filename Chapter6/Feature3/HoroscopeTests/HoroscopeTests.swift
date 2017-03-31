//
//  HoroscopeTests.swift
//  HoroscopeTests
//
//  Created by User on 9/24/16.
//  Copyright © 2016 RIIS. All rights reserved.
//

import XCTest
@testable import Horoscope

class HoroscopeTests: XCTestCase {
    
    let horoscopeModel = HoroscopeData.horoscopes

    var signsDetailViewController  = SignsDetailViewController()
    



    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumHoroscopeSigns() {
            XCTAssertEqual(horoscopeModel.count, 12)
    }
    
    func testHoroscopeSignsAreInCorrectOrder() {
        XCTAssertEqual(horoscopeModel[0].name, "Aries")
        XCTAssertEqual(horoscopeModel[1].name, "Taurus")
        XCTAssertEqual(horoscopeModel[2].name, "Gemini")
        XCTAssertEqual(horoscopeModel[3].name, "Cancer")
        XCTAssertEqual(horoscopeModel[4].name, "Leo")
        XCTAssertEqual(horoscopeModel[5].name, "Virgo")
        XCTAssertEqual(horoscopeModel[6].name, "Libra")
        XCTAssertEqual(horoscopeModel[7].name, "Scorpio")
        XCTAssertEqual(horoscopeModel[8].name, "Sagittarius")
        XCTAssertEqual(horoscopeModel[9].name, "Capricorn")
        XCTAssertEqual(horoscopeModel[10].name, "Aquarius")
        XCTAssertEqual(horoscopeModel[11].name, "Pisces")
        
    }
 
    func testHoroscopeDescription() {
        XCTAssertEqual(horoscopeModel[0].description, "Courageous and Energetic.")
    }
    
    func testHoroscopeSymbols() {
        XCTAssertEqual(horoscopeModel[0].symbol, "Ram")
    }
    
    func testHoroscopeMonth() {
        XCTAssertEqual(horoscopeModel[0].month, "April")
    }
    
    func testAppendURL() {
        let compURL = HoroscopeService.sharedInstance.appendURL(sign: "Aries")
        XCTAssertEqual(compURL, "http://www.findyourfate.com/rss/dailyhoroscope-feed.asp?sign=Aries&id=45")
    }

    func testHoroscopeApiData()
    {
        let expectation = self.expectation(description:"GET Async")

        HoroscopeService.sharedInstance.callDailyhoroscopeApi(sign: "Aries", parameters: nil, success: { (data) in
            
            XCTAssertNotNil(data)
            XCTAssertNotNil(HoroscopeService.horoscopeUrl)
            XCTAssertEqual(HoroscopeService.horoscopeUrl, "http://www.findyourfate.com/rss/dailyhoroscope-feed.asp?sign=Aries&id=45")

            expectation.fulfill()
            }) { (error) in
                
        }
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testXmlParser()
    {
    }
}
