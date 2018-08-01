//
//  driverdetails.swift
//  PerfectRide
//
//  Created by Suma Priya on 2018-05-23.
//  Copyright © 2018 Suma Priya. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import RealmSwift
 
class driverdetails : UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func save(_ sender: Any) {
        grabdata();
    }
    
    @IBOutlet var expiry: UITextField!
    @IBOutlet var driverlicenseno: UITextField!
    func grabdata(){
        
        var databaseRef = Database.database().reference()
        let data = ["driverslicenseno": driverlicenseno.text!,"expiry": expiry.text!];
        databaseRef.child("driverdetails").child(driverlicenseno.text!).setValue(data)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
