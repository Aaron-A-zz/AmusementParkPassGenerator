//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Aaron on 6/6/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Menu buttons
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var contractorButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    
    //Menu Text Fields
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var sSN: UITextField!
    @IBOutlet weak var projectNumber: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
  
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
    
    
    //This is where the magic happens for the buttons
    @IBAction func mainButtonPressed(sender: AnyObject) {
        switch sender.tag {
        
        case 1:
            buttonOne.hidden = false
            buttonTwo.hidden = false
            buttonThree.hidden = false
            buttonFour.hidden = false
            buttonFive.hidden = false
            buttonOne.setTitle("Child", forState: .Normal)
            buttonTwo.setTitle("Classic", forState: .Normal)
            buttonThree.setTitle("Senior", forState: .Normal)
            buttonFour.setTitle("VIP", forState: .Normal)
            buttonFive.setTitle("Season Pass", forState: .Normal)
            
        case 2:
            buttonOne.hidden = false
            buttonTwo.hidden = false
            buttonThree.hidden = false
            buttonOne.setTitle("Food Service", forState: .Normal)
            buttonTwo.setTitle("Ride Service", forState: .Normal)
            buttonThree.setTitle("Maintenance", forState: .Normal)
            buttonFour.hidden = true
            buttonFive.hidden = true
        
        case 3:
            buttonOne.hidden = false
            buttonTwo.hidden = false
            buttonThree.hidden = false
            buttonOne.setTitle("Senior", forState: .Normal)
            buttonTwo.setTitle("General", forState: .Normal)
            buttonThree.setTitle("Shift", forState: .Normal)
            buttonFour.hidden = true
            buttonFive.hidden = true
            
        case 4:
            buttonOne.hidden = false
            buttonTwo.hidden = false
            buttonThree.hidden = false
            buttonFour.hidden = false
            buttonFive.hidden = false
            buttonOne.setTitle("1001", forState: .Normal)
            buttonTwo.setTitle("1002", forState: .Normal)
            buttonThree.setTitle("1003", forState: .Normal)
            buttonFour.setTitle("2001", forState: .Normal)
            buttonFive.setTitle("2002", forState: .Normal)
            
        case 5:
            buttonOne.hidden = false
            buttonTwo.hidden = false
            buttonThree.hidden = false
            buttonFour.hidden = false
            buttonOne.setTitle("Acme", forState: .Normal)
            buttonTwo.setTitle("Orkin", forState: .Normal)
            buttonThree.setTitle("Fedex", forState: .Normal)
            buttonFour.setTitle("NW Electrical", forState: .Normal)
            buttonFive.hidden = true
        default: break
            
        }
    }
    
    
    @IBAction func secondaryButtonPressed(sender: UIButton) {
        
        switch sender.currentTitle! {
            
            // Guest Menu
        case "Child":
            freeChildGuestSettings()
        case "Classic":
            classicGuestSettings()
        case "Senior":
            seniorGuestSettings()
        case "VIP":
            vipGuestSettings()
        case "Season Pass":
            seasonPassSettings()
            
            //Employee Menu
        case "Food Service":
            employeeSettings()
        case "Ride Service":
            employeeSettings()
        case "Maintenance":
            employeeSettings()
            
            //Manager Menu
        case "Senior":
            print("")
        case "General":
            print("")
        case "Shift":
            print("")
         
            //Contractor Menu
        case "1001":
            contactEmployeeSettings()
        case "1002":
            contactEmployeeSettings()
        case "1003":
            contactEmployeeSettings()
        case "2001":
            contactEmployeeSettings()
        case "2002":
            contactEmployeeSettings()
            
            //Vendor
        case "Acme":
            print("")
        case "Orkin":
            print("")
        case "Fedex":
            print("")
        case "NW Electrical":
            print("")
        default: break
        
        }
    }
    
    func classicGuestSettings() {
        
        dateOfBirth.backgroundColor = UIColor.clearColor()
        dateOfBirth.enabled = false
        
        sSN.backgroundColor = UIColor.clearColor()
        sSN.enabled = false
        
        projectNumber.backgroundColor = UIColor.clearColor()
        projectNumber.enabled = false
        
        firstName.backgroundColor = UIColor.clearColor()
        firstName.enabled = false
        
        lastName.backgroundColor = UIColor.clearColor()
        lastName.enabled = false
        
        companyName.backgroundColor = UIColor.clearColor()
        companyName.enabled = false
        
        streetAddress.backgroundColor = UIColor.clearColor()
        streetAddress.enabled = false
        
        city.backgroundColor = UIColor.clearColor()
        city.enabled = false
        
        state.backgroundColor = UIColor.clearColor()
        state.enabled = false
        
        zipCode.backgroundColor = UIColor.clearColor()
        zipCode.enabled = false
        
    }
    
    func vipGuestSettings() {
        
        dateOfBirth.backgroundColor = UIColor.clearColor()
        dateOfBirth.enabled = false
        
        sSN.backgroundColor = UIColor.clearColor()
        sSN.enabled = false
        
        projectNumber.backgroundColor = UIColor.clearColor()
        projectNumber.enabled = false
        
        firstName.backgroundColor = UIColor.clearColor()
        firstName.enabled = false
        
        lastName.backgroundColor = UIColor.clearColor()
        lastName.enabled = false
        
        companyName.backgroundColor = UIColor.clearColor()
        companyName.enabled = false
        
        streetAddress.backgroundColor = UIColor.clearColor()
        streetAddress.enabled = false
        
        city.backgroundColor = UIColor.clearColor()
        city.enabled = false
        
        state.backgroundColor = UIColor.clearColor()
        state.enabled = false
        
        zipCode.backgroundColor = UIColor.clearColor()
        zipCode.enabled = false
        
    }
    
    func freeChildGuestSettings() {
        
        dateOfBirth.backgroundColor = UIColor.whiteColor()
        dateOfBirth.enabled = true
        
        sSN.backgroundColor = UIColor.clearColor()
        sSN.enabled = false
        
        projectNumber.backgroundColor = UIColor.clearColor()
        projectNumber.enabled = false
        
        firstName.backgroundColor = UIColor.clearColor()
        firstName.enabled = false
        
        lastName.backgroundColor = UIColor.clearColor()
        lastName.enabled = false
        
        companyName.backgroundColor = UIColor.clearColor()
        companyName.enabled = false
        
        streetAddress.backgroundColor = UIColor.clearColor()
        streetAddress.enabled = false
        
        city.backgroundColor = UIColor.clearColor()
        city.enabled = false
        
        state.backgroundColor = UIColor.clearColor()
        state.enabled = false
        
        zipCode.backgroundColor = UIColor.clearColor()
        zipCode.enabled = false
        
    }
    
    func seniorGuestSettings() {
        
        dateOfBirth.backgroundColor = UIColor.whiteColor()
        dateOfBirth.enabled = true
        
        sSN.backgroundColor = UIColor.clearColor()
        sSN.enabled = false
        
        projectNumber.backgroundColor = UIColor.clearColor()
        projectNumber.enabled = false
        
        firstName.backgroundColor = UIColor.whiteColor()
        firstName.enabled = true
        
        lastName.backgroundColor = UIColor.whiteColor()
        lastName.enabled = true
        
        companyName.backgroundColor = UIColor.clearColor()
        companyName.enabled = false
        
        streetAddress.backgroundColor = UIColor.clearColor()
        streetAddress.enabled = false
        
        city.backgroundColor = UIColor.clearColor()
        city.enabled = false
        
        state.backgroundColor = UIColor.clearColor()
        state.enabled = false
        
        zipCode.backgroundColor = UIColor.clearColor()
        zipCode.enabled = false
        
    }
    
    func seasonPassSettings() {
        
        dateOfBirth.backgroundColor = UIColor.clearColor()
        dateOfBirth.enabled = false
        
        sSN.backgroundColor = UIColor.clearColor()
        sSN.enabled = false
        
        projectNumber.backgroundColor = UIColor.clearColor()
        projectNumber.enabled = false
        
        firstName.backgroundColor = UIColor.whiteColor()
        firstName.enabled = true
        
        lastName.backgroundColor = UIColor.whiteColor()
        lastName.enabled = true
        
        companyName.backgroundColor = UIColor.clearColor()
        companyName.enabled = false
        
        streetAddress.backgroundColor = UIColor.whiteColor()
        streetAddress.enabled = true
        
        city.backgroundColor = UIColor.whiteColor()
        city.enabled = true
        
        state.backgroundColor = UIColor.whiteColor()
        state.enabled = true
        
        zipCode.backgroundColor = UIColor.whiteColor()
        zipCode.enabled = true
        
    }
    
    func employeeSettings() {
        
        dateOfBirth.backgroundColor = UIColor.whiteColor()
        dateOfBirth.enabled = true
        
        sSN.backgroundColor = UIColor.whiteColor()
        sSN.enabled = true
        
        projectNumber.backgroundColor = UIColor.clearColor()
        projectNumber.enabled = false
        
        firstName.backgroundColor = UIColor.whiteColor()
        firstName.enabled = true
        
        lastName.backgroundColor = UIColor.whiteColor()
        lastName.enabled = true
        
        companyName.backgroundColor = UIColor.clearColor()
        companyName.enabled = false
        
        streetAddress.backgroundColor = UIColor.whiteColor()
        streetAddress.enabled = true
        
        city.backgroundColor = UIColor.whiteColor()
        city.enabled = true
        
        state.backgroundColor = UIColor.whiteColor()
        state.enabled = true
        
        zipCode.backgroundColor = UIColor.whiteColor()
        zipCode.enabled = true
    }
    
    
    
    func contactEmployeeSettings() {
        
        dateOfBirth.backgroundColor = UIColor.whiteColor()
        dateOfBirth.enabled = true
        
        sSN.backgroundColor = UIColor.whiteColor()
        sSN.enabled = true
        
        projectNumber.backgroundColor = UIColor.whiteColor()
        projectNumber.enabled = true
        
        firstName.backgroundColor = UIColor.whiteColor()
        firstName.enabled = true
        
        lastName.backgroundColor = UIColor.whiteColor()
        lastName.enabled = true
        
        companyName.backgroundColor = UIColor.whiteColor()
        companyName.enabled = true
        
        streetAddress.backgroundColor = UIColor.whiteColor()
        streetAddress.enabled = true
        
        city.backgroundColor = UIColor.whiteColor()
        city.enabled = true
        
        state.backgroundColor = UIColor.whiteColor()
        state.enabled = true
        
        zipCode.backgroundColor = UIColor.whiteColor()
        zipCode.enabled = true
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

