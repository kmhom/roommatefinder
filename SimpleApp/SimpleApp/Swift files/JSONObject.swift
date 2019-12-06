//
//  JSONObject.swift
//  SimpleApp
//
//  Created by akshay on 11/4/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import Foundation

struct PersonObject {
    let ftux: Any
    let firstName: Any
    let lastName: Any
    let email: Any
    let token: Any
    let gender: Any
    let age: Any
    let grade: Any
    let major: Any
    let aboutMeCampusLiving: Any
    let aboutMeDorm: Any
    let aboutMeRoomType: Any
    let aboutMeBedTime: Any
    let aboutMeWakeupTime: Any
    let aboutMeGuests: Any
    let aboutMeIntrovertedOutgoing: Any
    let aboutMeShareStuffKeepStuff: Any
    let aboutMeMessyOrganized: Any
    let aboutMeQuietLoud: Any
    let aboutMeHobbies: Any
    let aboutMeIdealAccommodation: Any
    let aboutMeHousingType: Any
    let aboutMeDistanceFromSCU: Any
    let aboutMeCar: Any
    let aboutMePet: Any
    let aboutMeRentBudget: Any
    let aboutRoommateBedTime: Any
    let aboutRoommateWakeUpTime: Any
    let aboutRoommateGuest: Any
    let aboutRoommateIntrovertedOutgoing: Any
    let aboutRoommateShareStuffKeepStuff: Any
    let aboutRoommateMessyOrganized: Any
    let aboutRoommateQuietLoud: Any
    let aboutRoommateAdditionalReq: Any
    init() {
        self.ftux = ""
        self.firstName = ""
        self.lastName = ""
        self.email =  ""
        self.token = ""
        self.gender = ""
        self.age = 0
        self.grade = ""
        self.major = ""
        self.aboutMeCampusLiving = ""
        self.aboutMeDorm = ""
        self.aboutMeRoomType = ""
        self.aboutMeBedTime = ""
        self.aboutMeWakeupTime = ""
        self.aboutMeGuests = ""
        self.aboutMeIntrovertedOutgoing = ""
        self.aboutMeShareStuffKeepStuff = ""
        self.aboutMeMessyOrganized = ""
        self.aboutMeQuietLoud = ""
        self.aboutMeHobbies = ""
        self.aboutMeIdealAccommodation = ""
        self.aboutMeHousingType = ""
        self.aboutMeDistanceFromSCU = ""
        self.aboutMeCar = ""
        self.aboutMePet = ""
        self.aboutMeRentBudget = 0
        self.aboutRoommateBedTime = ""
        self.aboutRoommateWakeUpTime = ""
        self.aboutRoommateGuest = ""
        self.aboutRoommateIntrovertedOutgoing = ""
        self.aboutRoommateShareStuffKeepStuff = ""
        self.aboutRoommateMessyOrganized = ""
        self.aboutRoommateQuietLoud = ""
        self.aboutRoommateAdditionalReq = ""
        
    }
    init(personObject: Dictionary<String,Any>) {
        self.ftux = personObject["ftux"]! as Any
        self.firstName = personObject["firstName"]! as Any
        self.lastName = personObject["lastName"]! as Any
        self.email =  personObject["email"]! as Any
        self.token = personObject["_id"]! as Any
        self.gender = personObject["gender"]! as Any
        self.age = personObject["age"]! as Any
        self.grade = personObject["grade"]! as Any
        self.major = personObject["major"]! as Any
        self.aboutMeCampusLiving = personObject["aboutMeCampusLiving"]! as Any
        self.aboutMeDorm = personObject["aboutMeDorm"]! as Any
        self.aboutMeRoomType = personObject["aboutMeRoomType"]! as Any
        self.aboutMeBedTime = personObject["aboutMeBedTime"]! as Any
        self.aboutMeWakeupTime = personObject["aboutMeWakeUpTime"]! as Any
        self.aboutMeGuests = personObject["aboutMeGuests"]! as Any
        self.aboutMeIntrovertedOutgoing = personObject["aboutMeIntrovertedOutgoing"]! as Any
        self.aboutMeShareStuffKeepStuff = personObject["aboutMeShareStuffKeepStuff"]! as Any
        self.aboutMeMessyOrganized = personObject["aboutMeMessyOrganized"]! as Any
        self.aboutMeQuietLoud = personObject["aboutMeQuietLoud"]! as Any
        self.aboutMeHobbies = personObject["aboutMeHobbies"]! as Any
        self.aboutMeIdealAccommodation = personObject["aboutMeIdealAccommodation"] as! Any ?? ""
        self.aboutMeHousingType = personObject["aboutMeHousingType"]! as Any
        self.aboutMeDistanceFromSCU = personObject["aboutMeDistanceFromSCU"]! as Any
        self.aboutMeCar = personObject["aboutMeCar"]! as Any
        self.aboutMePet = personObject["aboutMePet"]! as Any
        self.aboutMeRentBudget = personObject["aboutMeRentBudget"]! as Any
        self.aboutRoommateBedTime = personObject["aboutRoommateBedTime"]! as Any
        self.aboutRoommateWakeUpTime = personObject["aboutRoommateWakeUpTime"]! as Any
        self.aboutRoommateGuest = personObject["aboutRoommateGuest"] as? Any ?? ""
        self.aboutRoommateIntrovertedOutgoing = personObject["aboutRoommateIntrovertedOutgoing"]! as Any
        self.aboutRoommateShareStuffKeepStuff = personObject["aboutRoommateShareStuffKeepStuff"]! as Any
        self.aboutRoommateMessyOrganized = personObject["aboutRoommateMessyOrganized"]! as Any
        self.aboutRoommateQuietLoud = personObject["aboutRoommateQuietLoud"]! as Any
        self.aboutRoommateAdditionalReq = personObject["aboutRoommateAdditionalReq"]! as Any
    }
}

struct GETPersonObject{
    let firstName: Any
    let lastName: Any
    let gender: Any
    let age: Any
    let grade: Any
    let major: Any
    let aboutMeHobbies: Any
    let aboutMeCampusLiving: Any
    init(){
        self.firstName = ""
        self.lastName = ""
        self.gender = ""
        self.age = 0
        self.grade = ""
        self.major = ""
        self.aboutMeHobbies = ""
        self.aboutMeCampusLiving = ""
        
    }
    init(personObject: Dictionary<String,Any>){
        self.firstName = personObject["firstName"]! as Any
        self.lastName = personObject["lastName"]! as Any
        self.gender = personObject["gender"]! as Any
        self.age = personObject["age"]! as Any
        self.grade = personObject["grade"]! as Any
        self.major = personObject["major"]! as Any
        self.aboutMeHobbies = personObject["aboutMeHobbies"]! as Any
        self.aboutMeCampusLiving = personObject["aboutMeCampusLiving"]! as Any
    }

}
