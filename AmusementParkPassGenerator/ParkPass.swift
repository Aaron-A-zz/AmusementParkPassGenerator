//
//  ParkPass.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/10/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation


// Basic ParkPass
class ParkPass: name, passType {
    var firstName: String
    var lastName: String
    var passType: entrantType
    
    init(firstName: String, lastName: String, passType: entrantType) {
        self.firstName = firstName
        self.lastName = lastName
        self.passType = passType
    }
}

//Guest Classic
class Guestclassic: ParkPass {
    
    convenience init(firstName: String, lastName: String) {
        self.init(firstName: firstName, lastName: lastName, passType: .classicGuest )
    }
}

//Guest VIP
class GuestVIP: ParkPass {
    
    convenience init(firstName: String, lastName: String) {
        self.init(firstName: firstName, lastName: lastName, passType: .vipGuest )
    }
}

//Guest Free Child
class GuestFreeChild: ParkPass, dateOfBirth {
    
    var dob: String
    
    init(firstName: String, lastName: String, passType: entrantType, dob: String) {
        self.dob = dob
        super.init(firstName: firstName, lastName: lastName, passType: passType)
    }
    
    convenience init(firstName: String, lastName: String, dob: String) {
        self.init(firstName: firstName, lastName: lastName, passType: .freeChildGuest, dob: dob)
    }
}

//Food Services Employee
class FoodServicesEmployee: ParkPass, address, dateOfBirth, ssn {
    
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var dob: String
    var ssn: String
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, passType: entrantType, dob: String, ssn: String) {
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dob = dob
        self.ssn = ssn
        super.init(firstName: firstName, lastName: lastName, passType: passType)
    }
    
    convenience init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, dob: String, ssn: String) {
        self.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, passType: .foodServicesEmployee, dob: dob, ssn: ssn)
    }
}

//Ride Services Employee
class RideServicesEmployee: ParkPass, address, dateOfBirth, ssn {
    
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var dob: String
    var ssn: String
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, passType: entrantType, dob: String, ssn: String) {
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dob = dob
        self.ssn = ssn
        super.init(firstName: firstName, lastName: lastName, passType: passType)
    }
    
    convenience init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, dob: String, ssn: String) {
        self.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, passType: .rideServicesEmployee, dob: dob, ssn: ssn)
    }
}

//Maintenance Employee
class MaintenanceServicesEmployee: ParkPass, address, dateOfBirth, ssn {
    
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var dob: String
    var ssn: String
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, passType: entrantType, dob: String, ssn: String) {
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dob = dob
        self.ssn = ssn
        super.init(firstName: firstName, lastName: lastName, passType: passType)
    }
    
    convenience init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, dob: String, ssn: String) {
        self.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, passType: .maintenanceEmployee, dob: dob, ssn: ssn)
    }
}


//Manager 
class Manager: ParkPass, address, dateOfBirth, ssn, mgrTier {
    
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var dob: String
    var ssn: String
    var managementTier: mangementTier
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, passType: entrantType, dob: String, ssn: String, managementTier: mangementTier) {
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dob = dob
        self.ssn = ssn
        self.managementTier = managementTier
        super.init(firstName: firstName, lastName: lastName, passType: passType)
    }
    
    convenience init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, dob: String, ssn: String, managementTier: mangementTier) {
        self.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, passType: .manager, dob: dob, ssn: ssn, managementTier: managementTier )
    }
}

