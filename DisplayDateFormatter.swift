//
//  DisplayDateFormatter.swift
//  
//
//  Created by Eddy Claessens on 31/05/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import Foundation

var DisplayDateWithDayFormatter: NSDateFormatter {

    struct Static {
        static let instance: NSDateFormatter = {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = NSLocalizedString("EEEE dd MMMM", comment: "date with day name, day number and month name")
            return dateFormatter
        }()
    }

    return Static.instance
}


var DisplayDateWithYearFormatter: NSDateFormatter {
    
    struct Static {
        static let instance: NSDateFormatter = {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .LongStyle
            return dateFormatter
        }()
    }
    
    return Static.instance
}

//var DisplayDateTimeFormatter : NSDateFormatter {
//
//    struct Static {
//        static let instance: NSDateFormatter = {
//            let dateFormatter = NSDateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//            return dateFormatter
//        }()
//    }
//
//    return Static.instance
//}
