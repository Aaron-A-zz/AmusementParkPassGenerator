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
        
        let classicGuest = Guestclassic(firstName: "Wieland", lastName: "Wido", passType: .classicGuest)
        print(swipePass(classicGuest))
        
        let vipGuest = GuestVIP(firstName: "Manahem", lastName: "Baruch", passType: .vipGuest)
        print(swipePass(vipGuest))
        
        let guestFreeChild = GuestFreeChild(firstName: "Samual", lastName: "Iohel", passType: .freeChildGuest, dob: "6/2/1983")
        print(swipePass(guestFreeChild))
        //print(guestFreeChild.dob!.convertToDateTime().age)
        
        let foodServicesEmployee = ServicesEmployee(firstName: "Melech", lastName: "Hirah", streetAddress: "123 Street", city: "NY", state: "NY", zipCode: 20132, passType: .foodServicesEmployee, dob: "6/2/2005", ssn: "123-45-6789")
        print(swipePass(foodServicesEmployee))
        
        let rideServicesEmployee = ServicesEmployee(firstName: "Felix", lastName: "Thomas", streetAddress: "123 Street", city: "NY", state: "NY", zipCode: 20132, passType: .rideServicesEmployee, dob: "8/4/1985", ssn: "123-45-6789")
        print(swipePass(rideServicesEmployee))
        
        let maintenanceEmployee = ServicesEmployee(firstName: "Timothy", lastName: "Swithun", streetAddress: "123 Street", city: "NY", state: "NY", zipCode: 20132, passType: .maintenanceEmployee, dob: "4/12/1998", ssn: "123-45-6789")
        print(swipePass(maintenanceEmployee))
        
        let manager = Manager(firstName: "Cephas", lastName: "Abijah", streetAddress: "123 Street", city: "NY", state: "NY", zipCode: 20211, passType: .manager, dob: "2/4/1970", ssn: "111-11-1111", managementTier: .ShiftMgr)
        print(swipePass(manager))
        
        
        /*
             Hi, <Your NAME> Thanks for taking the time to review my code. Above you will find a list of Entrant Types. To test each of them replace the entrant type in the validate method below. 
                
            To test out the different error messages simply delete the filed you would like to test for the given entrant type.
         
         */
        
        do  {
          try  validatePass(manager)  // <---- replace manger with any entrant type of your choice. :) and remove any properties to test for errors. 
            
        } catch error.MissingFirstName {
            print(error.MissingFirstName)
        } catch error.MissingLastName {
            print(error.MissingLastName)
        } catch error.MissingDOB {
            print(error.MissingDOB)
        } catch error.ExceededAgeLimit{
            print(error.ExceededAgeLimit)
        } catch error.AddressIncomplete {
            print(error.AddressIncomplete)
        } catch error.MissingSSN {
            print(error.MissingSSN)
        } catch {
            print("unknown error")
        }
        
    }
    
    
    // This function checking to make sure that all fields are propertly filled out properly for each entrant type.
    func validatePass(parkPass: ParkPass) throws {
        
        guard parkPass.firstName != "" else {
            throw error.MissingFirstName
        }
        
        guard parkPass.lastName != "" else {
            throw error.MissingLastName
        }
        
        if parkPass.passType == entrantType.freeChildGuest{
            
            guard parkPass.dob != "" else {
                throw error.MissingDOB
            }
            
            do {
                try checkAge(parkPass.dob!.convertToDateTime().age)
            }
        
        } else if parkPass.passType == entrantType.foodServicesEmployee || parkPass.passType == entrantType.rideServicesEmployee || parkPass.passType == entrantType.maintenanceEmployee || parkPass.passType == entrantType.manager {
            
            guard parkPass.streetAddress != "" && parkPass.city != "" && parkPass.state != "" && parkPass.zipCode != nil  else {
                throw error.AddressIncomplete
            }
            
            guard parkPass.dob != "" else {
                throw error.MissingDOB
            }
            
            guard parkPass.ssn != "" else {
                throw error.MissingSSN
            }
        }
        
    }
    
    // Checks to make sure that the age is less than or equal to 5. Which will be used to verify freeChildGuest pass.
    func checkAge(age: Int) throws {
        guard age <= 5 else {
            throw error.ExceededAgeLimit
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

