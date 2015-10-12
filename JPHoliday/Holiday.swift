//
//  Holiday.swift
//  JPHoliday
//
//  Created by Komatsu, Makoto a | Mako | NEWSD on 10/12/15.
//  Copyright © 2015 mako2x. All rights reserved.
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
            return DateUtil.calcWeekday(year: year, month: month, day: day)
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

extension Holiday: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return "\(self.year)/\(self.month)/\(self.day) \(self.name)"
    }
    
    public var debugDescription: String {
        return description
    }
}
