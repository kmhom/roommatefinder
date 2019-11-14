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
    
    @IBOutlet var roommateBedTimePicker: UIDatePicker!
    @IBOutlet var roommateWakeupTimePicker: UIDatePicker!
    @IBOutlet var guestsSegmentedControl: UISegmentedControl!
    @IBOutlet var introOrExtroSlider: UISlider!
    @IBOutlet var neatnessSlider: UISlider!
    @IBOutlet var noisinessSlider: UISlider!
    
    @IBOutlet var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitAction(_ sender: Any) {
        
    }
}
