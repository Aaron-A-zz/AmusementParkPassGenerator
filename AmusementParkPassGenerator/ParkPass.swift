//
//  ParkPass.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/10/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation

enum error: ErrorType {
    case missingFirstName
    case missingLastName
    case exceededAgeLimit
    case missingCity
    case missingState
    case missingZipCode
    case missingDOB
    case missingSSN
}

enum entrantType: Equatable {
    case classicGuest
    case vipGuest
    case freeChildGuest
    case foodServicesEmployee
    case rideServicesEmployee
    case maintenanceEmployee
    case manager
}


//Base Class
class ParkPass {
    
    var type: entrantType
    
    init(type: entrantType) {
        self.type = type
    }
    
    func swipPass() -> String {
        
        return "Access: \(self.areaAccess())\nRide Access: \(self.rideAccess())\nDiscounts: \(self.discountAccess())"
    }
    
    func areaAccess() -> String {
        switch self.type {
        case .classicGuest:
            return "Amusement Areas"
        case .vipGuest:
            return "Amusement Areas"
        case .freeChildGuest:
            return "Amusement Areas"
        case .foodServicesEmployee:
            return "Amusement Areas Kitchen Areas"
        case .rideServicesEmployee:
            return "Amusement Areas Ride Control Areas"
        case .maintenanceEmployee:
            return "Amusement Areas Kitchen Areas Ride Control Areas Maintenance Areas"
        case .manager:
            return "Amusement Areas, Kitchen Areas, Ride Control Areas, Maintenance Areas, Office Areas"
        }
    }
    
    func rideAccess() -> String {
        switch self.type {
        case .classicGuest:
            return "Access all rides"
        case .vipGuest:
            return "Access all rides, Skip all ride lines"
        case .freeChildGuest:
            return "Access all rides"
        case .foodServicesEmployee:
            return "Access all rides"
        case .rideServicesEmployee:
            return "Access all rides"
        case .maintenanceEmployee:
            return "Access all rides"
        case .manager:
            return "Access all rides"
        }
    }
    
    func discountAccess() -> String {
        switch self.type {
        case .classicGuest:
            return "None"
        case .vipGuest:
            return "10% discount on food, 20% discount on merchandise"
        case .freeChildGuest:
            return  "None"
        case .foodServicesEmployee:
            return "15% discount on food, 25% discount on merchandise"
        case .rideServicesEmployee:
            return "15% discount on food, 25% discount on merchandise"
        case .maintenanceEmployee:
            return "15% discount on food, 25% discount on merchandise"
        case .manager:
            return "25% discount on food, 25% discount on merchandise"
        }
    }
}
