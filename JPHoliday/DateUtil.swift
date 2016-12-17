//
//  DateUtil.swift
//  JPHoliday
//
//  Created by Komatsu, Makoto a | Mako | NEWSD on 10/12/15.
//  Copyright © 2015 mako2x. All rights reserved.
//

import Foundation

/**
*  日付の計算を行うクラス
*/
struct DateUtil {
    /**
    指定の年月日の曜日を取得する
    
    - parameter year:  年
    - parameter month: 月
    - parameter day:   日
    
    - returns: 曜日
    */
    static func calcWeekday(year: Int, month: Int, day: Int) -> Int {
        var cal = Calendar(identifier: Calendar.Identifier.gregorian)
        cal.locale = Locale(identifier: "en_US")
        
        var comp = DateComponents()
        comp.year = year
        comp.month = month
        comp.day = day
        
        let date = cal.date(from: comp)!
        return (cal as NSCalendar).components(NSCalendar.Unit.weekday, from: date).weekday!
    }
    
    /**
    国民の休日と振替え休日を追加する
    
    - parameter orignalHolidays: 追加前の休日の配列
    
    - returns: 追加後の休日の配列
    */
    static func addNationalAndSubstituteHolidays(_ orignalHolidays: [Holiday]) -> [Holiday] {
        return addNatinalHolidays(addSubstituteHolidays(orignalHolidays))
    }
    
    /**
    国民の休日を追加する
    
    - parameter orignalHolidays: 追加前の休日の配列
    
    - returns: 追加後の休日の配列
    */
    fileprivate static func addNatinalHolidays(_ orignalHolidays: [Holiday]) -> [Holiday] {
        var holidays = [Holiday]()
        for h in orignalHolidays {
            let d = Date(year: h.year, month: h.month, day: h.day)
            if h.year >= 1986 && d.dateByAddingDays(-2).isContainedInHolidays(holidays) {
                let dateBefore1Day = d.dateByAddingDays(-1)
                if !dateBefore1Day.isContainedInHolidays(holidays) {
                    let nationalHoliday = Holiday(name: "国民の休日", year: dateBefore1Day.year, month: dateBefore1Day.month, day: dateBefore1Day.day)
                    holidays.append(nationalHoliday)
                }
            }
            holidays.append(h)
        }
        return holidays
    }
    
    /**
    振替休日を追加する
    
    - parameter orignalHolidays: 追加前の休日の配列
    
    - returns: 追加後の休日の配列
    */
    fileprivate static func addSubstituteHolidays(_ orignalHolidays: [Holiday]) -> [Holiday] {
        var holidays = [Holiday]()
        for h in orignalHolidays {
            holidays.append(h)
            
            if h.year < 1973 || (h.year == 1973 && h.month < 4) || h.weekday != 1 {
                continue
            }
            
            var d = Date(year: h.year, month: h.month, day: h.day)
            while d.isContainedInHolidays(orignalHolidays) {
                d = d.dateByAddingDays(1)
            }
            holidays.append(Holiday(name: "振替休日", year: d.year, month: d.month, day: d.day))
        }
        return holidays
    }
}
