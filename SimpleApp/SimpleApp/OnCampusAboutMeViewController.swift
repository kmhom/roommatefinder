//
//  OnCampusAboutMeViewController.swift
//  SimpleApp
//
//  Created by akshay on 10/25/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit



class OnCampusAboutMeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var jsonFromPreviousPage: [String : Any] = [:]
    
    
    
    @IBOutlet weak var anchorView: UIView!
    
    @IBOutlet weak var dormPicker: UIPickerView!
    @IBOutlet weak var roomTypePicker: UIPickerView!
    @IBOutlet weak var bedTimePicker: UIDatePicker!
    @IBOutlet weak var wakeupTimePicker: UIDatePicker!
    @IBOutlet weak var guestSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outgoingSlider: UISlider!
    @IBOutlet weak var belongingsSlider: UISlider!
    @IBOutlet weak var neatnessSlider: UISlider!
    @IBOutlet weak var noisinessSlider: UISlider!
    
    @IBOutlet weak var hobbiesTextView: UITextView!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    var dormPickerData: [String] = [String]()
    var roomTypePickerData: [String] = [String]()
    var dormPickerSelection:String!
    var roomTypePickerSelection:String!
    var bedTime:String!
    var wakeupTime:String!
    let basicInfoObject = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.jsonFromPreviousPage)
        
        self.dormPicker.delegate = self
        self.roomTypePicker.delegate = self
        self.dormPicker.dataSource = self
        self.roomTypePicker.dataSource = self
        dormPickerData = ["Graham Hall", "Campisi Hall","Finn Hall", "Swig Hall", "Casa Italiana", "Sobrato Hall", "Dunne Hall", "McLaughlin-Walsh Hall", "Sanfilippo Hall"]
        roomTypePickerData = ["Single", "Double", "Suite"]
       
        self.hobbiesTextView.layer.borderWidth = 1
    self.hobbiesTextView.layer.borderColor = UIColor.gray.cgColor
    }
    @IBAction func bedTimePickerChanged(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        bedTime = timeFormatter.string(from: sender.date)
    }
    
    @IBAction func wakeupPickerChanged(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
               timeFormatter.dateFormat = "HH:mm"
        wakeupTime = timeFormatter.string(from: sender.date)
    }
    
    
    @IBAction func submitActionClicked(_ sender: Any) {
        //ensure no ui element is nil
        guard let finalDormSelection = dormPickerSelection
            else {return}
        guard let finalRoomTypeSelection = roomTypePickerSelection
            else {return}
        guard let finalBedTime = bedTime
            else {return}
        guard let  finalWakeupTime = wakeupTime
            else {return}
        guard let finalGuestOrNotValue = guestSegmentedControl.titleForSegment(at: guestSegmentedControl.selectedSegmentIndex)
            else {return}
        //slider values are guaranteed to never be nil
        let finalOutgoingOrNot = Int(round(outgoingSlider.value))
        let finalBelongingsOrNot = Int(round(belongingsSlider.value))
        let finalNeatOrNot = Int(round(neatnessSlider.value))
        let finalNoisyOrNot = Int(round(noisinessSlider.value))
        guard let finalHobbies = hobbiesTextView.text
            else {return}
        
        let onCampusJSON:[String:Any] = [
            "Dorm": finalDormSelection,
            "RoomType": finalRoomTypeSelection,
            "BedTime": finalBedTime,
            "WakeUpTime": finalWakeupTime,
            "Guests":finalGuestOrNotValue,
            "Outgoing":finalOutgoingOrNot,
            "Belongings":finalBelongingsOrNot,
            "Neat":finalNeatOrNot,
            "Noisy":finalNoisyOrNot,
            "Hobbies":finalHobbies
        ]
        print("previous page json")
        print(jsonFromPreviousPage)
        jsonFromPreviousPage += onCampusJSON
        print(jsonFromPreviousPage)
        
        
    }
    
    
    //PROTOCOL STUBS FOR PICKERVIEW
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent  component: Int) {
        
        if(pickerView == dormPicker){
        dormPickerSelection = dormPickerData[row]
        }
        else if(pickerView == roomTypePicker){
        roomTypePickerSelection = roomTypePickerData[row]
        }
        else{
            return
        }
    }
    

    
}
