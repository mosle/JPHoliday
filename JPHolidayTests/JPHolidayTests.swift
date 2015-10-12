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
    func testIsHoliday() {
        readCSV { (item) in
            let year = Int((item[0])) ?? 0
            let month = Int((item[1])) ?? 0
            let day = Int((item[2])) ?? 0
            XCTAssertTrue(JPHoliday.isHoliday(year: year, month: month, day: day), "\(year)/\(month)/\(day) is holiday")
        }
    }
    
    private func readCSV(callback: ([String]) -> Void) {
        let path = NSBundle(forClass: JPHolidayTests.self).pathForResource("holidays", ofType: "csv")!
        let text = try! NSString(contentsOfFile: path, encoding:NSUTF8StringEncoding)
        let lines = text.componentsSeparatedByString("\n")
        for line in lines {
            if line.isEmpty {
                continue
            }
            let i = line.componentsSeparatedByString(",")
            callback(i)
        }
    }
}
