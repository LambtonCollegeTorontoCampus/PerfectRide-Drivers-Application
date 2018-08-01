//
//  carDetails.swift
//  PerfectRide
//
//  Created by Suma Priya on 2018-05-23.
//  Copyright © 2018 Suma Priya. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import RealmSwift


class carDetails : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var label: UILabel!
    let years = ["2012","2013","2014","2015","2016","2017","2018"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return years[row]
    }
    func pickerView(_ _pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return years.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        label.text = years[row]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
      
    @IBAction func Save(_ sender: Any) {
        grabdata();
    }
    
    @IBOutlet var Model: UITextField!
    @IBOutlet var Make: UITextField!
    
    func grabdata(){
        
        var databaseRef = Database.database().reference()
        let data = ["Model": Model.text!,"Make": Make.text!];
        databaseRef.child("carDetails").child(Make.text!).setValue(data)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}


