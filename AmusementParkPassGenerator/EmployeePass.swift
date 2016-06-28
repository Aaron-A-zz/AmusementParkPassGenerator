//
//  EmployeePass.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/26/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation

struct PersonalInformation {
    var firstName = ""
    var lastName = ""
    var city = ""
    var state = ""
    var zipCode = ""
    var ssn = ""
    var dob = ""
}


class Employee: ParkPass {
    
    var personalInfo: PersonalInformation
    init(type: entrantType, personalInfo: PersonalInformation) {
        self.personalInfo = personalInfo
        super.init(type: type)
    }
}

class FoodServicesEmployee: Employee {
    
}

class RideServicesEmployee: Employee {
    
}

class MaintenanceEmployee: Employee {

}

func validateEmployee(pass: Employee) throws {
    guard pass.personalInfo.firstName != "" else {
        throw error.missingFirstName
    }
    
    guard pass.personalInfo.lastName != "" else {
        throw error.missingLastName
    }
    
    guard pass.personalInfo.city != "" else {
        throw error.missingCity
    }
    
    guard pass.personalInfo.state != "" else {
        throw error.missingState
    }
    
    guard pass.personalInfo.zipCode != "" else {
        throw error.missingZipCode
    }
    
    guard pass.personalInfo.ssn != "" else {
        throw error.missingSSN
    }
    
    guard pass.personalInfo.dob != "" else {
        throw error.missingDOB
    }

}
