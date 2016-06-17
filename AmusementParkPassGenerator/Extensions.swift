//
//  Extensions.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/12/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation

// This is awesome. It takes a string and turns it into an NSDate!
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

// Returns a string for each of the error types.
extension error: CustomStringConvertible {
    var description: String {
        switch self {
        case ExceededAgeLimit: return "to old to be a kid"
        case MissingFirstName: return "Missing first name"
        case MissingLastName: return "Missing last name"
        case AddressIncomplete: return "Address is incomplete"
        case MissingDOB: return "Missing Date of Birth"
        case MissingSSN: return "Missing SSN"
        }
    }
}

 // I've added this to convert and NSDate to an Int so that I can pass this value into the checkAge function located in the ViewController.
extension NSDate {
    var age: Int {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        let now = calendar.startOfDayForDate(NSDate())
        let birthdate = calendar.startOfDayForDate(self)
        let components = calendar.components(.Year, fromDate: birthdate, toDate: now, options: [])
        return components.year
    }
}