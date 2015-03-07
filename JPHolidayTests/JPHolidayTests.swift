//
//  JPHolidayTests.swift
//  JPHolidayTests
//
//  Created by mako on 3/7/15.
//  Copyright (c) 2015 mako2x. All rights reserved.
//

import UIKit
import XCTest
import JPHoliday

class JPHolidayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsHoliday() {
        readCSV { (item) in
            let year = (item[0]).toInt()!
            let month = (item[1]).toInt()!
            let day = (item[2]).toInt()!
            XCTAssertTrue(JPHoliday.isHoliday(year: year, month: month, day: day), "\(year)/\(month)/\(day) is holiday")
        }
    }
    
    private func readCSV(callback: ([String]) -> Void) {
        let path = NSBundle(forClass: JPHolidayTests.self).pathForResource("holidays", ofType: "csv")!
        let text = NSString(contentsOfFile: path, encoding:NSUTF8StringEncoding, error:nil)!
        let lines = text.componentsSeparatedByString("\n") as [NSString]
        for line in lines {
            if line.isEqualToString("") {
                continue
            }
            let i = line.componentsSeparatedByString(",") as [String]
            callback(i)
        }
    }

}
