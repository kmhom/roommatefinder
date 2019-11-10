//
//  JSONObject.swift
//  SimpleApp
//
//  Created by akshay on 11/4/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import Foundation

struct JSONObject: Codable{
    let dormChoice: String //1
    let roomType: String //2
    let bedTime: String //3
    let wakeupTime: String //4
    let inviteGuests: String //5
    let outgoingness: Int //6, slider value
    let shareBelongings: Int //7
    let neatness: Int //8
    let noisiness: Int //9
    let hobbies: String //10
}
