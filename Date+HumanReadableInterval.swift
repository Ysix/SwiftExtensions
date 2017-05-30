//
//  Date_HumanReadableInterval.swift
//  
//
//  Created by Eddy Claessens on 05/05/2017.
//  Copyright © 2017 Eddy Claessens. All rights reserved.
//

import Foundation

extension Date {
    func readableInterval(fullyWrote: Bool = false) -> String {

        let timeInterval = -(self.timeIntervalSinceNow)

        let myCalendar = Calendar(identifier: .gregorian)
        let myComponents = myCalendar.dateComponents([.weekday], from: Date())
        let myComponents2 = myCalendar.dateComponents([.weekday], from: self)
        let weekDayCurrentDate = myComponents.weekday
        let weekDayDate = myComponents2.weekday

        if timeInterval < 0 {
            return ""
        }
        if timeInterval <= 60 {
            return NSLocalizedString("à l'instant", comment:"")
        }
        if timeInterval > 60 && timeInterval < 3600 {
            if weekDayCurrentDate != weekDayDate {
                return NSLocalizedString("hier", comment:"")
            }
            else {
                return (NSString(format: "%.0f", (timeInterval/60)) as String)  + " min"
            }
        }
        else if timeInterval >= 3600 && timeInterval <= 86_400 {
            if weekDayCurrentDate != weekDayDate {
                return NSLocalizedString("hier", comment:"")
            }
            else {
                let dateFormatter = DateFormatter()
                dateFormatter.timeZone = NSTimeZone.local
                dateFormatter.dateFormat = "HH:mm"
                return dateFormatter.string(from: self)
            }
        }
        else if timeInterval > 86_400 && timeInterval <= 172_800 {
            return NSLocalizedString("hier", comment:"")
        }
        else {
            if (fullyWrote)
            {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .long
                dateFormatter.timeZone = NSTimeZone.local
                dateFormatter.locale = Locale(identifier: NSLocalizedString("fr_FR", comment: ""))
                return String.localizedStringWithFormat(NSLocalizedString("le %@", comment: ""), dateFormatter.string(from: self))
            }
            else
            {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                dateFormatter.timeZone = NSTimeZone.local
                return dateFormatter.string(from: self)
            }
        }
    }
}
