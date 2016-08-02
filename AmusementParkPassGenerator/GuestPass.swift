//
//  GuestPass.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/26/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation


class ClassicGuest: ParkPass {
    
}

class VIPGuest: ParkPass {
    
}

class FreeChildGuest: ParkPass {
    var dob: String
    init(type: entrantType, dob: String) {
        self.dob = dob
        super.init(type: type)
    }
    
    override func swipPass() -> String {
        return "Access: \(self.areaAccess())\nRide Access: \(self.rideAccess())\nDiscounts: \(self.discountAccess())\nDOB:\(self.dob)"
    }
}

func validateFreeChildGuest(pass: FreeChildGuest) throws {
    guard pass.dob != "" else {
        throw error.missingDOB
    }
    
    do {
        try checkAge(pass.dob.convertToDateTime().age)
    }
}

// Checks to make sure that the age is less than or equal to 5. Which will be used to verify freeChildGuest pass.
func checkAge(age: Int) throws {
    guard age <= 5 else {
        throw error.exceededAgeLimit
    }
}

