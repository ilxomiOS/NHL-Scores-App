//
//  File.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import Foundation

enum DateCategory {
    case yesterday
    case today
    case tomorrow
}

extension Date {
    var dayAfter: Date {
        guard let dayAfter = Calendar.current.date(byAdding: .day, value: 1, to: self) else { return Date() }
        return dayAfter
    }
    
    var dayBefore: Date {
        guard let dayBefore = Calendar.current.date(byAdding: .day, value: -1, to: self) else { return Date() }
        return dayBefore
    }
}

final class DateHelper {
    static var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
    
    static func getDateString(day:DateCategory) -> String {
        let date:Date
        
        if day == DateCategory.today {
            date = Date()
        } else if day == DateCategory.yesterday {
            date = Date().dayBefore
        } else if day == DateCategory.tomorrow {
            date = Date().dayAfter
        } else {
            return ""
        }
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = months[calendar.component(.month, from: date) - 1]
        let day = calendar.component(.day, from: date)
        
        return "\(year)-\(month)-\(day)"
    }
    
    static func getTimeString(time:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let datetime = dateFormatter.date(from: time) else { return ""}
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: datetime)
    }
    
    static func getYearString() -> String {
        let year = Calendar.current.component(.year, from: Date())
        return "\(year)"
    }
}
