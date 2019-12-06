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
    var personArray = [GETPersonObject]()
    let dispatchGroup = DispatchGroup()
    var bedTime:String!
    var wakeupTime:String!
    var idAppendedToGet: String!
    
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
            "aboutRoommateWakeUpTime": jsonFromPreviousPage["RoommateWakeupTime"]!,
            "aboutRoomateGuest":jsonFromPreviousPage["RoommateGuests"]!,
            "aboutRoommateIntrovertedOutgoing": jsonFromPreviousPage["RoommateOutgoing"]!,
            "aboutRoommateShareStuffKeepStuff":jsonFromPreviousPage["RoommateBelongings"]!,
            "aboutRoommateMessyOrganized": jsonFromPreviousPage["RoommateNeat"]!,
            "aboutRoommateQuietLoud":  jsonFromPreviousPage["RoommateNoisy"]!,
            "aboutRoommateAdditionalReq": ""
        ]
        self.makePOSTRequest(personDictionary: personDictionary)
        print("this is our id right after the post method is done : \(idAppendedToGet)")
        self.makeGETRequest(id: idAppendedToGet)
        print("Get and post tasks have been completed, print to assure they are not  nil")
        print(self.personArray)
        let matchedUsersVC = self.storyboard?.instantiateViewController(withIdentifier: "TabbedBar") as! TabbedBarController
        matchedUsersVC.modalPresentationStyle = .fullScreen
        matchedUsersVC.personArray = self.personArray
        self.present(matchedUsersVC, animated:true)
}
    func makePOSTRequest(personDictionary: Dictionary<String,String>) {
        print("first enter within post")
        dispatchGroup.enter()
            print(JSONSerialization.isValidJSONObject(personDictionary))
            guard let uploadData = try? JSONEncoder().encode(personDictionary) else{
                return
            }
                print(uploadData)
                let url = URL(string: "https://scuroommatefinder.herokuapp.com/api/createUsers")!
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
                if let error = error{
                    print("error: \(error)")
                    return
                }
                let response = response as? HTTPURLResponse
                if let mimeType = response!.mimeType,
                mimeType == "application/json",
                let data = data,
                    let dataString = String(data:data, encoding: .utf8){
                    print("got data: \(dataString)")
                    self.idAppendedToGet = dataString
                    print("first leave within post")
                    self.dispatchGroup.leave()
                }
            }
            task.resume()
        dispatchGroup.wait()
        print("this is our id right after the post method closure\(idAppendedToGet)")
    }
    func makeGETRequest(id: String!){
        dispatchGroup.enter()
        print("second enter within get")
        print("this is the id that the matching algorithm will match to:\(id)")
        var todoEndpoint: String! = "https://scuroommatefinder.herokuapp.com/api/users/getMatches/"
        todoEndpoint += id
        todoEndpoint = todoEndpoint.replacingOccurrences(of: "\"", with: "")
        todoEndpoint = String(todoEndpoint)
        print(todoEndpoint!)
        guard let url = URL(string: todoEndpoint!) else{
                print("Error: cannot create URL")
            return
            }
             var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: urlRequest){
                (data, response, error) in
                guard error == nil else {
                    print("Error calling GET")
                    print(error!)
                    return
                }
               let responseDataString = String(data: data!, encoding:  String.Encoding.utf8)?.replacingOccurrences(of: "\\", with: "")
                print("response data: ")
                print(responseDataString!)
                
                let data = responseDataString?.data(using: .utf8)!
                print("printing data")
                print(data)
                do{
                    if let jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String:Any]]{
                          print("this is the jsonArray: \(jsonArray)")
                        self.personArray = self.parseThroughArray(JSONArray: jsonArray)
                        print("this is the  final personArray to used through delegates \(self.personArray)")
                    }else {print("bad json")}
                } catch let error as NSError{
                    print(error)
                }
                var jsonError: NSError?
                do{
                    print("Error: \(jsonError)")
                }
                print("second leave within post")
                self.dispatchGroup.leave()
            }
            task.resume()
        dispatchGroup.wait()
    }
    
    func parseThroughArray(JSONArray: [[String:Any]]) -> [GETPersonObject]{
        var  personArray = [GETPersonObject]()
        for jsonObject in JSONArray{
            personArray.append(GETPersonObject.init(personObject: jsonObject))
        }
        return personArray
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
