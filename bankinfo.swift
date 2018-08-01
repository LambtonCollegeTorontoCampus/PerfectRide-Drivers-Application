//
//  bankinfo.swift
//  PerfectRide
//
//  Created by Suma Priya on 2018-05-23.
//  Copyright © 2018 Suma Priya. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import RealmSwift

internal class bankinfo : UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func save(_ sender: Any) {
        grabdata();
    }
   
    @IBOutlet var Accountno: UITextField!
    @IBOutlet var identificationno: UITextField!
    @IBOutlet var branchnumber: UITextField!
    func grabdata(){
        
        var databaseRef = Database.database().reference()
        let data = ["branchnumber": branchnumber.text!,"identificationno": identificationno.text!,"Accountno": Accountno.text] as [String : Any];
        databaseRef.child("bankinfo").child(branchnumber.text!).setValue(data)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
}
}
