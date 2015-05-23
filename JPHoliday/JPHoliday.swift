//
//  JPHoliday.swift
//  JPHoliday
//
//  Created by mako on 3/7/15.
//  Copyright (c) 2015 mako2x. All rights reserved.
//

import Foundation

/**
*  祝祭日
*/
public struct Holiday {
    /// 祝祭日名
    public let name: String
    
    /// 年
    public let year: Int
    
    /// 月
    public let month: Int
    
    /// 日
    public let day: Int
    
    /// 曜日
    public var weekday: Int {
        get {
            return calcWeekday(year: year, month: month, day: day)
        }
    }
    
    public var dateComponent: NSDateComponents {
        get {
            let comp = NSDateComponents()
            comp.era = 1
            comp.year = year
            comp.month = month
            comp.day = day
            comp.weekday = weekday
            return comp
        }
    }
}

extension Holiday: Printable, DebugPrintable {
    public var description: String {
        return "\(self.year)/\(self.month)/\(self.day) \(self.name)"
    }
    
    public var debugDescription: String {
        return description
    }
}

// MARK: Holiday Map

private typealias HolidayMap = (year: Int) -> Holiday?

private let holidayMaps: [HolidayMap] = [
    holidayMap(name: "四方節", month: 1, day: 1, yearInterval: 1874...1948),
    holidayMap(name: "元旦", month: 1, day: 1, yearInterval: 1949...Int.max),
    holidayMap(name: "元始祭", month: 1, day: 3, yearInterval: 1874...1948),
    holidayMap(name: "新年宴會", month: 1, day: 5, yearInterval: 1874...1948),
    holidayMap(name: "成人の日", month: 1, day: 15, yearInterval: 1949...1999),
    happyMondayMap(name: "成人の日", month: 1, week: 2, yearInterval: 2000...Int.max),
    holidayMap(name: "孝明天皇祭", month: 1, day: 30, yearInterval: 1874...1912),
    holidayMap(name: "紀元節", month: 2, day: 11, yearInterval: 1874...1948),
    holidayMap(name: "建国記念の日", month: 2, day: 11, yearInterval: 1967...Int.max),
    holidayMap(name: "昭和天皇の大喪の礼", month: 2, day: 24, yearInterval: 1989...1989),
    vernalEquinoxHolidayMap(name: "春季皇靈祭", month: 3, yearInterval: 1879...1948),
    vernalEquinoxHolidayMap(name: "春分の日", month: 3, yearInterval: 1949...Int.max),
    holidayMap(name: "神武天皇祭", month: 4, day: 3, yearInterval: 1874...1948),
    holidayMap(name: "皇太子・明仁親王の結婚の儀", month: 4, day: 10, yearInterval: 1959...1959),
    holidayMap(name: "天長節", month: 4, day: 29, yearInterval: 1927...1948),
    holidayMap(name: "天皇誕生日", month: 4, day: 29, yearInterval: 1949...1988),
    holidayMap(name: "みどりの日", month: 4, day: 29, yearInterval: 1989...2006),
    holidayMap(name: "昭和の日", month: 4, day: 29, yearInterval: 2007...Int.max),
    holidayMap(name: "憲法記念日", month: 5, day: 3, yearInterval: 1949...Int.max),
    holidayMap(name: "みどりの日", month: 5, day: 4, yearInterval: 2007...Int.max),
    holidayMap(name: "こどもの日", month: 5, day: 5, yearInterval: 1949...Int.max),
    holidayMap(name: "皇太子・徳仁親王の結婚の儀", month: 6, day: 9, yearInterval: 1993...1993),
    holidayMap(name: "海の日", month: 7, day: 20, yearInterval: 1996...2002),
    happyMondayMap(name: "海の日", month: 7, week: 3, yearInterval: 2003...Int.max),
    holidayMap(name: "明治天皇祭", month: 7, day: 30, yearInterval: 1913...1926),
    holidayMap(name: "山の日", month: 8, day: 11, yearInterval: 2016...Int.max),
    holidayMap(name: "天長節", month: 8, day: 31, yearInterval: 1913...1926),
    holidayMap(name: "敬老の日", month: 9, day: 15, yearInterval: 1966...2002),
    happyMondayMap(name: "敬老の日", month: 9, week: 3, yearInterval: 2003...Int.max),
    holidayMap(name: "神嘗祭", month: 9, day: 17, yearInterval: 1874...1878),
    autumnalEquinoxHolidayMap(name: "秋季皇靈祭", month: 9, yearInterval: 1878...1947),
    autumnalEquinoxHolidayMap(name: "秋分の日", month: 9, yearInterval: 1948...Int.max),
    holidayMap(name: "体育の日", month: 10, day: 10, yearInterval: 1966...1999),
    happyMondayMap(name: "体育の日", month: 10, week: 2, yearInterval: 2000...Int.max),
    holidayMap(name: "神嘗祭", month: 10, day: 17, yearInterval: 1873...1879),
    holidayMap(name: "天長節祝日", month: 10, day: 31, yearInterval: 1913...1926),
    holidayMap(name: "天長節", month: 11, day: 3, yearInterval: 1873...1911),
    holidayMap(name: "明治節", month: 11, day: 3, yearInterval: 1927...1947),
    holidayMap(name: "文化の日", month: 11, day: 3, yearInterval: 1948...Int.max),
    holidayMap(name: "即位ノ禮", month: 11, day: 10, yearInterval: 1915...1915),
    holidayMap(name: "即位ノ禮", month: 11, day: 10, yearInterval: 1928...1928),
    holidayMap(name: "即位礼正殿の儀", month: 11, day: 12, yearInterval: 1990...1990),
    holidayMap(name: "大嘗祭", month: 11, day: 14, yearInterval: 1915...1915),
    holidayMap(name: "大嘗祭", month: 11, day: 14, yearInterval: 1928...1928),
    holidayMap(name: "大饗第1日", month: 11, day: 16, yearInterval: 1915...1915),
    holidayMap(name: "大饗第1日", month: 11, day: 16, yearInterval: 1928...1928),
    holidayMap(name: "新嘗祭", month: 11, day: 23, yearInterval: 1873...1947),
    holidayMap(name: "勤労感謝の日", month: 11, day: 23, yearInterval: 1948...Int.max),
    holidayMap(name: "天皇誕生日", month: 12, day: 23, yearInterval: 1989...Int.max),
    holidayMap(name: "大正天皇祭", month: 12, day: 25, yearInterval: 1927...1947),
]

