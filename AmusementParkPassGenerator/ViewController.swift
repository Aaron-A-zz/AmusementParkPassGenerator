//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/6/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        let classicGuest = Guestclassic(firstName: "Lance", lastName: "A")
        print(swipePass(classicGuest))
        
        let vipGuest = GuestVIP(firstName: "Aaron", lastName: "A")
        print(swipePass(vipGuest))
        
        let guestFreeChild = GuestFreeChild(firstName: "Mike", lastName: "D", dob: "7/25/2010")
        print(swipePass(guestFreeChild))
        print(guestFreeChild.dob.convertToDateTime())
        
        let foodServicesEmployee = FoodServicesEmployee(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 20132, dob: "", ssn: "")
        print(swipePass(foodServicesEmployee))
        
        let rideServicesEmployee = RideServicesEmployee(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 20132, dob: "8/19/2985", ssn: "")
        print(swipePass(rideServicesEmployee))
        
        let maintenanceEmployee = MaintenanceServicesEmployee(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 20144, dob: "1/26/1980", ssn: "")
        print(swipePass(maintenanceEmployee))
        
        let manager = Manager(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 20211, dob: "", ssn: "", managementTier: .ShiftMgr)
        print(swipePass(manager))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

