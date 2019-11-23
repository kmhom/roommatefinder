//
//  OnCampusAboutMeViewController.swift
//  SimpleApp
//
//  Created by akshay on 10/25/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit



class OnCampusAboutMeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    lazy var jsonFromPreviousPage: [String : String] = [:]
    
    
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        dormPicker?.delegate = self
        roomTypePicker?.delegate = self
        dormPicker?.dataSource = self
        roomTypePicker?.dataSource = self
        dormPickerData = ["Graham Hall", "Campisi Hall","Finn Hall", "Swig Hall", "Casa Italiana", "Sobrato Hall", "Dunne Hall", "McLaughlin-Walsh Hall", "Sanfilippo Hall"]
        roomTypePickerData = ["Single", "Double", "Suite"]
        dormPickerSelection = dormPickerData[0]
        roomTypePickerSelection  = roomTypePickerData[0]
       let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let yourDate = formatter.date(from: "00:00")
        wakeupTimePicker.setDate(yourDate!, animated: false)
        bedTimePicker.setDate(yourDate!, animated: false)
        formatter.dateFormat = "HH:mm"
        wakeupTime = formatter.string(from: yourDate!)
        bedTime = formatter.string(from: yourDate!)
        
       
        self.hobbiesTextView?.layer.borderWidth = 1
    self.hobbiesTextView?.layer.borderColor = UIColor.gray.cgColor
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
         let finalDormSelection = dormPickerSelection
         let finalRoomTypeSelection = roomTypePickerSelection
        let finalBedTime = self.bedTime
        let  finalWakeupTime = self.wakeupTime
            
        guard let finalGuestOrNotValue = guestSegmentedControl.titleForSegment(at: guestSegmentedControl.selectedSegmentIndex)
            else {return}
        //slider values are guaranteed to never be nil
        let finalOutgoingOrNot = String(round(outgoingSlider.value))
        let finalBelongingsOrNot = String(round(belongingsSlider.value))
        let finalNeatOrNot = String(round(neatnessSlider.value))
        let finalNoisyOrNot = String(round(noisinessSlider.value))
        guard let finalHobbies = hobbiesTextView.text
            else {return}
        let onCampusJSON:[String:String] = [
            "Dorm": finalDormSelection!,
            "RoomType": finalRoomTypeSelection!,
            "BedTime": finalBedTime!,
            "WakeUpTime": finalWakeupTime!,
            "Guests":finalGuestOrNotValue,
            "Outgoing":finalOutgoingOrNot,
            "Belongings":finalBelongingsOrNot,
            "Neat":finalNeatOrNot,
            "Noisy":finalNoisyOrNot,
            "Hobbies":finalHobbies
        ]
        print("previous page json")
        self.jsonFromPreviousPage += onCampusJSON
        //should contain everything
        print(jsonFromPreviousPage)
        
        let aboutRoommateVC = self.storyboard?.instantiateViewController(withIdentifier:"OnCampusAboutRoommate") as! OnCampusRoommateViewController
        aboutRoommateVC.jsonFromPreviousPage = self.jsonFromPreviousPage
        aboutRoommateVC.modalPresentationStyle = .fullScreen
        
        present(aboutRoommateVC, animated:true)
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