/**
日指定の祝祭日
*/
private func holidayMap(#name: String, #month: Int, #day: Int, #yearInterval: ClosedInterval<Int>) -> HolidayMap {
    return { year in
        if yearInterval.contains(year) {
            return Holiday(name: name, year: year, month: month, day: day)
        }
        return nil
    }
}

/**
ハッピーマンデー
*/
private func happyMondayMap(#name: String, #month: Int, #week: Int, #yearInterval: ClosedInterval<Int>) -> HolidayMap {
    return { year in
        if !yearInterval.contains(year) {
            return nil
        }
        
        let firstWeekday = calcWeekday(year: year, month: month, day: 1)
        let day = 7 * (week - (firstWeekday <= 2 ? 1 : 0)) + 3 - firstWeekday
        return Holiday(name: name, year: year, month: month, day: day)
    }
}

/**
春分の日
*/
private func vernalEquinoxHolidayMap(#name: String, #month: Int, #yearInterval: ClosedInterval<Int>) -> HolidayMap {
    return { year in
        if !yearInterval.contains(year) {
            return nil
        }
        
        var surplus = year % 4
        var day: Int
        switch year {
        case 1800...1827:
            day = 21
        case 1828...1859:
            day = surplus < 1 ? 20 : 21
        case 1860...1891:
            day = surplus < 2 ? 20 : 21
        case 1892...1899:
            day = surplus < 3 ? 20 : 21
        case 1900...1923:
            day = surplus < 3 ? 21 : 22
        case 1924...1959:
            day = 21
        case 1960...1991:
            day = surplus < 1 ? 20 : 21
        case 1992...2023:
            day = surplus < 2 ? 20 : 21
        case 2024...2055:
            day = surplus < 3 ? 20 : 21
        case 2056...2091:
            day = 20
        case 2092...2099:
            day = surplus < 1 ? 19 : 20
        case 2100...2123:
            day = surplus < 1 ? 20 : 21
        case 2124...2155:
            day = surplus < 2 ? 20 : 21
        case 2156...2187:
            day = surplus < 3 ? 20 : 21
        default:
            day = 20
        }
        return Holiday(name: name, year: year, month: month, day: day)
    }
}

