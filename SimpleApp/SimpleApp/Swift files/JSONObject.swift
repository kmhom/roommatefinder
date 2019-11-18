//
//  JSONObject.swift
//  SimpleApp
//
//  Created by akshay on 11/4/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import Foundation

struct JSONObject: Codable{
    let name: String
    let age: String
    let gender: String
    let major: String
    let year: String
    let dormChoice: String
    let roomType: String
    let bedTime: String
    let wakeupTime: String
    let inviteGuests: String
    let outgoingness: Int
    let shareBelongings: Int
    let neatness: Int
    let noisiness: Int
    let hobbies: String
    let roommateBedTime: String
    let rommateWakeUpTime: String
    let roommateInviteGuests: String
    let roommateOutgoingness: Int
    let roommateShareBelongings: Int
    let roommateNeatness: Int
    let roommateNoisiness: Int
}
