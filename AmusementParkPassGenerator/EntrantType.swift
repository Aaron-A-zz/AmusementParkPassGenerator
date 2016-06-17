//
//  EntrantType.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/10/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation


enum entrantType: Equatable {
    case classicGuest
    case vipGuest
    case freeChildGuest
    case foodServicesEmployee
    case rideServicesEmployee
    case maintenanceEmployee
    case manager
}

enum mangementTier {
    case ShiftMgr
    case GeneralMgr
    case SeniorMgr
}

enum error: ErrorType {
    case MissingFirstName
    case MissingLastName
    case ExceededAgeLimit
    case AddressIncomplete
    case MissingDOB
    case MissingSSN
}


extension entrantType {
    
    //Check Ride Access for each entrant type
    func rideAccess() -> String {
        switch self {
        case .classicGuest:
            return "-Access all rides"
        case .vipGuest:
            return "-Access all rides -Skip all ride lines"
        case .freeChildGuest:
            return "-Access all rides"
        case .foodServicesEmployee:
            return "-Access all rides"
        case .rideServicesEmployee:
            return "-Access all rides"
        case .maintenanceEmployee:
            return "-Access all rides"
        case .manager:
            return "-Access all rides"
        }
    }
    
    //Check Area Access for each entrant type
    func areaAccess() -> String {
        switch self {
        case .classicGuest:
            return "Amusement Areas"
        case .vipGuest:
            return "Amusement Areas"
        case .freeChildGuest:
            return "Amusement Areas"
        case .foodServicesEmployee:
            return "-Amusement Areas -Kitchen Areas"
        case .rideServicesEmployee:
            return "-Amusement Areas -Ride Control Areas"
        case .maintenanceEmployee:
            return "-Amusement Areas -Kitchen Areas -Ride Control Areas -Maintenance Areas"
        case .manager:
            return "-Amusement Areas -Kitchen Areas -Ride Control Areas -Maintenance Areas -Office Areas"
        }
    }
    
    //Check Food  discounts for each entrant type
    func foodDiscount() -> Int {
        switch self {
        case .classicGuest:
            return 0
        case .vipGuest:
            return 10
        case .freeChildGuest:
            return 0
        case .foodServicesEmployee:
            return 15
        case .rideServicesEmployee:
            return 15
        case .maintenanceEmployee:
            return 15
        case .manager:
            return 25
        }
    }
    
    //Check merchandise discounts for each entrant type
    func merchandiseDiscount() -> Int {
        switch self {
        case .classicGuest:
            return 0
        case .vipGuest:
            return 20
        case .freeChildGuest:
            return 0
        case .foodServicesEmployee:
            return 25
        case .rideServicesEmployee:
            return 25
        case .maintenanceEmployee:
            return 25
        case .manager:
            return 25
        }
    }
}


// Swipe Park Pass This can return any property from the ParkPass Class
func swipePass(parkPass: ParkPass) -> String {
    
    return " \(parkPass.firstName):\n Area Access: \(parkPass.passType.areaAccess())\n RideAccess: \(parkPass.passType.rideAccess())\n FoodDiscount: \(parkPass.passType.foodDiscount())\n Merchandise Discount: \(parkPass.passType.merchandiseDiscount())\n"
}