/**
秋分の日
*/
private func autumnalEquinoxHolidayMap(#name: String, #month: Int, #yearInterval: ClosedInterval<Int>) -> HolidayMap {
    return { year in
        if !yearInterval.contains(year) {
            return nil
        }
        
        var surplus = year % 4
        var day: Int
        switch year {
        case 1800...1823:
            day = surplus < 2 ? 23 : 24
        case 1824...1851:
            day = surplus < 3 ? 23 : 24
        case 1852...1887:
            day = 23
        case 1888...1899:
            day = surplus < 1 ? 22 : 23
        case 1900...1919:
            day = surplus < 1 ? 23 : 24
        case 1920...1947:
            day = surplus < 2 ? 23 : 24
        case 1948...1979:
            day = surplus < 3 ? 23 : 24
        case 1980...2011:
            day = 23
        case 2012...2043:
            day = surplus < 1 ? 22 : 23
        case 2044...2075:
            day = surplus < 2 ? 22 : 23
        case 2076...2099:
            day = surplus < 3 ? 22 : 23
        case 2100...2103:
            day = surplus < 3 ? 23 : 24
        case 2104...2139:
            day = 23
        case 2140...2167:
            day = surplus < 1 ? 22 : 23
        case 2168...2199:
            day = surplus < 2 ? 22 : 23
        default:
            day = 23
        }
        return Holiday(name: name, year: year, month: month, day: day)
    }
}

// MARK: - Substitute & National Holiday

private struct Date {
    let year: Int
    let month: Int
    let day: Int
    
    /**
    指定日数後の日付を取得する
    */
    private func dateByAddingDays(days: Int) -> Date {
        let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        cal.locale = NSLocale(localeIdentifier: "en_US")

        let c1 = NSDateComponents()
        c1.year = self.year
        c1.month = self.month
        c1.day = self.day
        let date = cal.dateFromComponents(c1)!.dateByAddingTimeInterval(NSTimeInterval(days) * 24 * 60 * 60)
        
        let c2 = cal.components(NSCalendarUnit.YearCalendarUnit|NSCalendarUnit.MonthCalendarUnit|NSCalendarUnit.DayCalendarUnit, fromDate: date)
        return Date(year: c2.year, month: c2.month, day: c2.day)
    }
    
    /**
    祝祭日に同じ日があるか
    */
    private func isContainedInHolidays(holidays: [Holiday]) -> Bool {
        return !(holidays.filter { self.month == $0.month && self.day == $0.day }).isEmpty
    }
}

/**
振替休日を追加する
*/
private func addSubstituteHolidays(orignalHolidays: [Holiday]) -> [Holiday] {
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

/**
国民の休日を追加する
*/
private func addNatinalHolidays(orignalHolidays: [Holiday]) -> [Holiday] {
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

// MARK: -

/**
指定の年月日の曜日を取得する
*/
private func calcWeekday(#year: Int, #month: Int, #day: Int) -> Int {
    let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
    cal.locale = NSLocale(localeIdentifier: "en_US")
    
    let comp = NSDateComponents()
    comp.year = year
    comp.month = month
    comp.day = day
    
    let date = cal.dateFromComponents(comp)!
    return cal.components(NSCalendarUnit.WeekdayCalendarUnit, fromDate: date).weekday
}

// MARK: -

/**
*  日本の祝祭日を取得
*/
public struct JPHoliday {
    /**
    指定年の祝祭日を取得する
    
    :param: year 指定年
    
    :returns: 指定年の祝祭日
    */
    public static func holidays(#year: Int) -> [Holiday] {
        let holidays = holidayMaps.flatMap { $0(year: year).map { [$0] } ?? [] }
        return addNatinalHolidays(addSubstituteHolidays(holidays))
    }
    
    /**
    指定年月日が祝祭日かどうか取得する
    
    :param: year  年
    :param: month 月
    :param: day   日
    
    :returns: 指定年月日が祝祭日かどうか
    */
    public static func isHoliday(#year: Int, month: Int, day: Int) -> Bool {
        for h in holidays(year: year) {
            if h.month == month && h.day == day {
                return true
            }
        }
        return false
    }
}
