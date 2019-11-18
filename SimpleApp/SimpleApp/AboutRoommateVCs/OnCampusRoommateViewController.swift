//
//  OnCampusRoommateViewController.swift
//  SimpleApp
//
//  Created by akshay on 11/12/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import UIKit

//no protocols needed
class OnCampusRoommateViewController: UIViewController  {

    lazy var jsonFromPreviousPage: [String: Any] = [:]
    var bedTime:String!
    var wakeupTime:String!
    
    @IBOutlet var roommateBedTimePicker: UIDatePicker!
    @IBOutlet var roommateWakeupTimePicker: UIDatePicker!
    @IBOutlet var guestsSegmentedControl: UISegmentedControl!
    @IBOutlet var introOrExtroSlider: UISlider!
    @IBOutlet var belongingsSlider: UISlider!
    @IBOutlet var neatnessSlider: UISlider!
    @IBOutlet var noisinessSlider: UISlider!
    
    @IBOutlet var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let yourDate = formatter.date(from: "00:00")
        formatter.dateFormat = "HH:mm"
    
    roommateBedTimePicker.setDate(yourDate!, animated: true)
        roommateWakeupTimePicker.setDate(yourDate!, animated: true)
        
        wakeupTime = formatter.string(from: yourDate!)
        bedTime = formatter.string(from: yourDate!)
    }

    @IBAction func submitAction(_ sender: Any) {
        let finalBedTime = self.bedTime
        let finalWakeupTime = self.wakeupTime
            
        guard let finalGuestOrNotValue = guestsSegmentedControl.titleForSegment(at: guestsSegmentedControl.selectedSegmentIndex)
            else {return}
        //slider values are guaranteed to never be nil
        let finalOutgoingOrNot = Int(round(introOrExtroSlider.value))
        let finalBelongingsOrNot = Int(round(belongingsSlider.value))
        let finalNeatOrNot = Int(round(neatnessSlider.value))
        let finalNoisyOrNot = Int(round(noisinessSlider.value))
        
        let roommateJSON:[String:Any] = [   "RoommateBedTime":finalBedTime!,
            "RoommateWakeupTime": finalWakeupTime!,
            "RoommateGuests": finalGuestOrNotValue,
            "RoommateOutgoing": finalOutgoingOrNot,
            "RoommateBelongings": finalBelongingsOrNot,
            "RoommateNeat": finalNeatOrNot,
            "RoommateNoisy": finalNoisyOrNot
            ]
        jsonFromPreviousPage += roommateJSON
        let jsonObject = JSONObject(name: jsonFromPreviousPage["Name"] as! String, age: jsonFromPreviousPage["Age"] as! String, gender: jsonFromPreviousPage["Gender"] as! String, major: jsonFromPreviousPage["Major"] as! String, year: jsonFromPreviousPage["Year"] as! String, dormChoice: jsonFromPreviousPage["Dorm"] as! String, roomType: jsonFromPreviousPage["RoomType"] as! String, bedTime: jsonFromPreviousPage["BedTime"] as! String, wakeupTime: jsonFromPreviousPage["WakeUpTime"] as! String, inviteGuests: jsonFromPreviousPage["Guests"] as! String, outgoingness: jsonFromPreviousPage["Outgoing"] as! Int, shareBelongings: jsonFromPreviousPage["Belongings"] as! Int, neatness: jsonFromPreviousPage["Neat"] as! Int, noisiness: jsonFromPreviousPage["Noisy"] as! Int, hobbies: jsonFromPreviousPage["Hobbies"] as! String, roommateBedTime: jsonFromPreviousPage["RoommateBedTime"] as! String, rommateWakeUpTime: jsonFromPreviousPage["RoommateWakeupTime"] as! String, roommateInviteGuests: jsonFromPreviousPage["RoommateGuests"] as! String, roommateOutgoingness: jsonFromPreviousPage["RoommateOutgoing"] as! Int, roommateShareBelongings: jsonFromPreviousPage["RoommateBelongings"] as! Int, roommateNeatness: jsonFromPreviousPage["RoommateNeat"] as! Int, roommateNoisiness: jsonFromPreviousPage["RoommateNoisy"] as! Int)
        

        //let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject)
        let encoder = JSONEncoder()
        do {
            let result = try encoder.encode(jsonObject)
            if let resultString = String(data: result, encoding: .utf8){
                print(resultString)
            }
            let url = URL(string:
                       "https://scuroommatefinder.herokuapp.com/api/users")!
                   var request = URLRequest(url: url)
                   request.httpMethod = "POST"
                   request.httpBody = result
                   let task = URLSession.shared.dataTask(with: request){
                       data, response, error in
                       guard let data = data, error == nil else{
                           print(error?.localizedDescription ?? "No data")
                           return
                       }
                       let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                       if let responseJSON = responseJSON as? [String: Any]{
                           print(responseJSON)
                       }
                   }
             task.resume()
        }
            catch{
                print(error)
            }
    }
    @IBAction func wakeupPickerChanged(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        bedTime = timeFormatter.string(from: sender.date)
        
    }
    @IBAction func bedTimePickerChanged(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
                      timeFormatter.dateFormat = "HH:mm"
               wakeupTime = timeFormatter.string(from: sender.date)
    }
}
