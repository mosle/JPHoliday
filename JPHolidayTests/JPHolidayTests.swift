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
    
    fileprivate func readCSV(_ callback: ([String]) -> Void) {
        let path = Bundle(for: JPHolidayTests.self).path(forResource: "holidays", ofType: "csv")!
        let text = try! NSString(contentsOfFile: path, encoding:String.Encoding.utf8.rawValue)
        let lines = text.components(separatedBy: "\n")
        for line in lines {
            if line.isEmpty {
                continue
            }
            let i = line.components(separatedBy: ",")
            callback(i)
        }
    }
}
