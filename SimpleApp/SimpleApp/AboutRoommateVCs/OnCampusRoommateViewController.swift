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

    lazy var jsonFromPreviousPage: [String: String] = [:]
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
        let finalOutgoingOrNot = String(round(introOrExtroSlider.value))
        let finalBelongingsOrNot = String(round(belongingsSlider.value))
        let finalNeatOrNot = String(round(neatnessSlider.value))
        let finalNoisyOrNot = String(round(noisinessSlider.value))
        
        let roommateJSON:[String:String] = [   "RoommateBedTime":finalBedTime!,
            "RoommateWakeupTime": finalWakeupTime!,
            "RoommateGuests": finalGuestOrNotValue,
            "RoommateOutgoing": finalOutgoingOrNot,
            "RoommateBelongings": finalBelongingsOrNot,
            "RoommateNeat": finalNeatOrNot,
            "RoommateNoisy": finalNoisyOrNot
            ]
        jsonFromPreviousPage += roommateJSON
        let personDictionary : Dictionary<String,String> = [
            "ftux": "False",
            "firstName": jsonFromPreviousPage["Name"]!,
            "lastName":"TestMan",
            "email":"akshprab@gmail.com",
            "token":"GOOGLE_TOKEN_123532",
            "gender": jsonFromPreviousPage["Gender"]!,
            "age": jsonFromPreviousPage["Age"]!,
            "grade": jsonFromPreviousPage["Year"]!,
            "major": jsonFromPreviousPage["Major"]!,
            "aboutMeCampusLiving": "On",
            "aboutMeDorm": jsonFromPreviousPage["Dorm"]!,
            "aboutMeRoomType": jsonFromPreviousPage["RoomType"]!,
            "aboutMeBedTime": jsonFromPreviousPage["BedTime"]!,
            "aboutMeWakeUpTime": jsonFromPreviousPage["WakeUpTime"]!,
            "aboutMeGuests": jsonFromPreviousPage["Guests"]!,
            "aboutMeIntrovertedOutgoing": jsonFromPreviousPage["Outgoing"]!,
            "aboutMeShareStuffKeepStuff": jsonFromPreviousPage["Belongings"]!,
            "aboutMeMessyOrganized": jsonFromPreviousPage["Neat"]!,
            "aboutMeQuietLoud": jsonFromPreviousPage["Noisy"]!,
            "aboutMeHobbies": jsonFromPreviousPage["Hobbies"]!,
            "aboutMeIdealAccomodation": "",
            "aboutMeHousingType": "",
            "aboutMeDistanceFromSCU": "",
            "aboutMeCar": "",
            "aboutMePet":"",
            "aboutMeRentBudget":"",
            "aboutRoommateBedTime":jsonFromPreviousPage["RoommateBedTime"]!,
            "aaboutRoommateWakeUpTime": jsonFromPreviousPage["RoommateWakeupTime"]!,
            "aboutRoomateGuest":jsonFromPreviousPage["RoommateGuests"]!,
            "aboutRoommateIntrovertedOutgoing": jsonFromPreviousPage["RoommateOutgoing"]!,
            "aboutRoommateShareStuffKeepStuff":jsonFromPreviousPage["RoommateBelongings"]!,
            "aboutRoommateMessyOrganized": jsonFromPreviousPage["RoommateNeat"]!,
            "aboutRoommateQuietLoud":  jsonFromPreviousPage["RoommateNoisy"]!,
            "aboutRoommateAdditionalReq": ""
        ]
        print(personDictionary)

            print(JSONSerialization.isValidJSONObject(personDictionary))
        guard let uploadData = try? JSONEncoder().encode(personDictionary) else{
            
            
            return
    
            
        }
            print(uploadData)
            let url = URL(string: "https://scuroommatefinder.herokuapp.com/api/users")!
            //let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            if let error = error{
                print("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else{
                    return
            }
            if let mimeType = response.mimeType,
            mimeType == "application/json",
            let data = data,
                let dataString = String(data:data, encoding: .utf8){
                print("got data: \(dataString)")
            }
        }
        task.resume()
        
//            let session = URLSession.shared.dataTask(with: request)
//            {data, response, error in //request closure
//
//                guard let data = data, error == nil else {
//                    print(error?.localizedDescription ?? "No data")
//                    return
//                }
//                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//                if let responseJSON = responseJSON as? [String: String]{
//                    print(responseJSON)
//                }
//
//            }
//            session.resume()
                
    
 
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
