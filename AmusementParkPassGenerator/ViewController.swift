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
        
    
        let classicGuest = Guestclassic(firstName: "A", lastName: "Ac", passType: .classicGuest)
        print(swipePass(classicGuest))
        
        let vipGuest = GuestVIP(firstName: "Agenda", lastName: "Ack", passType: .vipGuest)
        print(swipePass(vipGuest))
        
        let guestFreeChild = GuestFreeChild(firstName: "Eric", lastName: "K", passType: .freeChildGuest, dob: "7/25/2009")
        print(swipePass(guestFreeChild))
        print(guestFreeChild.dob!.convertToDateTime().age)
        
        
        let foodServicesEmployee = ServicesEmployee(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 20132, passType: .foodServicesEmployee, dob: "", ssn: "")
        print(swipePass(foodServicesEmployee))
        
        let rideServicesEmployee = ServicesEmployee(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 20132, passType: .rideServicesEmployee, dob: "", ssn: "")
        print(swipePass(rideServicesEmployee))
        
        let maintenanceEmployee = ServicesEmployee(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 20132, passType: .maintenanceEmployee, dob: "", ssn: "")
        print(swipePass(maintenanceEmployee))
        
        let manager = Manager(firstName: "Reda", lastName: "J", streetAddress: "123 Street", city: "NY", state: "NY", zipCode: 20211, passType: .manager, dob: "2/4/1970", ssn: "111-11-1111", managementTier: .ShiftMgr)
        print(swipePass(manager))
        
        validatePass(guestFreeChild)
        
        do {
            try validateFirstAndLastNames(classicGuest)
        } catch error.MissingFirstName {
            print(error.MissingFirstName)
        } catch error.MissingLastName {
            print(error.MissingLastName)
        } catch {
            
        }
        
    }
    
    func checkAge(age: Int) throws -> String {
        guard age <= 5 else {
            throw error.ExceededAgeLimit
        }
        return "Welcome"
    }
    
    func validatePass(parkPass: ParkPass) {
        
        if parkPass.passType == .freeChildGuest {
            do  {
                print(parkPass.dob)
                if parkPass.dob != nil {
                try checkAge(parkPass.dob!.convertToDateTime().age)
                      }
            } catch error.ExceededAgeLimit {
                print("\(parkPass.firstName) is \(error.ExceededAgeLimit)")
            } catch {
                print("something else happend")
            }
        }
    }
    
    func validateFirstAndLastNames(parkPass: ParkPass) throws {
        if parkPass.firstName == ""  {
            throw error.MissingFirstName
        } else if parkPass.lastName == "" {
            throw error.MissingLastName
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

