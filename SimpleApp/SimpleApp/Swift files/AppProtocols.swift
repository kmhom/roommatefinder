//
//  AppProtocols.swift
//  SimpleApp
//
//  Created by akshay on 11/6/19.
//  Copyright © 2019 Kevin Hom. All rights reserved.
//

import Foundation

protocol JSONTransferDelegateProtocol{
    func sendDataToViewController(myJSONData:[String:Any])
}

//overload += for dictionary
func +=<K,V> (left: inout[K:V], right:[K:V]){
    for(k,v) in right{
        left[k] = v
    }
}
