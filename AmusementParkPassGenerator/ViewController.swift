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
        
        let aaron = Guestclassic(firstName: "Aaron", lastName: "Ackerman")
        print(aaron.passType)
        print(swipePass(aaron))
        
        
        let lance = GuestFreeChild(firstName: "Lance", lastName: "Ackerman", dob: "Jul 25 1983")
        print(" Lance: \(lance.passType)")
        print(lance.dob.convertToDateTime())
        let age = lance.dob.convertToDateTime()
        print(age.age)
        print(swipePass(lance))
        
        
        let marieta = Manager(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 20132, dob: "", ssn: "", managementTier: .SeniorMgr )
        
        print(swipePass(marieta))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

