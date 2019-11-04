//
//  OnCampusAboutMeViewController.swift
//  SimpleApp
//
//  Created by akshay on 10/25/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit



class OnCampusAboutMeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var anchorView: UIView!
    
    @IBOutlet weak var dormPicker: UIPickerView!
    @IBOutlet weak var roomTypePicker: UIPickerView!
    
    
    var dormPickerData: [String] = [String]()
    var roomTypePickerData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dormPicker.delegate = self
        self.roomTypePicker.delegate = self
        self.dormPicker.dataSource = self
        self.roomTypePicker.dataSource = self
        
        dormPickerData = ["Graham Hall", "Campisi Hall","Finn Hall", "Swig Hall", "Casa Italiana", "Sobrato Hall", "Dunne Hall", "McLaughlin-Walsh Hall", "Sanfilippo Hall"]
        
        roomTypePickerData = ["Single", "Double", "Suite"]
        
        
        
    

        
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == dormPicker{
            return dormPickerData.count
        }
        else if(pickerView == roomTypePicker){
            return roomTypePickerData.count
        }
        else {
            return 0
        }
      }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == dormPicker){ return dormPickerData[row]
       }
        else if(pickerView ==
            roomTypePicker){
            return roomTypePickerData[row]
        }
        else {
            return nil
        }
    }
}
