//
//  HolidayMaps.swift
//  JPHoliday
//
//  Created by Komatsu, Makoto a | Mako | NEWSD on 10/12/15.
//  Copyright © 2015 mako2x. All rights reserved.
//

import Foundation

typealias HolidayMapping = (year: Int) -> Holiday?

/// 祝祭日のマッピング
let HolidayMaps: [HolidayMapping] = [
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
private func holidayMap(name name: String, month: Int, day: Int, yearInterval: ClosedInterval<Int>) -> HolidayMapping {
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
private func happyMondayMap(name name: String, month: Int, week: Int, yearInterval: ClosedInterval<Int>) -> HolidayMapping {
    return { year in
        if !yearInterval.contains(year) {
            return nil
        }
        
        let firstWeekday = DateUtil.calcWeekday(year: year, month: month, day: 1)
        let day = 7 * (week - (firstWeekday <= 2 ? 1 : 0)) + 3 - firstWeekday
        return Holiday(name: name, year: year, month: month, day: day)
    }
}

/**
春分の日
*/
private func vernalEquinoxHolidayMap(name name: String, month: Int, yearInterval: ClosedInterval<Int>) -> HolidayMapping {
    return { year in
        if !yearInterval.contains(year) {
            return nil
        }
        
        let surplus = year % 4
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
private func autumnalEquinoxHolidayMap(name name: String, month: Int, yearInterval: ClosedInterval<Int>) -> HolidayMapping {
    return { year in
        if !yearInterval.contains(year) {
            return nil
        }
        
        let surplus = year % 4
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
