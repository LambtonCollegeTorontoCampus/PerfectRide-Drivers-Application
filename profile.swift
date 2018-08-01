//
//  profile.swift
//  PerfectRide
//
//  Created by Suma Priya on 2018-05-23.
//  Copyright © 2018 Suma Priya. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import RealmSwift

class profile : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var firstname: UITextField!
    
    @IBOutlet var lastname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func takephoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: " Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
            else{
                print("Camera not available")
            }
        
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
            }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    @IBAction func savedata(_ sender: Any) {
        grabdata();
    }
    //
    func grabdata(){
        
        var databaseRef = Database.database().reference()
        let data = ["firstname": firstname.text!,"lastname": lastname.text!];
        databaseRef.child("profile").child(firstname.text!).setValue(data)
    }
//
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let  image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func  imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
}

