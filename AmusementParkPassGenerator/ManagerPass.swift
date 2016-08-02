//
//  ManagerPass.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/26/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation

enum mangementTier {
    case ShiftMgr
    case GeneralMgr
    case SeniorMgr
}

//Base Manger Class
class Manager: ParkPass {
    
    var personalInfo: PersonalInformation
    var mgrTier: mangementTier
    
    init(type: entrantType, personalInfo: PersonalInformation, mgrTier: mangementTier) {
        
        self.personalInfo = personalInfo
        self.mgrTier = mgrTier
        
        super.init(type: type)
    }
    
}

class ShiftManager: Manager {
    
}


class GeneralManager: Manager {
    
}

class SeniorManager: Manager {
    
}

func validateManager(pass: Manager) throws {
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


