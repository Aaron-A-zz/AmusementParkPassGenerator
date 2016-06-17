//
//  ParkPass.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/10/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation


// Basic ParkPass
class ParkPass: passType {
    var firstName: String
    var lastName: String
    var passType: entrantType
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    var ssn: String?
    var dob: String?
    var managementTier: mangementTier?
    
    init(firstName: String, lastName: String, passType: entrantType) {
        self.firstName = firstName
        self.lastName = lastName
        self.passType = passType
    }
}

//Guest Classic
class Guestclassic: ParkPass {
    
}

//Guest VIP
class GuestVIP: ParkPass {
    
}

//Guest Free Child
class GuestFreeChild: ParkPass {
    
    init(firstName: String, lastName: String, passType: entrantType, dob: String) {
        super.init(firstName: firstName, lastName: lastName, passType: passType)
        self.dob = dob
    }
}

//Food Services Employee
class ServicesEmployee: ParkPass {
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, passType: entrantType, dob: String, ssn: String) {
        super.init(firstName: firstName, lastName: lastName, passType: passType)
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dob = dob
        self.ssn = ssn
    }
}

//Manager 
class Manager: ParkPass {
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, passType: entrantType, dob: String, ssn: String, managementTier: mangementTier) {
        super.init(firstName: firstName, lastName: lastName, passType: passType)
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dob = dob
        self.ssn = ssn
        self.managementTier = managementTier
    }

}

