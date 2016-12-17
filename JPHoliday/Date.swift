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
    func dateByAddingDays(_ days: Int) -> Date {
        var cal = Calendar(identifier: Calendar.Identifier.gregorian)
        cal.locale = Locale(identifier: "en_US")

        var c1 = DateComponents()
        c1.year = self.year
        c1.month = self.month
        c1.day = self.day
        let date = cal.date(from: c1)!.addingTimeInterval(TimeInterval(days) * 24 * 60 * 60)
        
        let c2 = (cal as NSCalendar).components([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day], from: date)
        return Date(year: c2.year!, month: c2.month!, day: c2.day!)
    }
    
    /**
    祝祭日に同じ日があるか
    */
    func isContainedInHolidays(_ holidays: [Holiday]) -> Bool {
        return !(holidays.filter { self.month == $0.month && self.day == $0.day }).isEmpty
    }
}
