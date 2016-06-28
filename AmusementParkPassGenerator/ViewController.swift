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
        
        
        //Guest Passes
        let guestClassic = ClassicGuest(type: .classicGuest) //***No validation required at this time***.
        print("Classic Guest Pass: \(guestClassic.swipPass())\n")
        
        let guestVIP = VIPGuest(type: .vipGuest) // ***No validation required at this time***.
        print("VIP Guest Pass: \(guestVIP.swipPass())\n")
        
        let childGuestFree = FreeChildGuest(type: .freeChildGuest, dob: "4/12/2013") // replace date with -> 4/12/2013 || 5/24/1980
        print("Free Child Guest Pass: \(childGuestFree.swipPass())\n")
        
        //Employee Passes
        let foodServicesEmployee = FoodServicesEmployee(type: .foodServicesEmployee, personalInfo: PersonalInformation(firstName: "Wieland", lastName: "Wido", city: "NY", state: "NY", zipCode: "20132", ssn: "123-12-1234", dob: "7/12/1980"))
        print("Food Service Employee: \(foodServicesEmployee.swipPass())\n")
        
        //RideServicesEmployee
        let rideServicesEmployee = RideServicesEmployee(type: .rideServicesEmployee, personalInfo: PersonalInformation(firstName: "Abijah", lastName: "Cephas", city: "NY", state: "NY", zipCode: "20132", ssn: "123-12-1234", dob: "5/12/2000"))
        print("Ride Services Employee: \(rideServicesEmployee.swipPass())\n")
        
        
        //Shift Manager
        let managerShift = ShiftManager(type: .manager, personalInfo: PersonalInformation(firstName: "Timothy", lastName: "Hirah", city: "NY", state: "NY", zipCode: "20132", ssn: "123-12-1234", dob: "5/12/2000"), mgrTier: .ShiftMgr)
        print("Shift Manager: \(managerShift.swipPass())\n")
        
        //General Manager
        let managerGen = GeneralManager(type: .manager, personalInfo: PersonalInformation(firstName: "Samual", lastName: "Iohel", city: "", state: "NY", zipCode: "123456", ssn: "123-12-1234", dob: "1/1/2000"), mgrTier: .GeneralMgr)
        print("Shift Manager: \(managerGen.swipPass())\n")
        
        //Senior Manager
        let managerSenior = SeniorManager(type: .manager, personalInfo: PersonalInformation(firstName: "Felix", lastName: "", city: "NY", state: "", zipCode: "20132", ssn: "123-12-1234", dob: "3/3/1995"), mgrTier: .SeniorMgr)
        print("Shift Manager: \(managerSenior.swipPass())\n")
        
        
        /*
         Hi, <Your NAME> Thanks for taking the time to review my code. Above you will find a list of Entrant Types. To test each of them replace the entrant type in the validate method below.
         
         To test out the different error messages simply delete the filed you would like to test for the given entrant type.
         
         */
        
        
        //Validate Free Child Guest Pass
        do {
            try validateFreeChildGuest(childGuestFree)   // <---- replace FreeChildGuest with any entrant type of your choice. :)  for errors uncomment the code above or simple deleted one of the properties.
        } catch error.missingDOB {
              print(error.missingDOB)
        } catch error.exceededAgeLimit {
            print(error.exceededAgeLimit)
        } catch {
            print("unknown error")
        }
        
        
        //Validate Employee Passes
        do {
            try validateEmployee(foodServicesEmployee) // <---- replace Employee with any entrant type of your choice. :)  for errors uncomment the code above or simple deleted one of the properties.
        } catch error.missingFirstName {
            print(error.missingFirstName)
        } catch error.missingLastName {
            print(error.missingLastName)
        }   catch error.missingCity {
            print(error.missingCity)
        }  catch error.missingState {
            print(error.missingState)
        } catch error.missingZipCode {
            print(error.missingZipCode)
        } catch error.missingSSN {
            print(error.missingSSN)
        } catch error.missingDOB {
            print(error.missingDOB)
        } catch {
            print("unknown error")
        }
        
        //Validate Manager Passes
        
        do {
            try validateManager(managerShift)  // <---- replace Managers with any entrant type of your choice. :)  for errors uncomment the code above or simple deleted one of the properties.
        } catch error.missingFirstName {
            print(error.missingFirstName)
        } catch error.missingLastName {
            print(error.missingLastName)
        }   catch error.missingCity {
            print(error.missingCity)
        }  catch error.missingState {
            print(error.missingState)
        } catch error.missingZipCode {
            print(error.missingZipCode)
        } catch error.missingSSN {
            print(error.missingSSN)
        } catch error.missingDOB {
            print(error.missingDOB)
        } catch {
            print("unknown error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

