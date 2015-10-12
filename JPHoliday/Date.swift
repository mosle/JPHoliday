//
//  Date.swift
//  JPHoliday
//
//  Created by Komatsu, Makoto a | Mako | NEWSD on 10/12/15.
//  Copyright © 2015 mako2x. All rights reserved.
//

import Foundation

/**
*  国民の休日や振替休日計算用の日付
*/
struct Date {
    /// 年
    let year: Int
    
    /// 月
    let month: Int
    
    // 日
    let day: Int
    
    /**
    指定日数後の日付を取得する
    */
    func dateByAddingDays(days: Int) -> Date {
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        cal.locale = NSLocale(localeIdentifier: "en_US")

        let c1 = NSDateComponents()
        c1.year = self.year
        c1.month = self.month
        c1.day = self.day
        let date = cal.dateFromComponents(c1)!.dateByAddingTimeInterval(NSTimeInterval(days) * 24 * 60 * 60)
        
        let c2 = cal.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: date)
        return Date(year: c2.year, month: c2.month, day: c2.day)
    }
    
    /**
    祝祭日に同じ日があるか
    */
    func isContainedInHolidays(holidays: [Holiday]) -> Bool {
        return !(holidays.filter { self.month == $0.month && self.day == $0.day }).isEmpty
    }
}
