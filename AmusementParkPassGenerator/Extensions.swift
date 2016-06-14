//
//  Extensions.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/12/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation

extension String {
    
    func convertToDateTime () -> NSDate {
        
        //Create Date Formatter
        let dateFormatter = NSDateFormatter()
        
        //Specify the format to parse
        dateFormatter.dateFormat = "MM-dd-yyyy"

        //Parse the string into an NSDate
        let dateValue = dateFormatter.dateFromString(self) as NSDate!
        
        return dateValue
    }
    
}

extension NSDate {
    var age: Int {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        let now = calendar.startOfDayForDate(NSDate())
        let birthdate = calendar.startOfDayForDate(self)
        let components = calendar.components(.Year, fromDate: birthdate, toDate: now, options: [])
        return components.year
    }
}