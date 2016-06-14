//
//  Protocols.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/10/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import Foundation

protocol name {
    var firstName: String { get }
    var lastName: String { get }
}

protocol address {
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
}

protocol ssn {
    var ssn: String { get }
}

protocol dateOfBirth {
    var dob: String { get }
}

protocol mgrTier {
    var managementTier: mangementTier { get }
}

protocol passType {
    var passType: entrantType { get }
}
