//
//  DateHelper.swift
//  Created by Srikanth on 11/10/23.

import Foundation

/*
 https://nsscreencast.com/episodes/367-dates-and-times
 https://www.swiftyplace.com/blog/swift-date-formatting-10-steps-guide
 
 “yyyy”:  Represents the four-digit year.
  Year:   y(2018), yy(18), yyyy(2018)
 
 “MM”:    Represents the two-digit month.
  Month:  M(1), MM(01), MMM(Jan), MMMM(January), MMMMM(J)
 
 “dd”:    Represents the two-digit day.
  Day:    d(1), dd(01)
  Week:   E(Fri), EEEE(Friday), EEEEE(F), EEEEEE(Fr)
 
 “HH”:    Represents the two-digit hour in a 24-hour format.
 24Hours: H(13), HH(13)
 12Hours: h(11), hh(11)
 
 “mm”:    Represents the two-digit minute.
 Minutes: m(1), mm(01)
 
 “ss”:    Represents the two-digit second.
 Seconds: s(1), ss(01)
 
 "a":     Represents the AM / PM for 12-hour time formats.
 
 “+zzzz”: Represents the time zone offset from UTC in the format “+HHmm”.
 */

enum DateFormat: String {
    case emd = "EEEE, MMM dd"
    case dmdy = "EEEE, MMMM d, yyyy"
    case emdy = "EEEE, MMMM dd, yyyy"
    case md = "MMM dd"
    case mdy = "MM/dd/yyyy"
    case ymd = "yyyy/MM/dd"
    case dmy = "dd-MM-yyyy"
    case mmd = "MM-dd"
    case hm = "HH:mm"
    case hms = "hh:mm:ss"
    case hma = "hh:mm a"
    case mmmmyyyy = "MMMM yyyy"
    case ym = "yyyy-MM"
    case month = "MMMM"
    case ddmmmyyyy = "dd MMM yyyy"
    case yyyyMMdd = "yyyy-MM-dd"
    case customFormat1 = "MMM. dd, yyyy"
}

struct DateHelper {
    /*
     Default date format: "yyyy-MM-dd HH:mm:ss +zzzz"
                      Eg: "2023-05-19 10:30:00 +0000"
     */
    
    static var today: Date {
        return Date.now
    }
    
    static var currentTimezone: String {
        let userTimeZone = TimeZone.current
        return "\(userTimeZone.identifier)"
    }
    
    static func date(WithTimeInterval timeInterval: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    static func createDateFromComponents(WithYear year: Int?,
                                         WithMonth month: Int?,
                                         WithDay day: Int?,
                                         WithHour hour: Int?,
                                         WithMinute minute: Int?) -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        
        if let componentDate = calendar.date(from: components) {
            return componentDate
        }
        else {
            return DateHelper.today
        }
    }
    
    static func getDateOnAddingSeconds(WithDate selDate: Date = DateHelper.today, WithSeconds seconds: TimeInterval) -> Date {
        return selDate.addingTimeInterval(seconds)
    }
}

extension Date {
    var nextMonth: Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: (self as Date)) ?? DateHelper.today
    }

    var previousMonth: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: (self as Date)) ?? DateHelper.today
    }
}

extension Date {
    func toString(WithDateFormat dateformat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = .current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = dateformat.rawValue
        return dateFormatter.string(from: self)
    }
}

extension String {
    func toDate(WithDateFormat dateformat: DateFormat) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = .current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = dateformat.rawValue
        return dateFormatter.date(from: self) ?? DateHelper.today
    }
}
