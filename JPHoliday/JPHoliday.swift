//
//  JPHoliday.swift
//  JPHoliday
//
//  Created by mako on 3/7/15.
//  Copyright (c) 2015 mako2x. All rights reserved.
//

import Foundation

/**
*  日本の祝祭日を取得
*/
public struct JPHoliday {
    /**
    指定年の祝祭日を取得する
    
    - parameter year: 指定年
    
    - returns: 指定年の祝祭日
    */
    public static func holidays(year year: Int) -> [Holiday] {
        let holidays = HolidayMaps.flatMap { $0(year: year).map { [$0] } ?? [] }
        return DateUtil.addNationalAndSubstituteHolidays(holidays)
    }
    
    /**
    指定年月日が祝祭日かどうか取得する
    
    - parameter year:  年
    - parameter month: 月
    - parameter day:   日
    
    - returns: 指定年月日が祝祭日かどうか
    */
    public static func isHoliday(year year: Int, month: Int, day: Int) -> Bool {
        for h in holidays(year: year) {
            if h.month == month && h.day == day {
                return true
            }
        }
        return false
    }
}
