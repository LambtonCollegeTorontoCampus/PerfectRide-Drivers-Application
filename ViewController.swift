//
//  ViewController.swift
//  PerfectRide
//
//  Created by Suma Priya on 2018-05-23.
//  Copyright © 2018 Suma Priya. All rights reserved.
//

import UIKit
import FirebaseDatabase
import RealmSwift
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mapview: MKMapView!
    let  locationManager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
    let location = locations[0]
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01,0.01)
        let userLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(userLocation,span)
        mapview.setRegion(region, animated: true)
        self.mapview.showsUserLocation = true
    }
    override func viewDidLoad() {
        grabdata()
        super.viewDidLoad()
        view.backgroundColor=UIColor.red;
        //location.isHidden=true;
        switchcolor.isOn=false;
        imgview.isHidden=true;
        profile.isHidden=true;
        bankinfo.isHidden=true;
        driverinfo.isHidden=true;
        cardetails.isHidden=true;
        mapview.isHidden = true;
        // Do any additional setup after loading the view, typically from a nib.
       
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func grabdata(){
       
        var databaseRef = Database.database().reference()
        //
        databaseRef.child("profile").observe(.value, with:{
            snapshot in
            print(snapshot)
            
            for snap in snapshot.children.allObjects as! [DataSnapshot]{
                guard let dictionary = snap.value as? [String : AnyObject] else {
                    return
                }
            }
        })
        //
        
        databaseRef.child("bankinfo").observe(.value, with:{
            snapshot in
            print(snapshot)
            
            for snap in snapshot.children.allObjects as! [DataSnapshot]{
                guard let dictionary = snap.value as? [String : AnyObject] else {
                    return
                }
            }
        })
        //
        databaseRef.child("carDetails").observe(.value, with:{
            snapshot in
            print(snapshot)
            
            for snap in snapshot.children.allObjects as! [DataSnapshot]{
                guard let dictionary = snap.value as? [String : AnyObject] else {
                    return
                }
            }
        })
        databaseRef.child("driverdetails").observe(.value, with:{
            snapshot in
            print(snapshot)
            
            for snap in snapshot.children.allObjects as! [DataSnapshot]{
                guard let dictionary = snap.value as? [String : AnyObject] else {
                    return
                }
            }
        })
    }
    
    @IBOutlet weak var menubutton: UIBarButtonItem!
    @IBOutlet weak var profile: UIButton!
    @IBOutlet weak var cardetails: UIButton!
    @IBOutlet weak var bankinfo: UIButton!
    @IBOutlet weak var imgview: UIImageView!
    //@IBOutlet weak var location: UITextField!
    @IBOutlet weak var switchcolor: UISwitch!
    @IBOutlet weak var driverinfo: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func changeState(_ sender: Any) {
        if(switchcolor.isOn)
        {
            mapview.isHidden=false;
            view.backgroundColor=UIColor.green;
            
        }else{
           mapview.isHidden=true;
            view.backgroundColor=UIColor.red;
        }
        
    }
    @IBAction func viewMenu(_ sender: Any) {
        if(imgview.isHidden){
            
            imgview.isHidden=false;
            profile.isHidden=false;
            bankinfo.isHidden=false;
            driverinfo.isHidden=false;
            cardetails.isHidden=false;
        }
        
        else{
            profile.isHidden=true;
            bankinfo.isHidden=true;
            driverinfo.isHidden=true;
            cardetails.isHidden=true;
            imgview.isHidden=true;
    }
  }
}
